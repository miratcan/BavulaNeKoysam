import 'dart:math';

const Map<String, String> GENDERS = {
  'erkek': 'Erkek',
  'kadin': 'Kadın',
};

const Map<String, String> ITEMS = {
  'gunes_gozlugu': 'Güneş gözlüğü',
  'gunes_koruyucu_krem': 'Güneşten Koruyucu Krem',
  'gunes_yagi': 'Güneş Yağı',
  'sort': 'Şort',
  'corap': 'Çorap',
  'soket_corap': 'Soket Çorap',
  'tshirt': 'Tshirt',
  'kazak': 'Kazak',
  'gomlek': 'Gömlek',
  'yun_gomlek': 'Yün Gömlek',
  'kravat': 'Kravat',
  'pantolon': 'Pantolon',
  'yun_pantolon': 'Yün Pantolon',
  'kargo_pantolon': 'Kargo Pantolon',
  'ayakkabi': 'Ayakkabı',
  'topuklu_ayakkabi': 'Topuklu Ayakkabı',
  'dopiyes': 'Döpiyes',
  'atlet_fanila': 'Atlet/Fanila',
  'termal_iclik': 'Termal İçlik',
  'pijama': 'Pijama',
  'esofman': 'Eşofman',
  'bluz': 'Bluz',
  'etek': 'Etek',
  'elbise': 'Elbise',
  'kapsonlu_polar': 'Kapşonlu Polar',
  'bocek_kovucu_sprey': 'Böcek Kovucu Sprey',
  'sapka': 'Şapka',
  'kagit_havlu': 'Kağıt Havlu',
  'islak_mendil': 'Islak mendil',
  'deodorant': 'Deodorant',
  'parfum': 'Parfüm',
  'gunluk_ped': 'Günlük Ped',
  'hijyenik_ped': 'Hijyenik Ped',
  'mide_ilaci': 'Mide ilacı',
  'ishal_ilaci': 'İshal ilacı',
  'boxer': 'Boxer',
  'kulot': 'Külot',
  'mayo': 'Mayo',
  'bikini': 'Bikini',
  'pareo': 'Pareo',
  'plaj_havlusu': 'Plaj Havlusu',
  'plaj_cantasi': 'Plaj Çantası',
  'spor_ayakkabi': 'Spor ayakkabı',
  'terlik': 'Terlik',
  'sandalet_terlik': 'Sandalet/Terlik',
  'kimlik_karti': 'Kimlik kartı',
  'arac_ehliyeti': 'Araç Ehliyeti',
  'arac_ruhsati': 'Araç Ruhsatı',
  'pasaport': 'Pasaport',
  'vize': 'Vize',
  'para': 'Nakit para',
  'agri_kesici': 'Ağrı kesici',
  'sampuan': 'Şampuan',
  'banyo_sabunu': 'Banyo Sabunu',
  'el_sabunu': 'El Sabunu',
  'nemlendirici_krem': 'Nemlendirici Krem',
  'tuvalet_kagidi': 'Tuvalet Kağıdı',
  'mont': 'Mont',
  'dis_fircasi': 'Diş Fırçası',
  'dis_macunu': 'Diş Macunu',
  'tras_bicagi': 'Traş Bıçağı',
  'tras_kopugu': 'Traş Köpüğü',
  'kitap': 'Kitap',
  'kupe': 'Küpe',
  'telefon': 'Telefon',
  'telefon_sarji': 'Telefon İçin Şarj Aleti',
  'harita': 'Harita',
  'pusula': 'Pusula',
  'dudak_merhemi': 'Dudak Merhemi',
  'kafa_feneri': 'Kafa Feneri',
  'el_feneri': 'El Feneri',
  'pil': 'Ekstra Pil',
  'ilkyardim_cantasi': 'İlkyardım Çantası',
  'cakmak_kibrit': 'Çakmak/Kibrit',
  'uyku_tulumu': 'Uyku Tulumu',
  'mat': 'Mat',
  'kamp_yastigi': 'Kamp Yastığı',
  'yuruyus_bastonu': 'Yürüyüş Bastonu',
  'duduk': 'Acil Durum Düdüğü',
  'su_kabi': 'Su Kabı',
  'su_filtresi': 'Su Filtresi',
  'konserve_yiyecek': 'Konserve Yiyecek',
  'ocak': 'Ocak',
  'ocak_yakiti': 'Ocak İçin Yakıt',
  'pisirme_seti': 'Yemek Pişirme Seti',
  'caki': 'Çakı',
  'izci_bicagi': 'İzci Bıçağı',
  'kayak_montu': 'Kayak Montu',
  'kayak_pantolonu': 'Kayak Pantolonu',
  'kayak_corabi': 'Kayak Çorabı',
  'kayak_eldiveni': 'Kayak Eldiveni',
  'kayak_gozlugu': 'Kayak Gözlüğü',
  'iclik': 'İçlik (Orta Tabaka)',
  'uzun_ic_camasiri': 'Uzun İç Çamaşırı'
};

const Map<String, String> EVENT_TYPES = {
  'kamp': 'Kamp',
  'plaj': 'Plaj',
  'kayak': 'Kayak',
  'isgezisi': 'İş Gezisi',
};

const Map<String, String> NEED_TYPES = {
  'cuzdan': 'Cüzdanda Bulunması Gerekenler',
  'giyim': 'Giyim',
  'ilaclar': 'İlaçlar',
  'bakim_hijyen': 'Kişisel Bakım',
  'elektronik': 'Elektronik Eşyalar',
  'belge': 'Belgeler',
  'yeme_icme': 'Yeme İçme',
  'barinma': 'Barınma',
  'diger': 'Diğer'
};

const Map<String, String> WEATHER_TYPES = {
  'sicak': 'Sıcak',
  'ilik': 'Normal',
  'soguk': 'Soğuk',
};

const Map<int, String> TRAVEL_DAYS = {
  3: '3 Gün',
  7: '1 Hafta',
  15: '15 Gün'
};

const Map<String, String> DESTINATION_TYPES = {
  'yurtici': 'Yurtiçi',
  'yurtdisi': 'Yurtdışı'
};

const List<Map<String, dynamic>> NEEDS = [
  // Generic
  {'type': 'ilaclar', 'item': 'agri_kesici', 'total_amount': 1},
  {'type': 'ilaclar', 'item': 'mide_ilaci', 'total_amount': 1},
  {'type': 'bakim_hijyen', 'item': 'parfum', 'total_amount': 1},
  {'type': 'bakim_hijyen', 'item': 'deodorant', 'total_amount': 1},
  {'type': 'bakim_hijyen', 'item': 'islak_mendil', 'daily_amount': 0.20},
  {'type': 'bakim_hijyen', 'item': 'dis_fircasi', 'total_amount': 1},
  {'type': 'bakim_hijyen', 'item': 'dis_macunu', 'total_amount': 1},
  {'type': 'cuzdan', 'item': 'para'},
  {'type': 'cuzdan', 'item': 'kimlik_karti'},
  {'type': 'cuzdan', 'item': 'arac_ehliyeti'},
  {'type': 'belge', 'item': 'arac_ruhsati'},
  {'type': 'elektronik', 'item': 'telefon', 'total_amount': 1},
  {'type': 'elektronik', 'item': 'telefon_sarji', 'total_amount': 1},
  // Generic (Kadin)
  {'type': 'bakim_hijyen', 'gender': 'kadin', 'item': 'hijyenik_ped'},
  {'type': 'giyim', 'gender': 'kadin', 'item': 'kulot', 'daily_amount': 1},
  {
    'type': 'bakim_hijyen',
    'gender': 'kadin',
    'item': 'nemlendirici_krem',
    'total_amount': 1
  },
  // Generic (Erkek)
  {
    'type': 'giyim',
    'gender': 'erkek',
    'item': 'boxer',
    'daily_amount': 1,
    'max_amount': 7
  },
  // Generic (Yurtdisi)
  {
    'type': 'belge',
    'item': 'pasaport',
    'destination_type': 'yurtdisi'
  },
  {'type': 'belge', 'item': 'vize', 'destination_type': 'yurtdisi'},
  // Generic (Sicak)
  {
    'type': 'ilaclar',
    'item': 'gunes_koruyucu_krem',
    'weather_types': ['sicak'],
    'total_amount': 1
  },
  {
    'type': 'bakim_hijyen',
    'item': 'gunes_yagi',
    'weather_types': ['sicak'],
    'event_types': ['plaj', 'kamp'],
    'total_amount': 1
  },
  {
    'type': 'giyim',
    'weather_types': ['sicak'],
    'item': 'kapsonlu_polar',
    'description': 'Akşamları soğuk olabilir.',
    'total_amount': 1
  },
  {'type': 'giyim', 'item': 'sapka', 'weather_types': ['sicak']},
  // Generic (Soğuk)
  {
    'type': 'giyim',
    'item': 'kazak',
    'weather_types': ['soguk'],
    'total_amount': 4
  },
  {
    'type': 'giyim',
    'item': 'mont',
    'weather_types': ['soguk'],
    'event_types': ['plaj', 'kamp', 'isgezisi'],
    'total_amount': 1
  },
  // Kamp
  {
    'type': 'ilaclar',
    'item': 'bocek_kovucu_sprey',
    'event_types': ['kamp'],
    'total_amount': 1
  },
  {
    'type': 'bakim_hijyen',
    'item': 'kagit_havlu',
    'event_types': ['kamp'],
    'daily_amount': 0.20
  },
  {
    'type': 'bakim_hijyen',
    'item': 'tuvalet_kagidi',
    'event_types': ['kamp'],
    'daily_amount': 0.20
  },
  {
    'type': 'bakim_hijyen',
    'item': 'el_sabunu',
    'event_types': ['kamp'],
    'daily_amount': 0.20
  },
  {
    'type': 'belge',
    'item': 'harita',
    'event_types': ['kamp'],
    'total_amount': 1
  },
  {'type': 'diger', 'item': 'pusula', 'event_types': ['kamp'], 'total_amount': 1},
  {
    'type': 'bakim_hijyen',
    'item': 'dudak_merhemi',
    'event_types': ['kamp', 'kayak'],
    'total_amount': 1
  },
  {
    'type': 'elektronik',
    'item': 'kafa_feneri',
    'event_types': ['kamp'],
    'total_amount': 1
  },
  {
    'type': 'elektronik',
    'item': 'el_feneri',
    'event_types': ['kamp'],
    'total_amount': 1
  },
  {
    'type': 'elektronik',
    'item': 'pil',
    'event_types': ['kamp'],
    'daily_amount': 0.5
  },
  {
    'type': 'ilaclar',
    'item': 'ilkyardim_cantasi',
    'event_types': ['kamp'],
    'total_amount': 1
  },
  {'type': 'diger', 'item': 'cakmak_kibrit', 'event_types': ['kamp']},
  {
    'type': 'barinma',
    'item': 'uyku_tulumu',
    'event_types': ['kamp'],
    'total_amount': 1
  },
  {'type': 'barinma', 'item': 'mat', 'event_types': ['kamp'], 'total_amount': 1},
  {
    'type': 'barinma',
    'item': 'kamp_yastigi',
    'event_types': ['kamp'],
    'total_amount': 2
  },
  {
    'type': 'diger',
    'item': 'yuruyus_bastonu',
    'event_types': ['kamp'],
    'total_amount': 1
  },
  {
    'type': 'yeme_icme',
    'item': 'su_kabi',
    'event_types': ['kamp'],
    'total_amount': 3
  },
  {
    'type': 'yeme_icme',
    'item': 'su_filtresi',
    'event_types': ['kamp'],
    'total_amount': 1
  },
  {
    'type': 'yeme_icme',
    'item': 'konserve_yiyecek',
    'event_types': ['kamp'],
    'total_amount': 1
  },
  {'type': 'yeme_icme', 'item': 'ocak', 'event_types': ['kamp'], 'total_amount': 1},
  {
    'type': 'yeme_icme',
    'item': 'ocak_yakiti',
    'event_types': ['kamp'],
    'total_amount': 1
  },
  {
    'type': 'yeme_icme',
    'item': 'pisirme_seti',
    'event_types': ['kamp'],
    'total_amount': 1
  },
  {'type': 'diger', 'item': 'caki', 'event_types': ['kamp'], 'total_amount': 1},
  {
    'type': 'diger',
    'item': 'izci_bicagi',
    'event_types': ['kamp'],
    'total_amount': 1
  },
  {
    'type': 'giyim',
    'item': 'kargo_pantolon',
    'event_types': ['kamp'],
    'total_amount': 1
  },
  {
    'type': 'giyim',
    'item': 'uzun_ic_camasiri',
    'event_types': ['kamp'],
    'description': 'Geceler soğuk olacaktır.',
    'weather_types': ['ilik']
  },
  {
    'type': 'giyim',
    'item': 'uzun_ic_camasiri',
    'event_types': ['kamp'],
    'weather_types': ['soguk'],
    'daily_amount': 0.25
  },
  {
    'type': 'giyim',
    'item': 'esofman',
    'event_types': ['kamp'],
    'total_amount': 1
  },
  {
    'type': 'giyim',
    'item': 'yun_pantolon',
    'event_types': ['kamp'],
    'weather_types': ['soguk'],
    'total_amount': 2
  },
  {
    'type': 'giyim',
    'item': 'yun_gomlek',
    'event_types': ['kamp'],
    'weather_types': ['soguk'],
    'total_amount': 2
  },
  {
    'type': 'giyim',
    'item': 'kazak',
    'event_types': ['kamp'],
    'weather_types': ['soguk'],
    'total_amount': 2
  },
  // Plaj
  {
    'type': 'ilaclar',
    'item': 'bocek_kovucu_sprey',
    'event_types': ['plaj'],
    'weather_types': ['sicak'],
    'total_amount': 1
  },
  {
    'type': 'giyim',
    'gender': 'erkek',
    'item': 'mayo',
    'event_types': ['plaj'],
    'total_amount': 3
  },
  {
    'type': 'giyim',
    'gender': 'kadin',
    'item': 'bikini',
    'event_types': ['plaj'],
    'total_amount': 3
  },
  {
    'type': 'giyim',
    'gender': 'kadin',
    'item': 'pareo',
    'event_types': ['plaj'],
    'total_amount': 3
  },
  {
    'type': 'giyim',
    'gender': 'kadin',
    'weather_types': ['sicak'],
    'event_types': ['plaj'],
    'item': 'etek',
    'daily_amount': 0.35
  },
  {
    'type': 'giyim',
    'gender': 'kadin',
    'weather_types': ['sicak'],
    'event_types': ['plaj'],
    'item': 'bluz',
    'daily_amount': 0.35
  },
  {
    'type': 'giyim',
    'gender': 'kadin',
    'weather_types': ['sicak'],
    'event_types': ['plaj'],
    'item': 'elbise',
    'daily_amount': 0.14
  },
  {
    'type': 'giyim',
    'gender': 'kadin',
    'weather_types': ['sicak'],
    'event_types': ['plaj'],
    'item': 'kupe',
    'daily_amount': 0.28
  },
  {
    'type': 'giyim',
    'weather_types': ['sicak'],
    'item': 'tshirt',
    'daily_amount': 1
  },
  {
    'type': 'giyim',
    'weather_types': ['sicak'],
    'item': 'sort',
    'event_types': ['plaj'],
    'daily_amount': 0.35
  },
  {
    'type': 'giyim',
    'gender': 'erkek',
    'weather_types': ['sicak'],
    'event_types': ['plaj'],
    'item': 'soket_corap',
    'daily_amount': 0.5
  },
  {
    'type': 'giyim',
    'gender': 'erkek',
    'event_types': ['plaj'],
    'item': 'gomlek',
    'total_amount': 1
  },
  {
    'type': 'giyim',
    'gender': 'erkek',
    'weather_types': ['sicak'],
    'item': 'pantolon',
    'total_amount': 1
  },
  {
    'type': 'giyim',
    'weather_types': ['sicak'],
    'item': 'ayakkabi',
    'total_amount': 1
  },
  {
    'type': 'giyim',
    'event_types': ['plaj'],
    'weather_types': ['sicak'],
    'item': 'sandalet_terlik',
    'total_amount': 2
  },
  {'type': 'diger', 'item': 'kitap', 'total_amount': 1},
  {
    'type': 'diger',
    'item': 'plaj_havlusu',
    'event_types': ['plaj'],
    'total_amount': 2
  },
  {
    'type': 'diger',
    'item': 'plaj_cantasi',
    'event_types': ['plaj'],
    'total_amount': 1
  },
  // İşgezisi
  {
    'type': 'giyim',
    'gender': 'erkek',
    'event_types': ['isgezisi'],
    'item': 'gomlek',
    'daily_amount': 1,
    'max_amount': 7
  },
  {
    'type': 'giyim',
    'gender': 'erkek',
    'event_types': ['isgezisi'],
    'item': 'kravat',
    'total_amount': 4
  },
  {
    'type': 'giyim',
    'gender': 'erkek',
    'event_types': ['isgezisi'],
    'item': 'pantolon',
    'daily_amount': 1,
    'max_amount': 7
  },
  {'type': 'giyim', 'gender': 'erkek', 'item': 'pijama', 'total_amount': 1},
  {
    'type': 'giyim',
    'gender': 'erkek',
    'event_types': ['isgezisi'],
    'item': 'corap',
    'daily_amount': 1,
    'max_amount': 7
  },
  {
    'type': 'giyim',
    'gender': 'erkek',
    'event_types': ['isgezisi'],
    'item': 'atlet_fanila',
    'daily_amount': 1,
    'max_amount': 7
  },
  {
    'type': 'giyim',
    'event_types': ['isgezisi'],
    'item': 'terlik',
    'total_amount': 1
  },
  {
    'type': 'giyim',
    'gender': 'erkek',
    'event_types': ['isgezisi'],
    'item': 'ayakkabi',
    'total_amount': 2
  },
  {
    'type': 'giyim',
    'gender': 'erkek',
    'event_types': ['isgezisi'],
    'item': 'spor_ayakkabi',
    'total_amount': 1
  },
  {
    'type': 'bakim_hijyen',
    'gender': 'erkek',
    'event_types': ['isgezisi'],
    'item': 'tras_bicagi',
    'total_amount': 1
  },
  {
    'type': 'bakim_hijyen',
    'gender': 'erkek',
    'event_types': ['isgezisi'],
    'item': 'tras_kopugu',
    'total_amount': 1
  },
  {
    'type': 'giyim',
    'gender': 'kadin',
    'event_types': ['isgezisi'],
    'item': 'etek',
    'daily_amount': 1
  },
  {
    'type': 'giyim',
    'gender': 'kadin',
    'event_types': ['isgezisi'],
    'item': 'gomlek',
    'daily_amount': 1
  },
  {
    'type': 'giyim',
    'gender': 'kadin',
    'event_types': ['isgezisi'],
    'item': 'topuklu_ayakkabi',
    'total_amount': 4
  },
  {
    'type': 'giyim',
    'gender': 'kadin',
    'event_types': ['isgezisi'],
    'item': 'dopiyes',
    'total_amount': 1
  },
  {
    'type': 'giyim',
    'gender': 'kadin',
    'event_types': ['isgezisi'],
    'item': 'spor_ayakkabi',
    'total_amount': 2
  },
  // Kayak
  {
    'type': 'giyim',
    'event_types': ['kayak'],
    'item': 'kayak_montu',
    'total_amount': 2
  },
  {
    'type': 'giyim',
    'event_types': ['kayak'],
    'item': 'kayak_pantolonu',
    'total_amount': 2
  },
  {
    'type': 'giyim',
    'event_types': ['kayak'],
    'item': 'kayak_corabi',
    'daily_amount': 1,
    'max_amount': 7
  },
  {
    'type': 'giyim',
    'event_types': ['kayak'],
    'item': 'kayak_eldiveni',
    'total_amount': 2
  },
  {
    'type': 'giyim',
    'event_types': ['kayak'],
    'item': 'kayak_gozlugu',
    'total_amount': 20
  },
  {
    'type': 'giyim',
    'event_types': ['kayak'],
    'item': 'iclik',
    'total_amount': 2
  },
];

Map<String, List<Map<String, dynamic>>> getNeeds(
    String gender,
    String destinationType,
    String eventType,
    String weatherTypes,
    int travelDays) {
  Map<String, List<Map<String, dynamic>>> _needs = {};

  for (var need in NEEDS) {
    var newNeed = Map<String, dynamic>.from(need);

    if (newNeed.containsKey('gender')) {
      if (newNeed['gender'] != gender) {
        continue;
      }
    }

    if (newNeed.containsKey('destination_type')) {
      if (newNeed['destination_type'] != destinationType) {
        continue;
      }
    }

    if (newNeed.containsKey('event_types')) {
      if (!newNeed['event_types'].contains(eventType)) {
        continue;
      }
    }

    if (newNeed.containsKey('weather_types')) {
      if (!newNeed['weather_types'].contains(weatherTypes)) {
        continue;
      }
    }

    if (newNeed.containsKey('daily_amount')) {
      int tDays = travelDays;
      int tAmount = (newNeed['daily_amount'] * tDays).ceil().toInt();
      if (newNeed.containsKey('max_amount')) {
        int mAmount = newNeed['max_amount'];
        if (tAmount > mAmount) {
          if (!newNeed.containsKey('notes')) {
            newNeed['notes'] = [];
          }
          newNeed['notes'].add('Yıkama imkanı yoksa $tAmount adet.');
        }
        tAmount = min(tAmount, newNeed['max_amount']);
      }
      newNeed['total_amount'] = tAmount;
    }

    newNeed['item'] = ITEMS[newNeed['item']];
    String typeKey = newNeed['type'];
    newNeed['type'] = NEED_TYPES[typeKey];

    if (!_needs.containsKey(NEED_TYPES[typeKey])) {
      _needs[NEED_TYPES[typeKey]!] = [];
    }
    _needs[NEED_TYPES[typeKey]!]!.add(newNeed);
  }

  return _needs;
}
