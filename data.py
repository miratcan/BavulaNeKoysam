#!/usr/bin/env python
# -*- coding: utf-8 -*-

import copy
import math
import collections

GENDERS = {
    'erkek': u'Erkek',
    'kadin': u'Kadın',
}

ITEMS = {
    'gunes_gozlugu': u'Güneş gözlüğü',
    'gunes_koruyuc_krem': u'Güneşten Koruyucu Krem',
    'gunes_yagi': u'Güneş Yağı',
    'sort': u'Şort',
    'corap': u'Çorap',
    'soket_corap': u'Soket Çorap',
    'tshirt': u'Tshirt',
    'kazak': u'Kazak',
    'gomlek': u'Gömlek',
    'yun_gomlek': u'Yün Gömlek',
    'kravat': u'Kravat',
    'pantolon': u'Pantolon',
    'yun_pantolon': u'Yün Pantolon',
    'kargo_pantolon': u'Kargo Pantolon',
    'ayakkabi': u'Ayakkabı',
    'topuklu_ayakkabi': u'Topuklu Ayakkabı',
    'dopiyes': u'Döpiyes',
    'atlet_fanila': u'Atlet/Fanila',
    'termal_iclik': u'Termal İçlik',
    'pijama': u'Pijama',
    'esofman': u'Eşofman',
    'bluz': u'Bluz',
    'etek': u'Etek',
    'elbise': u'Elbise',
    'kapsonlu_polar': u'Kapşonlu Polar',
    'bocek_kovucu_sprey': u'Böcek Kovucu Sprey',
    'sapka': u'Şapka',
    'kagit_havlu': u'Kağıt Havlu',
    'islak_medil': u'İslak mendil',
    'deodorant': u'Deodorant',
    'parfum': u'Parfüm',
    'gunluk_ped': u'Günlük Ped',
    'hijyenik_ped': u'Hijyenik Ped',
    'mide_ilaci': u'Mide ilacı',
    'ishal_ilaci': u'İshal ilacı',
    'boxer': u'Boxer',
    'kulot': u'Külot',
    'mayo': u'Mayo',
    'bikini': u'Bikini',
    'pareo': u'Pareo',
    'plaj_havlusu': u'Plaj Havlusu',
    'plaj_cantasi': u'Plaj Çantası',
    'spor_ayakkabi': u'Spor ayakkabı',
    'terlik': u'Terlik',
    'sandalet_terlik': u'Sandalet/Terlik',
    'kimlik_karti': u'Kimlik kartı',
    'arac_ehliyeti': u'Araç Ehliyeti',
    'arac_ruhsati': u'Araç Ruhsatı',
    'pasaport': u'Pasaport',
    'vize': u'Vize',
    'para': u'Nakit para',
    'agri_kesici': u'Ağrı kesici',
    'sampuan': u'Şampuan',
    'banyo_sabunu': u'Banyo Sabunu',
    'el_sabunu': u'El Sabunu',
    'nemlendirici_krem': u'Nemlendirici Krem',
    'tuvalet_kagidi': u'Tuvalet Kağıdı',
    'mont': u'Mont',
    'dis_fircasi': u'Diş Fırçası',
    'dis_macunu': u'Diş Macunu',
    'tras_bicagi': u'Traş Bıçağı',
    'tras_kopugu': u'Traş Köpüğü',
    'kitap': u'Kitap',
    'kupe': u'Küpe',
    'telefon': u'Telefon',
    'telefon_sarji': u'Telefon İçin Şarj Aleti',
    'harita': u'Harita',
    'pusula': u'Pusula',
    'dudak_merhemi': u'Dudak Merhemi',
    'kafa_feneri': u'Kafa Feneri',
    'el_feneri': u'El Feneri',
    'pil': u'Ekstra Pil',
    'ilkyardim_cantasi': u'İlkyardım Çantası',
    'cakmak_kibrit': u'Çakmak/Kibrit',
    'uyku_tulumu': u'Uyku Tulumu',
    'mat': u'Mat',
    'kamp_yastigi': u'Kamp Yastığı',
    'yuruyus_bastonu': u'Yürüyüş Bastonu',
    'duduk': u'Acil Durum Düdüğü',
    'su_kabi': u'Su Kabı',
    'su_filtresi': u'Su Filtresi',
    'konserve_yiyecek': u'Konserve Yiyecek',
    'ocak': u'Ocak',
    'ocak_yakiti': u'Ocak İçin Yakıt',
    'pisirme_seti': u'Yemek Pişirme Seti',
    'caki': u'Çakı',
    'izci_bicagi': u'İzci Bıçağı',
    'kayak_montu': u'Kayak Montu',
    'kayak_pantolonu': u'Kayak Pantolonu',
    'kayak_corabi': u'Kayak Çorabı',
    'kayak_eldiveni': u'Kayak Eldiveni',
    'kayak_gozlugu': u'Kayak Gözlüğü',
    'iclik': u'İçlik (Orta Tabaka)',
    'uzun_ic_camasiri': u'Uzun İç Çamaşırı'
}

SUGGESTIONS = {
    'mkf_spor': {'url': 'http://google.com',
                 'text': u'markafoniden ucuz ayakkabı alın'}
}

EVENT_TYPES = {
    'kamp': u'Kamp',
    'plaj': u'Plaj',
    'kayak': u'Kayak',
    'isgezisi': u'İş Gezisi',
}

NEED_TYPES = {
    'cuzdan': u'Cüzdanda Bulunması Gerekenler',
    'giyim': u'Giyim',
    'ilaclar': u'İlaçlar',
    'bakim_hijyen': u'Kişisel Bakım',
    'elektronik': u'Elektronik Eşyalar',
    'belge': u'Belgeler',
    'yeme_icme': u'Yeme İçme',
    'barinma': u'Barınma',
    'diger': u'Diğer'
}

WEATHER_TYPES = {
    'sicak': u'Sıcak',
    'ilik': u'Normal',
    'soguk': u'Soğuk',
}

TRAVEL_DAYS = {
    3: u'3 Gün',
    7: u'1 Hafta',
    15: u'15 Gün'
}

DESTINATION_TYPES = {
    'yurtici': u'Yurtiçi',
    'yurtdisi': u'Yurtdışı'
}

# Note: weather_types and event_type can be a list.

NEEDS = [

    # Generic ----------------------------------------------------------------

    {'type': 'ilaclar',
     'item': 'agri_kesici',
     'total_amount': 1},

    {'type': 'ilaclar',
     'item': 'mide_ilaci',
     'total_amount': 1},

    {'type': 'bakim_hijyen',
     'item': 'parfum',
     'total_amount': 1},

    {'type': 'bakim_hijyen',
     'item': 'deodorant',
     'total_amount': 1},

    {'type': 'bakim_hijyen',
     'item': 'islak_medil',
     'daily_amount': 0.20},

    {'type': 'bakim_hijyen',
     'item': 'dis_fircasi',
     'total_amount': 1},

    {'type': 'bakim_hijyen',
     'item': 'dis_macunu',
     'total_amount': 1},

    {'type': 'cuzdan',
     'item': 'para'},

    {'type': 'cuzdan',
     'item': 'kimlik_karti'},

    {'type': 'cuzdan',
     'item': 'arac_ehliyeti'},

    {'type': 'belge',
     'item': 'arac_ruhsati'},

    {'type': 'elektronik',
     'item': 'telefon',
     'total_amount': 1},

    {'type': 'elektronik',
     'item': 'telefon_sarji',
     'total_amount': 1},

    # Generic (Kadin) --------------------------------------------------------

    {'type': 'bakim_hijyen',
     'gender': 'kadin',
     'item': 'hijyenik_ped'},

    {'type': 'giyim',
     'gender': 'kadin',
     'item': 'kulot',
     'daily_amount': 1},

    {'type': 'bakim_hijyen',
     'gender': 'kadin',
     'item': 'nemlendirici_krem',
     'total_amount': 1},

    # Generic (Erkek) --------------------------------------------------------

    {'type': 'giyim',
     'gender': 'erkek',
     'item': 'boxer',
     'daily_amount': 1,
     'max_amount': 7},

    # Generic (Yurtdisi) -----------------------------------------------------

    {'type': 'belge',
     'item': 'pasaport',
     'destination_type': 'yurtdisi'},

    {'type': 'belge',
     'item': 'vize',
     'destination_type': 'yurtdisi'},

    # Generic (Sicak) --------------------------------------------------------

    {'type': 'ilaclar',
     'item': 'gunes_koruyuc_krem',
     'weather_types': ['sicak'],
     'total_amount': 1},

    {'type': 'bakim_hijyen',
     'item': 'gunes_yagi',
     'weather_types': ['sicak'],
     'event_types': ['plaj', 'kamp'],
     'total_amount': 1},

    {'type': 'giyim',
     'weather_types': ['sicak'],
     'item': 'kapsonlu_polar',
     'description': u'Akşamları soğuk olabilir.',
     'total_amount': 1},

    {'type': 'giyim',
     'item': 'sapka',
     'weather_types': ['sicak']},

    # Generic (Soğuk) --------------------------------------------------------

    {'type': 'giyim',
     'item': 'kazak',
     'weather_types': ['soguk'],
     'total_amount': 4},

    {'type': 'giyim',
     'item': 'mont',
     'weather_types': ['soguk'],
     'event_types': ['plaj', 'kamp', 'isgezisi'],
     'total_amount': 1},

    # Kamp -------------------------------------------------------------------

    {'type': 'ilaclar',
     'item': 'bocek_kovucu_sprey',
     'event_types': ['kamp'],
     'total_amount': 1},

    {'type': 'bakim_hijyen',
     'item': 'kagit_havlu',
     'event_types': ['kamp'],
     'daily_amount': 0.20},

    {'type': 'bakim_hijyen',
     'item': 'tuvalet_kagidi',
     'event_types': ['kamp'],
     'daily_amount': 0.20},

    {'type': 'bakim_hijyen',
     'item': 'el_sabunu',
     'event_types': ['kamp'],
     'daily_amount': 0.20},

    {'type': 'belge',
     'item': 'harita',
     'event_types': ['kamp'],
     'total_amount': 1},

    {'type': 'diger',
     'item': 'pusula',
     'event_types': ['kamp'],
     'total_amount': 1},

    {'type': 'bakim_hijyen',
     'item': 'dudak_merhemi',
     'event_types': ['kamp', 'kayak'],
     'total_amount': 1},

    {'type': 'elektronik',
     'item': 'kafa_feneri',
     'event_types': ['kamp'],
     'total_amount': '1'},

    {'type': 'elektronik',
     'item': 'el_feneri',
     'event_types': ['kamp'],
     'total_amount': '1'},

    {'type': 'elektronik',
     'item': 'pil',
     'event_types': ['kamp'],
     'daily_amount': 0.5},

    {'type': 'ilaclar',
     'item': 'ilkyardim_cantasi',
     'event_types': ['kamp'],
     'total_amount': 1},

    {'type': 'diger',
     'item': 'cakmak_kibrit',
     'event_types': ['kamp']},

    {'type': 'barinma',
     'item': 'uyku_tulumu',
     'event_types': ['kamp'],
     'total_amount': 1},

    {'type': 'barinma',
     'item': 'mat',
     'event_types': ['kamp'],
     'total_amount': 1},

    {'type': 'barinma',
     'item': 'kamp_yastigi',
     'event_types': ['kamp'],
     'total_amount': 2},

    {'type': 'diger',
     'item': 'yuruyus_bastonu',
     'event_types': ['kamp'],
     'total_amount': 1},

    {'type': 'yeme_icme',
     'item': 'su_kabi',
     'event_types': ['kamp'],
     'total_amount': 3},

    {'type': 'yeme_icme',
     'item': 'su_filtresi',
     'event_types': ['kamp'],
     'total_amount': 1},

    {'type': 'yeme_icme',
     'item': 'konserve_yiyecek',
     'event_types': ['kamp'],
     'total_amount': 1},

    {'type': 'yeme_icme',
     'item': 'ocak',
     'event_types': ['kamp'],
     'total_amount': 1},

    {'type': 'yeme_icme',
     'item': 'ocak_yakiti',
     'event_types': ['kamp'],
     'total_amount': 1},

    {'type': 'yeme_icme',
     'item': 'pisirme_seti',
     'event_types': ['kamp'],
     'total_amount': 1},

    {'type': 'diger',
     'item': 'caki',
     'event_types': ['kamp'],
     'total_amount': 1},

    {'type': 'diger',
     'item': 'izci_bicagi',
     'event_types': ['kamp'],
     'total_amount': 1},

    {'type': 'giyim',
     'item': 'kargo_pantolon',
     'event_types': ['kamp'],
     'total_amount': 1},

    {'type': 'giyim',
     'item': 'uzun_ic_camasiri',
     'event_types': ['kamp'],
     'description': u'Geceler soğuk olacaktır.',
     'weather_types': ['ilik']},

    {'type': 'giyim',
     'item': 'uzun_ic_camasiri',
     'event_types': ['kamp'],
     'weather_types': ['soguk'],
     'daily_mount': 0.25},

    {'type': 'giyim',
     'item': 'esofman',
     'event_types': ['kamp'],
     'total_amount': 1},

    {'type': 'giyim',
     'item': 'yun_pantolon',
     'event_types': ['kamp'],
     'weather_types': ['soguk'],
     'total_amount': 2},

    {'type': 'giyim',
     'item': 'yun_gomlek',
     'event_types': ['kamp'],
     'weather_types': ['soguk'],
     'total_amount': 2},

    {'type': 'giyim',
     'item': 'kazak',
     'event_types': ['kamp'],
     'weather_types': ['soguk'],
     'total_amount': 2},

    # Plaj -------------------------------------------------------------------

    {'type': 'ilaclar',
     'item': 'bocek_kovucu_sprey',
     'event_types': ['plaj'],
     'weather_types': ['sicak'],
     'total_amount': 1},

    {'type': 'giyim',
     'gender': 'erkek',
     'item': 'mayo',
     'event_types': ['plaj'],
     'total_amount': 3},

    {'type': 'giyim',
     'gender': 'kadin',
     'item': 'bikini',
     'event_types': ['plaj'],
     'total_amount': 3},

    {'type': 'giyim',
     'gender': 'kadin',
     'item': 'pareo',
     'event_types': ['plaj'],
     'total_amount': 3},

    {'type': 'giyim',
     'gender': 'kadin',
     'weather_types': ['sicak'],
     'event_types': ['plaj'],
     'item': 'etek',
     'daily_amount': 0.35},

    {'type': 'giyim',
     'gender': 'kadin',
     'weather_types': ['sicak'],
     'event_types': ['plaj'],
     'item': 'bluz',
     'daily_amount': 0.35},

    {'type': 'giyim',
     'gender': 'kadin',
     'weather_types': ['sicak'],
     'event_types': ['plaj'],
     'item': 'elbise',
     'daily_amount': 0.14},

    {'type': 'giyim',
     'gender': 'kadin',
     'weather_types': ['sicak'],
     'event_types': ['plaj'],
     'item': 'kupe',
     'daily_amount': 0.28},

    {'type': 'giyim',
     'weather_types': ['sicak'],
     'item': 'tshirt',
     'daily_amount': 1},

    {'type': 'giyim',
     'weather_types': ['sicak'],
     'item': 'sort',
     'event_types': ['plaj'],
     'daily_amount': 0.35},

    {'type': 'giyim',
     'gender': 'erkek',
     'weather_types': ['sicak'],
     'event_types': ['plaj'],
     'item': 'soket_corap',
     'daily_amount': 0.5},

    {'type': 'giyim',
     'gender': 'erkek',
     'event_types': ['plaj'],
     'item': 'gomlek',
     'total_amount': 1},

    {'type': 'giyim',
     'gender': 'erkek',
     'weather_types': ['sicak'],
     'item': 'pantolon',
     'total_amount': 1},

    {'type': 'giyim',
     'weather_types': ['sicak'],
     'item': 'ayakkabi',
     'total_amount': 1},

    {'type': 'giyim',
     'event_types': ['plaj'],
     'weather_types': ['sicak'],
     'item': 'sandalet_terlik',
     'total_amount': 2},

    {'type': 'diger',
     'item': 'kitap',
     'total_amount': 1},

    {'type': 'diger',
     'item': 'plaj_havlusu',
     'event_types': ['plaj'],
     'total_amount': 2},

    {'type': 'diger',
     'item': 'plaj_cantasi',
     'event_types': ['plaj'],
     'total_amount': 1},

    # İşgezisi --------------------------------------------------------------

    {'type': 'giyim',
     'gender': 'erkek',
     'event_types': ['isgezisi'],
     'item': 'gomlek',
     'daily_amount': 1,
     'max_amount': 7},

    {'type': 'giyim',
     'gender': 'erkek',
     'event_types': ['isgezisi'],
     'item': 'kravat',
     'total_amount': 4},

    {'type': 'giyim',
     'gender': 'erkek',
     'event_types': ['isgezisi'],
     'item': 'pantolon',
     'daily_amount': 1,
     'max_amount': 7},

    {'type': 'giyim',
     'gender': 'erkek',
     'item': 'pijama',
     'total_amount': 1},

    {'type': 'giyim',
     'gender': 'erkek',
     'event_types': ['isgezisi'],
     'item': 'corap',
     'daily_amount': 1,
     'max_amount': 7},

    {'type': 'giyim',
     'gender': 'erkek',
     'event_types': ['isgezisi'],
     'item': 'atlet_fanila',
     'daily_amount': 1,
     'max_amount': 7},

    {'type': 'giyim',
     'event_types': ['isgezisi'],
     'item': 'terlik',
     'total_amount': 1},

    {'type': 'giyim',
     'gender': 'erkek',
     'event_types': ['isgezisi'],
     'item': 'ayakkabi',
     'total_amount': 2},

    {'type': 'giyim',
     'gender': 'erkek',
     'event_types': ['isgezisi'],
     'item': 'spor_ayakkabi',
     'total_amount': 1},

    {'type': 'bakim_hijyen',
     'gender': 'erkek',
     'event_types': ['isgezisi'],
     'item': 'tras_bicagi',
     'total_amount': 1},

    {'type': 'bakim_hijyen',
     'gender': 'erkek',
     'event_types': ['isgezisi'],
     'item': 'tras_kopugu',
     'total_amount': 1},

    {'type': 'giyim',
     'gender': 'kadin',
     'event_types': ['isgezisi'],
     'item': 'etek',
     'daily_amount': 1},

    {'type': 'giyim',
     'gender': 'kadin',
     'event_types': ['isgezisi'],
     'item': 'gomlek',
     'daily_amount': 1},

    {'type': 'giyim',
     'gender': 'kadin',
     'event_types': ['isgezisi'],
     'item': 'topuklu_ayakkabi',
     'total_amount': 4},

    {'type': 'giyim',
     'gender': 'kadin',
     'event_types': ['isgezisi'],
     'item': 'dopiyes',
     'total_amount': 1},

    {'type': 'giyim',
     'gender': 'kadin',
     'event_types': ['isgezisi'],
     'item': 'spor_ayakkabi',
     'total_amount': 2},

    # Kayak -----------------------------------------------------------------

    {'type': 'giyim',
     'event_types': ['kayak'],
     'item': 'kayak_montu',
     'total_amount': 2},

    {'type': 'giyim',
     'event_types': ['kayak'],
     'item': 'kayak_pantolonu',
     'total_amount': 2},

    {'type': 'giyim',
     'event_types': ['kayak'],
     'item': 'kayak_corabi',
     'daily_amount': 1,
     'max_amount': 7},

    {'type': 'giyim',
     'event_types': ['kayak'],
     'item': 'kayak_eldiveni',
     'total_amount': 2},

    {'type': 'giyim',
     'event_types': ['kayak'],
     'item': 'kayak_gozlugu',
     'total_amount': 20},

    {'type': 'giyim',
     'event_types': ['kayak'],
     'item': 'iclik',
     'total_amount': 2},

]


def get_needs(gender, destination_type, event_type, weather_types, travel_days):

    _needs = {}

    for need in NEEDS:
        need = copy.copy(need)

        if 'gender' in need:
            if need['gender'] == gender:
                need['gender'] = GENDERS[need['gender']]
            else:
                continue

        if 'destination_type' in need:
            if need['destination_type'] == destination_type:
                need['destination_type'] = DESTINATION_TYPES[
                    need['destination_type']]
            else:
                continue

        if 'event_types' in need:
            if type(need['event_types']) == str:
                need['event_types'] = [need['event_types']]

            if event_type in need['event_types']:
                need['event_types'] = EVENT_TYPES[event_type]
            else:
                continue

        if 'weather_types' in need:
            if weather_types in need['weather_types']:
                need['weather_types'] = WEATHER_TYPES[weather_types]
            else:
                continue

        if 'suggestion' in need:
            need['suggestion'] = SUGGESTIONS[need['suggestion']]

        if 'daily_amount' in need:
            t_days = int(travel_days)
            t_amount = int(math.ceil(need['daily_amount'] * t_days))
            if 'max_amount' in need:
                m_amount = need['max_amount']
                if t_amount > m_amount:
                    if 'notes' not in need:
                        need['notes'] = []
                    need['notes'].append(u'Yıkama imkanı yoksa '
                                         u'%s adet.' % t_amount)
                t_amount = min(t_amount, need['max_amount'])
            need['total_amount'] = t_amount

        need['item'] = ITEMS[need['item']]
        need['type'] = NEED_TYPES[need['type']]

        _needs.setdefault(need['type'], []).append(need)

    return collections.OrderedDict(sorted(_needs.items()))

if __name__ == '__main__':
    import codecs
    with codecs.open("out.txt", "w", "utf-8") as f:
        for gender in GENDERS.keys():
            for event_type in EVENT_TYPES.keys():
                for days in TRAVEL_DAYS.keys():
                    for weather_types in WEATHER_TYPES.keys():
                        for destination_type in DESTINATION_TYPES.keys():
                            grouped_needs = get_needs(gender,
                                                      destination_type,
                                                      event_type,
                                                      weather_types, int(days))

                            f.write("\n------------------------------------\n")
                            f.write(u', '.join([gender, event_type, str(days),
                                                weather_types,
                                                destination_type]))
                            f.write("\n------------------------------------\n")

                            for etype, needs in grouped_needs.items():
                                f.write('\n%s\n' % etype)
                                for need in needs:
                                    f.write(u'\t %s x %s\n' % (
                                        need['item'],
                                        need.get('total_amount', None)))
