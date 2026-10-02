
class Content {
  static String dil = 'az';
  static bool get _az => dil == 'az';

  // === SEXSI ANALIZ ETIKETLERI ===
  static String get ad => _az ? 'Ad' : 'Name';
  static String get ebcad => _az ? 'EBCED' : 'ABJAD';
  static String get cifr => _az ? 'CIFR' : 'JIFR';
  static String get rum => _az ? 'RUM' : 'RUM';
  static String get numer => _az ? 'NUMEROLOGIYA' : 'NUMEROLOGY';
  static String get burc => _az ? 'BURC' : 'SUN SIGN';
  static String get planet => _az ? 'Planet' : 'Planet';
  static String get element => _az ? 'Element' : 'Element';
  static String get dekanat => _az ? 'DEKANAT' : 'DECAN';
  static String get ayMenzili => _az ? 'AY MENZILI' : 'MOON MANSION';
  static String get hurufi => _az ? 'HURUFILIK' : 'HURUFISM';
  static String get vefq => _az ? 'VEFQ' : 'MAGIC SQUARE';
  static String get ismiAzam => _az ? 'ISMI-EZEM' : 'ISM AL-AZAM';
  static String get planetGunu => _az ? 'PLANET GUNU' : 'PLANET DAY';
  static String get cinBurcu => _az ? 'CIN BURCU' : 'CHINESE ZODIAC';

  // === CIFR MENALARI ===
  static String cifrMena(int c) {
    final az = {
      1: 'Vahid, Liderlik', 2: 'Cutluk, Harmoniya', 3: 'Ucluk, Yaradiciliq',
      4: 'Dordluk, Sabitlik', 5: 'Beslik, Deyisim', 6: 'Altiliq, Mesuliyyet',
      7: 'Yeddilik, Meneviyyat', 8: 'Sekkizlik, Bolluq', 9: 'Doqquzluq, Kamillik',
    };
    final en = {
      1: 'Unity, Leadership', 2: 'Duality, Harmony', 3: 'Trinity, Creativity',
      4: 'Stability, Patience', 5: 'Change, Freedom', 6: 'Responsibility, Family',
      7: 'Spirituality, Wisdom', 8: 'Abundance, Success', 9: 'Completion, Perfection',
    };
    return (_az ? az[c] : en[c]) ?? '';
  }

  // === AI METNLERI (Sexsi analiz) ===
  static String aiSexsi(int e, int c, int p, String burc) {
    if (_az) {
      return _aiSexsiAz(e, c, p, burc);
    }
    return _aiSexsiEn(e, c, p, burc);
  }

  static String _aiSexsiAz(int e, int c, int p, String burc) {
    String g = e < 300 ? 'Adinizin mistik enerjisi cox gucludur.' : 'Adinizin enerjisi tarazliq ve harmoniyadir.';
    return g + ' Cifr ' + c.toString() + ' sizin liderlik enerjinizi gosterir. ' + burc + ' burcu sizi xarakterize edir.';
  }

  static String _aiSexsiEn(int e, int c, int p, String burc) {
    String g = e < 300 ? 'Your name has strong mystic energy.' : 'Your name energy is balanced and harmonious.';
    return g + ' Jifr ' + c.toString() + ' shows your leadership energy. ' + burc + ' sign characterizes you.';
  }

  // === ENSIKLOPEDIYA ===
  static List<Map<String, String>> ensiklopediya() {
    if (_az) return _ensAz;
    return _ensEn;
  }

  static const List<Map<String, String>> _ensAz = [
    {'b': 'Əbcəd Elmi', 'm': 'Əbcəd ərəb əlifbasındaki hərflərə ədədi dəyər verilməsi ənənəsidir. Hər hərfin öz dəyəri var: Əlif=1, Bə=2, Cim=3, Dal=4.'},
    {'b': 'Cifr Elmi', 'm': 'Cifr, Əbcəd cəminin tək rəqəmə endirilməsidir. İmam Cəfər əs-Sadiqə nisbət edilir.'},
    {'b': 'Rûm Elmi', 'm': 'Rûm, Əbcəd dəyərinin 9-a bölünməsindən qalan qalıqdır. Tək rəqəmlər Fərdiyyə, cüt rəqəmlər Zövciyyə.'},
    {'b': 'Numerologiya', 'm': 'Pifaqor sisteminə görə hərflər 1-9 rəqəmlərinə uyğun gəlir. Master ədədlər 11, 22, 33.'},
    {'b': 'Tarot', 'm': '22 Böyük Arkana: Dəli, Sehrbaz, Baş Kahinə, İmperatriça, İmperator və s.'},
    {'b': 'Rəml', 'm': 'Rəml qum elmidir. 16 fiqur: Via, Populus, Acquisitio, Laetitia və s.'},
    {'b': 'Ay Mənzili', 'm': '28 Ay Mənzili: Şəratəyn, Bətn, Süreya, Dəbəran və s.'},
    {'b': 'İsmi-Əzəm', 'm': 'Allahın 99 adı: Allah, ər-Rahmən, ər-Rahim, əl-Məlik və s.'},
    {'b': 'Vəfq', 'm': 'Vəfq sehrli kvadratdır. Lo Şu kvadratı 3x3: 4-9-2, 3-5-7, 8-1-6.'},
    {'b': 'Kabbalah', 'm': 'Həyat Ağacı 10 Sefirot: Keter, Chokhmah, Binah, Chesed, Gevurah və s.'},
    {'b': 'Runes', 'm': 'Elder Futhark 24 run: Fehu, Uruz, Thurisaz, Ansuz, Raidho və s.'},
    {'b': 'Vedic', 'm': 'Nakshatra 27 ulduz mənzili: Ashwini, Bharani, Krittika, Rohini və s.'},
    {'b': 'Hürufilik', 'm': 'Fəzlullah Nəimi tərəfindən qurulmuş mistik təriqət. İnsan üzü 28 hərfin təcəssümü.'},
    {'b': 'Planet Günləri', 'm': 'Bazar-Günəş, B.e.-Ay, Ç.a.-Mars, Çərşənbə-Merkuri, C.a.-Yupiter, Cümə-Venera, Şənbə-Zühəl.'},
  ];

  static const List<Map<String, String>> _ensEn = [
    {'b': 'Abjad Science', 'm': 'Abjad assigns numeric values to Arabic letters. Each letter has a value: Alif=1, Ba=2, Jim=3, Dal=4.'},
    {'b': 'Jifr Science', 'm': 'Jifr reduces the Abjad sum to a single digit. Attributed to Imam Jafar al-Sadiq.'},
    {'b': 'Rum Science', 'm': 'Rum is the remainder of Abjad divided by 9. Odd numbers are Fardiyya, even are Zawjiyya.'},
    {'b': 'Numerology', 'm': 'Pythagorean numerology maps letters to 1-9. Master numbers 11, 22, 33.'},
    {'b': 'Tarot', 'm': '22 Major Arcana: The Fool, The Magician, The High Priestess, The Empress, The Emperor, etc.'},
    {'b': 'Reml', 'm': 'Reml is sand divination. 16 figures: Via, Populus, Acquisitio, Laetitia, etc.'},
    {'b': 'Moon Mansions', 'm': '28 Lunar Mansions: Sharatayn, Butayn, Thurayya, Dabaran, etc.'},
    {'b': 'Ism al-Azam', 'm': "Allah's 99 names: Allah, ar-Rahman, ar-Rahim, al-Malik, etc."},
    {'b': 'Wafq', 'm': 'Wafq is a magic square. Lo Shu 3x3: 4-9-2, 3-5-7, 8-1-6.'},
    {'b': 'Kabbalah', 'm': 'Tree of Life with 10 Sephiroth: Keter, Chokhmah, Binah, Chesed, Gevurah, etc.'},
    {'b': 'Runes', 'm': 'Elder Futhark 24 runes: Fehu, Uruz, Thurisaz, Ansuz, Raidho, etc.'},
    {'b': 'Vedic', 'm': 'Nakshatra 27 star mansions: Ashwini, Bharani, Krittika, Rohini, etc.'},
    {'b': 'Hurufism', 'm': 'Mystic sect founded by Fazlallah Astarabadi. The human face embodies 28 letters.'},
    {'b': 'Planet Days', 'm': 'Sunday-Sun, Monday-Moon, Tuesday-Mars, Wednesday-Mercury, Thursday-Jupiter, Friday-Venus, Saturday-Saturn.'},
  ];
}
