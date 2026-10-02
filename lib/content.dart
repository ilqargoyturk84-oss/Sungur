class Content {
  static String dil = 'az';
  static bool get az => dil == 'az';

  static List<List<String>> tarot() => az ? _tarotAz : _tarotEn;
  static const _tarotAz = [['Deli','Risk, yeni baslangic','+0.20'],['Sehrbaz','Irade, bacariq','+0.30'],['Bas Kahine','Bilik, intuisiya','+0.15'],['Imperatrica','Bolluq','+0.25'],['Imperator','Liderlik','+0.35'],['Hierofant','Enene','+0.18'],['Asiqler','Harmoniya','+0.22'],['Araba','Qelebe','+0.40'],['Guc','Cesaret','+0.45'],['Zahid','Fokus','+0.12'],['Bext Carxi','Sans','+0.35'],['Edalet','Balans','+0.15'],['Asilmis','Gozleme','-0.10'],['Deyisim','Transformasiya','+0.05'],['Muvazinet','Sebir','+0.18'],['Seytan','Asliliq','-0.20'],['Qulle','Dagilma','-0.30'],['Ulduz','Umid','+0.28'],['Ay','Illuziya','-0.15'],['Gunes','Ugur','+0.50'],['Mehkeme','Oyanis','+0.22'],['Dunya','Tamamlanma','+0.45']];
  static const _tarotEn = [['The Fool','Risk, new beginning','+0.20'],['The Magician','Will, skill','+0.30'],['The High Priestess','Knowledge, intuition','+0.15'],['The Empress','Abundance','+0.25'],['The Emperor','Leadership','+0.35'],['The Hierophant','Tradition','+0.18'],['The Lovers','Harmony','+0.22'],['The Chariot','Victory','+0.40'],['Strength','Courage','+0.45'],['The Hermit','Focus','+0.12'],['Wheel of Fortune','Luck','+0.35'],['Justice','Balance','+0.15'],['The Hanged Man','Waiting','-0.10'],['Death','Transformation','+0.05'],['Temperance','Patience','+0.18'],['The Devil','Addiction','-0.20'],['The Tower','Collapse','-0.30'],['The Star','Hope','+0.28'],['The Moon','Illusion','-0.15'],['The Sun','Success','+0.50'],['Judgement','Awakening','+0.22'],['The World','Completion','+0.45']];

  static List<List<String>> reml() => az ? _remlAz : _remlEn;
  static const _remlAz = [['Via','Yol, seyahet','0.00'],['Populus','Kutle','+0.15'],['Acquisitio','Qazanc','+0.22'],['Laetitia','Sevinc','+0.28'],['Fortuna Major','Boyuk bext','+0.30'],['Conjunctio','Ittifaq','+0.18'],['Rubeus','Qezeb','-0.18'],['Amissio','Itki','-0.25'],['Tristitia','Keder','-0.15'],['Carcer','Mehdudiyyet','-0.22'],['Fortuna Minor','Kicik bext','+0.15'],['Puer','Genc guc','+0.20'],['Puella','Harmoniya','+0.12'],['Albus','Safliq','+0.10'],['Caput Draconis','Yeni furset','+0.08'],['Cauda Draconis','Baglanma','-0.12']];
  static const _remlEn = [['Via','Way','0.00'],['Populus','Crowd','+0.15'],['Acquisitio','Gain','+0.22'],['Laetitia','Joy','+0.28'],['Fortuna Major','Great fortune','+0.30'],['Conjunctio','Union','+0.18'],['Rubeus','Wrath','-0.18'],['Amissio','Loss','-0.25'],['Tristitia','Sorrow','-0.15'],['Carcer','Restriction','-0.22'],['Fortuna Minor','Lesser fortune','+0.15'],['Puer','Young power','+0.20'],['Puella','Harmony','+0.12'],['Albus','Purity','+0.10'],['Caput Draconis','New opportunity','+0.08'],['Cauda Draconis','Closure','-0.12']];

  static String cifrMena(int c) {
    final _cifrAz = {1:'Vahid, Liderlik',2:'Cutluk, Harmoniya',3:'Ucluk, Yaradiciliq',4:'Dordluk, Sabitlik',5:'Beslik, Deyisim',6:'Altiliq, Mesuliyyet',7:'Yeddilik, Meneviyyat',8:'Sekkizlik, Bolluq',9:'Doqquzluq, Kamillik'};
    final _cifrEn = {1:'Unity, Leadership',2:'Duality, Harmony',3:'Trinity, Creativity',4:'Stability, Patience',5:'Change, Freedom',6:'Responsibility, Family',7:'Spirituality, Wisdom',8:'Abundance, Success',9:'Completion, Perfection'};
    return (az ? _cifrAz[c] : _cifrEn[c]) ?? '';
  }

  static String burc(String b) {
    if (az) return b;
    final m = {'Qoc':'Aries','Buga':'Taurus','Ekizler':'Gemini','Xerceng':'Cancer','Sir':'Leo','Qiz':'Virgo','Terezi':'Libra','Eqreb':'Scorpio','Oxatan':'Sagittarius','Oglaq':'Capricorn','Dolca':'Aquarius','Baliq':'Pisces'};
    return m[b] ?? b;
  }
  static String element(String e) {
    if (az) return e;
    final m = {'Od':'Fire','Torpaq':'Earth','Hava':'Air','Su':'Water'};
    return m[e] ?? e;
  }
  static String planet(String p) {
    if (az) return p;
    final m = {'Gunes':'Sun','Ay':'Moon','Merkuri':'Mercury','Venera':'Venus','Mars':'Mars','Yupiter':'Jupiter','Zuhal':'Saturn','Uran':'Uranus','Neptun':'Neptune','Pluton':'Pluto'};
    return m[p] ?? p;
  }
  static String cinBurcu(String h) {
    if (az) return h;
    final m = {'Sicovul':'Rat','Okuz':'Ox','Peleng':'Tiger','Dovsan':'Rabbit','Ejdaha':'Dragon','Ilan':'Snake','At':'Horse','Qoyun':'Goat','Meymun':'Monkey','Xoruz':'Rooster','It':'Dog','Donuz':'Pig'};
    return m[h] ?? h;
  }
  static String ayMenzili(String m) {
    if (az) return m;
    final map = {'Serateyn':'Sharatayn','Betn':'Butayn','Sureya':'Thurayya','Debaran':'Dabaran','Heqeh':'Haqah','Henneh':'Hanah','Zire':'Dhira','Nesre':'Nathra','Terfe':'Tarfa','Cebhe':'Jabhah','Zubra':'Zubrah','Serfe':'Sarfah','Ava':'Awwa','Simak':'Simak','Gafr':'Ghafr','Zubana':'Zubana','Iklil':'Iklil','Qelb':'Qalb','Sovle':'Shawla','Neayim':'Naim','Belde':'Baldah','SedZabih':'Sad al-Dhabih','SedBula':'Sad al-Bulah','SedSuud':'Sad al-Suud','SedAhbiye':'Sad al-Akhbiyah','FergMukdim':'Fargh al-Muqaddim','FergMuaxir':'Fargh al-Muakhkhar','Risa':'Risha'};
    return map[m] ?? m;
  }

  static String nikahVar() => az ? 'NIKAH OLACAQ' : 'MARRIAGE WILL HAPPEN';
  static String nikahYox() => az ? 'NIKAH OLMAYACAQ' : 'MARRIAGE WILL NOT HAPPEN';
  static String beraber() => az ? 'BERABERLIK' : 'EQUAL';
  static String ustundur(String ad) => az ? ad + ' ustundur' : ad + ' is stronger';

  static List<Map<String, String>> ensiklopediya() => az ? _ensAz : _ensEn;
  static const _ensAz = [{'b':'Əbcəd Elmi','m':'Əbcəd ərəb hərflərinə ədədi dəyər verilməsi ənənəsidir.'},{'b':'Cifr Elmi','m':'Cifr Əbcəd cəminin tək rəqəmə endirilməsidir.'},{'b':'Rûm Elmi','m':'Rûm Əbcəd dəyərinin 9-a bölünməsindən qalıqdır.'},{'b':'Numerologiya','m':'Pifaqor sisteminə görə hərflər 1-9 rəqəmlərinə uyğun gəlir.'},{'b':'Tarot','m':'22 Böyük Arkana: Dəli, Sehrbaz, Baş Kahinə.'},{'b':'Rəml','m':'Rəml qum elmidir. 16 fiqur var.'},{'b':'Ay Mənzili','m':'28 Ay Mənzili: Şəratəyn, Bətn, Süreya.'},{'b':'İsmi-Əzəm','m':'Allahın 99 adı.'},{'b':'Vəfq','m':'Sehrli kvadrat. Lo Şu 3x3.'},{'b':'Kabbalah','m':'Həyat Ağacı 10 Sefirot.'},{'b':'Runes','m':'Elder Futhark 24 run.'},{'b':'Vedic','m':'Nakshatra 27 ulduz mənzili.'},{'b':'Hürufilik','m':'Fəzlullah Nəimi tərəfindən qurulmuş təriqət.'},{'b':'Planet Günləri','m':'Bazar-Günəş, B.e.-Ay, Ç.a.-Mars.'}];
  static const _ensEn = [{'b':'Abjad Science','m':'Numeric values for Arabic letters.'},{'b':'Jifr Science','m':'Reduces Abjad sum to single digit.'},{'b':'Rum Science','m':'Remainder of Abjad divided by 9.'},{'b':'Numerology','m':'Letters map to 1-9. Master 11, 22, 33.'},{'b':'Tarot','m':'22 Major Arcana: The Fool, The Magician.'},{'b':'Reml','m':'Sand divination. 16 figures.'},{'b':'Moon Mansions','m':'28 Lunar Mansions: Sharatayn, Butayn.'},{'b':'Ism al-Azam','m':"Allah's 99 names."},{'b':'Wafq','m':'Magic square. Lo Shu 3x3.'},{'b':'Kabbalah','m':'Tree of Life with 10 Sephiroth.'},{'b':'Runes','m':'Elder Futhark 24 runes.'},{'b':'Vedic','m':'Nakshatra 27 star mansions.'},{'b':'Hurufism','m':'Mystic sect by Fazlallah Astarabadi.'},{'b':'Planet Days','m':'Sunday-Sun, Monday-Moon, Tuesday-Mars.'}];
}
