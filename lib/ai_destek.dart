import 'dart:math';

class AI {
  static final Random _r = Random();

  // Sexsi analiz ucun AI kimli metn
  static String sexsi(int e, int c, int p, String burc) {
    String giris = _giris(e);
    String cifr = _cifrMetn(c);
    String numer = _numerMetn(p);
    String burcM = _burcMetn(burc);
    return giris + ' ' + cifr + ' ' + numer + ' ' + burcM;
  }

  static String _giris(int e) {
    if (e < 100) return 'Adinizin mistik enerjisi cox gucludur. Kicik addimlarla boyuk neticeler elde ede bilersiniz.';
    if (e < 300) return 'Adinizin enerjisi tarazliq ve harmoniyadir. Insanlarla munasibetlerinizde ugurlusunuz.';
    if (e < 600) return 'Adinizin enerjisi yaradiciliq ve ifadedir. Fikirlerinizi asanliqla catdirirsiniz.';
    if (e < 900) return 'Adinizin enerjisi guclu ve liderdir. Qerar vermekde cesursunuz.';
    return 'Adinizin enerjisi cox yuksektir. Siz xususi missiyaya maliksiniz.';
  }

  static String _cifrMetn(int c) {
    final m = {
      1: 'Cifr 1 - Liderlik enerjisi size verilib. Insanlari idare ede bilirsiniz.',
      2: 'Cifr 2 - Harmoniya enerjisi. Emekdasliq size ugur getirir.',
      3: 'Cifr 3 - Yaradiciliq enerjisi. Ifade gucunuz yuksekdir.',
      4: 'Cifr 4 - Sabitlik enerjisi. Sebirli ve dayaniqlisiniz.',
      5: 'Cifr 5 - Deyisim enerjisi. Azadliq sizin ucun vacibdir.',
      6: 'Cifr 6 - Mesuliyyet enerjisi. Aile ve qaygi sizin ucundur.',
      7: 'Cifr 7 - Meneviyyat enerjisi. Mudrik ve derin dusunursunuz.',
      8: 'Cifr 8 - Bolluq enerjisi. Maddi ugur sizi gozleyir.',
      9: 'Cifr 9 - Kamillik enerjisi. Humanist ve tamdirsiniz.',
    };
    return m[c] ?? '';
  }

  static String _numerMetn(int p) {
    final m = {
      1: 'Numerologiya 1 - Musteqil qerarlar verirsiniz.',
      2: 'Numerologiya 2 - Emekdasliq ve harmoniyada guclusunuz.',
      3: 'Numerologiya 3 - Optimist ve yaradicisiniz.',
      4: 'Numerologiya 4 - Sebirli ve praktiksiniz.',
      5: 'Numerologiya 5 - Azadliq ve macera sevirsiniz.',
      6: 'Numerologiya 6 - Aile ve qaygi sizin prioritetdir.',
      7: 'Numerologiya 7 - Mudrik ve menevi dusunceleriniz var.',
      8: 'Numerologiya 8 - Ugur ve guc sizinledir.',
      9: 'Numerologiya 9 - Humanist ve kamil insansiniz.',
      11: 'Numerologiya 11 - Master intuisiya. Ruhani lider siniz.',
      22: 'Numerologiya 22 - Master qurucusu. Boyuk nailiyyetler sizi gozleyir.',
      33: 'Numerologiya 33 - Master muellimi. Beseriyyete xidmet edirsiniz.',
    };
    return m[p] ?? '';
  }

  static String _burcMetn(String b) {
    final m = {
      'Qoc': 'Qoc burcu sizə cesaret ve tesebbus verir.',
      'Buga': 'Buga burcu sizə sebr ve davamliliq verir.',
      'Ekizler': 'Ekizler burcu sizə ceviklik ve unsiyyet verir.',
      'Xerceng': 'Xerceng burcu sizə duygu ve qoruma verir.',
      'Sir': 'Sir burcu sizə liderlik ve qurur verir.',
      'Qiz': 'Qiz burcu sizə analitik dusunce verir.',
      'Terezi': 'Terezi burcu sizə balans ve edalet verir.',
      'Eqreb': 'Eqreb burcu sizə guc ve sirr verir.',
      'Oxatan': 'Oxatan burcu sizə optimizm ve serguzest verir.',
      'Oglaq': 'Oglaq burcu sizə meqsed ve sebr verir.',
      'Dolca': 'Dolca burcu sizə yenilik ve azadliq verir.',
      'Baliq': 'Baliq burcu sizə xeyal ve şəfqət verir.',
    };
    return m[b] ?? '';
  }

  // Uygunluq ucun AI kimli hekaye
  static String uygunluq(double bonus, bool nikah, String a1, String a2) {
    if (nikah && bonus > 0.15) {
      return 'COX YAXSI! $a1 ve $a2 arasinda guclu bir uygunluq var. Kenzul Havas nikahi gosterir. Bonus $bonus gostericisi de yuksekdir. Bu munasibet uzunmuddetli ola biler.';
    }
    if (nikah && bonus <= 0.15) {
      return 'YAXSI. $a1 ve $a2 arasinda uygunluq var. Nikah olacaq, amma bonus $bonus - orta seviyyededir. Munasibetde sebr ve qaygi lazimdir.';
    }
    if (!nikah && bonus > 0.15) {
      return 'DIQQET! $a1 ve $a2 arasinda guclu enerji var (bonus $bonus), amma Kenzul Havas nikahi gostermir. Bu o demekdir ki, cekim var, amma munasibet uzun sure bilmez.';
    }
    return 'CEtin. $a1 ve $a2 arasinda uygunluq zeifdir. Bonus $bonus ve nikah gostericisi negativdir. Bu munasibet ucun cox calismali olacaq.';
  }

  // Tarot ucun AI kimli metn
  static String tarot(String kart, String mena, String niyyet) {
    return 'Kartiniz: $kart. Menası: $mena. Niyyetiniz: $niyyet. Bu kart size deyir ki, hadiseler sizin lehinize inkisaf edir. Diqqetli olun ve intuisiya guvenin.';
  }

  // Reml ucun AI kimli metn
  static String reml(String fiqur, String mena, String niyyet) {
    return 'Fiqurunuz: $fiqur. Menası: $mena. Niyyetiniz: $niyyet. Bu fiqur gosterir ki, qarsinizda acilan yeni imkanlar var. Onlari deyerlendirin.';
  }

  // Movqe ucun AI kimli metn
  static String movqe(bool beka, String ad, String yer) {
    if (beka) {
      return '$ad, $yer-de uzun muddet qalacaq. Bu sizin ucun ugurlu bir donemdir. Yerli insanlarla munasibetler qurun.';
    }
    return '$ad, $yer-de cox qalmayacaq. Bu kecici bir donemdir. Esas meqsedinize fokus olun, tezlikle yeni imkanlar acilacaq.';
  }

  // Gunun kartı
  static Map<String, String> gununKarti() {
    final kartlar = [
      {'ad': 'Gunes', 'm': 'Ugur ve sevinc', 's': '\u2600'},
      {'ad': 'Araba', 'm': 'Qelebe ve hereket', 's': '\u{1F3C7}'},
      {'ad': 'Guc', 'm': 'Daxili guc', 's': '\u{1F981}'},
      {'ad': 'Ulduz', 'm': 'Umid ve ilham', 's': '\u2B50'},
      {'ad': 'Dunya', 'm': 'Tamamlanma', 's': '\u{1F30D}'},
      {'ad': 'Bext Carxi', 'm': 'Sans ve donus', 's': '\u{1F3A1}'},
      {'ad': 'Imperator', 'm': 'Liderlik', 's': '\u{1F3DB}'},
    ];
    return kartlar[_r.nextInt(kartlar.length)];
  }
}
