#!/usr/bin/env python
# -*- coding: utf-8 -*-

import webapp2
import logging
from google.appengine.api import memcache

from os.path import (join, dirname)
from webapp2_extras.jinja2 import jinja2
from data import (EVENT_TYPES,
                  GENDERS,
                  TRAVEL_DAYS,
                  DESTINATION_TYPES,
                  WEATHER_TYPES)

from data import get_needs

TEMPLATES_DIR = join(dirname(__file__), "templates")
JINJA_ENV = jinja2.Environment(loader=jinja2.FileSystemLoader(TEMPLATES_DIR))
CACHING_ON = True


# - Helpers -------------------------------------------------------------------

def render(template_name, context, stream):
    stream.write(JINJA_ENV.get_template(template_name).render(**context))


def checklist_cache_key(*args):
    return 'checklist:%s' % (':'.join(args))

# - Handlers ------------------------------------------------------------------


class MainView(webapp2.RequestHandler):
    def get(self):
        return render('main.html', {
            'genders': GENDERS,
            'travel_days': TRAVEL_DAYS,
            'destination_types': DESTINATION_TYPES,
            'event_type_groups': [EVENT_TYPES.items()[:2],
                                  EVENT_TYPES.items()[2:]],
            'weather_types': WEATHER_TYPES,
        }, self.response.out)


class ListView(webapp2.RequestHandler):
    def render_checklist(self, gender, travel_days, destination_type,
                         event_type, weather_type):
        grouped_needs = get_needs(gender, destination_type, event_type,
                                  weather_type, travel_days)          
        description = \
            u'Cinsiyet: %s / Süre: %s / Hedef: %s / Etkinlik: %s / Hava: %s' % \
            (GENDERS[gender], TRAVEL_DAYS[int(travel_days)],
             DESTINATION_TYPES[destination_type],
             EVENT_TYPES[event_type], WEATHER_TYPES[weather_type])

        url = 'cinsiyet/%s/sure/%s/hedef/%s/etkinlik/%s/hava/%s/' % (
            gender, travel_days, destination_type,
            event_type, weather_type)

        return JINJA_ENV.get_template('checklist.html').render({
            'gender': gender,
            'description': description,
            'travel_days': travel_days,
            'destination_type': destination_type,
            'event_type': event_type,
            'weather_type': weather_type,
            'grouped_needs': grouped_needs,
            'url': url})

    def get(self, gender, travel_days, destination_type, event_type,
            weather_type):

        if not (gender in GENDERS and int(travel_days) in TRAVEL_DAYS and
                destination_type in DESTINATION_TYPES and event_type in
                EVENT_TYPES and weather_type in WEATHER_TYPES):
            self.error(404)
            self.response.out.write('Aradığınız listeleme parametrelerinde '
                                    'bir anormallik var. Geri dönüp tekrar '
                                    'deneyin.')
            return

        cache_key = checklist_cache_key(
            gender, travel_days, destination_type, event_type, weather_type)

        checklist = memcache.get(cache_key)
        if not checklist:
            print 'rendered'
            checklist = self.render_checklist(gender, travel_days,
                                              destination_type, event_type,
                                              weather_type)
            if not memcache.add(cache_key, checklist):
                logging.error('Memcache set failed.')

        self.response.out.write(checklist)


app = webapp2.WSGIApplication([
    (r'/', MainView),
    (r'/cinsiyet/(\w+)/sure/(\w+)/hedef/(\w+)/etkinlik/(\w+)/hava/(\w+)/',
     ListView)
])
