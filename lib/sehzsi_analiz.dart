import 'content.dart';
import 'package:flutter/material.dart';
import 'ai_destek.dart';
import 'paylas.dart';
import 'package:flutter/services.dart';

class SehifePersonal extends StatefulWidget {
  const SehifePersonal({super.key});
  @override
  State<SehifePersonal> createState() => _SehifePersonalState();
}

class _SehifePersonalState extends State<SehifePersonal> {
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;

  final ad = TextEditingController();
  final gun = TextEditingController();
  final ay = TextEditingController();
  final il = TextEditingController();
  Map<String, dynamic>? n;

  static final Map<String, int> eb = {
    'a': 1, 'e': 1, 'b': 2, 'p': 2, 'c': 3, 'g': 3, 'd': 4, 'h': 5,
    'v': 6, 'o': 6, 'u': 6, 'z': 7, 'i': 10, 'y': 10, 'k': 20, 'l': 30,
    'm': 40, 'n': 50, 's': 60, 'f': 80, 'q': 100, 'r': 200, 't': 400, 'x': 600,
    '\u0259': 1, '\u00e7': 3, '\u00f6': 6, '\u00fc': 6, '\u0131': 10, '\u015f': 300, '\u011f': 1000,
  };

  static final Map<String, int> pf = {
    'a': 1, 'b': 2, 'c': 3, 'd': 4, 'e': 5, 'f': 6, 'g': 7, 'h': 8,
    'i': 9, 'j': 1, 'k': 2, 'l': 3, 'm': 4, 'n': 5, 'o': 6, 'p': 7,
    'q': 8, 'r': 9, 's': 1, 't': 2, 'u': 3, 'v': 4, 'w': 5, 'x': 6,
    'y': 7, 'z': 8, '\u0259': 5, '\u00e7': 3, '\u00f6': 6, '\u00fc': 3, '\u0131': 9, '\u015f': 1, '\u011f': 7,
  };

  static const Map<int, String> cm = {
    1: 'Vahid, Liderlik', 2: 'Cutluk, Harmoniya', 3: 'Ucluk, Yaradiciliq',
    4: 'Dordluk, Sabitlik', 5: 'Beslik, Deyisim', 6: 'Altiliq, Mesuliyyet',
    7: 'Yeddilik, Mudriklik', 8: 'Sekkizlik, Bolluq', 9: 'Doqquzluq, Kamillik',
  };

  static const List<String> amL = [
    'Serateyn','Betn','Sureya','Debaran','Heqeh','Henneh','Zire','Nesre',
    'Terfe','Cebhe','Zubra','Serfe','Ava','Simak','Gafr','Zubana','Iklil','Qelb',
    'Sovle','Neayim','Belde','SedZabih','SedBula','SedSuud','SedAhbiye',
    'FergMukdim','FergMuaxir','Risa'
  ];

  static const List<String> iaL = [
    'Allah','ər-Rəhmən','ər-Rəhim','əl-Məlik','əl-Quddus','əs-Salam','əl-Mömin',
    'əl-Muheymin','əl-Əziz','əl-Cəbbar','əl-Mütəkəbbir','əl-Xaliq','əl-Bari',
    'əl-Musavvir','əl-Ğaffar','əl-Qəhhar','əl-Vəhhab','ər-Rəzzaq','əl-Fəttah',
    'əl-Alim','əl-Qabid','əl-Basit','əl-Hafid','ər-Rafi','əl-Müzz','əl-Müzill',
    'əs-Səmi','əl-Bəsir','əl-Həkəm','əl-Adl','əl-Lətif','əl-Xəbir','əl-Həlim'
  ];

  int ebH(String s) {
    int c = 0; String k = s.toLowerCase();
    for (int i = 0; i < k.length; i++) { if (eb.containsKey(k[i])) c += eb[k[i]]!; }
    return c;
  }

  int pfH(String s) {
    int c = 0; String k = s.toLowerCase();
    for (int i = 0; i < k.length; i++) { if (pf.containsKey(k[i])) c += pf[k[i]]!; }
    while (c > 9 && c != 11 && c != 22 && c != 33) { int y = 0; while (c > 0) { y += c % 10; c ~/= 10; } c = y; }
    return c;
  }

  int cfH(int e) { if (e == 0) return 0; int c = e % 9; return c == 0 ? 9 : c; }

  Map<String, String> bT(int g, int a) {
    if ((a == 3 && g >= 21) || (a == 4 && g <= 19)) return {'ad': 'Qoc', 'p': 'Mars', 'e': 'Od', 's': '\u2648'};
    if ((a == 4 && g >= 20) || (a == 5 && g <= 20)) return {'ad': 'Buga', 'p': 'Venera', 'e': 'Torpaq', 's': '\u2649'};
    if ((a == 5 && g >= 21) || (a == 6 && g <= 20)) return {'ad': 'Ekizler', 'p': 'Merkuri', 'e': 'Hava', 's': '\u264A'};
    if ((a == 6 && g >= 21) || (a == 7 && g <= 22)) return {'ad': 'Xerceng', 'p': 'Ay', 'e': 'Su', 's': '\u264B'};
    if ((a == 7 && g >= 23) || (a == 8 && g <= 22)) return {'ad': 'Sir', 'p': 'Gunes', 'e': 'Od', 's': '\u264C'};
    if ((a == 8 && g >= 23) || (a == 9 && g <= 22)) return {'ad': 'Qiz', 'p': 'Merkuri', 'e': 'Torpaq', 's': '\u264D'};
    if ((a == 9 && g >= 23) || (a == 10 && g <= 22)) return {'ad': 'Terezi', 'p': 'Venera', 'e': 'Hava', 's': '\u264E'};
    if ((a == 10 && g >= 23) || (a == 11 && g <= 21)) return {'ad': 'Eqreb', 'p': 'Pluton', 'e': 'Su', 's': '\u264F'};
    if ((a == 11 && g >= 22) || (a == 12 && g <= 21)) return {'ad': 'Oxatan', 'p': 'Yupiter', 'e': 'Od', 's': '\u2650'};
    if ((a == 12 && g >= 22) || (a == 1 && g <= 19)) return {'ad': 'Oglaq', 'p': 'Zuhal', 'e': 'Torpaq', 's': '\u2651'};
    if ((a == 1 && g >= 20) || (a == 2 && g <= 18)) return {'ad': 'Dolca', 'p': 'Uran', 'e': 'Hava', 's': '\u2652'};
    return {'ad': 'Baliq', 'p': 'Neptun', 'e': 'Su', 's': '\u2653'};
  }

  String pG(DateTime t) {
    final c = {7: 'Gunes', 1: 'Ay', 2: 'Mars', 3: 'Merkuri', 4: 'Yupiter', 5: 'Venera', 6: 'Zuhal'};
    return c[t.weekday] ?? 'Gunes';
  }

  String cB(int i) {
    final h = ['Meymun','Xoruz','It','Donuz','Sicovul','Okuz','Peleng','Dovsan','Ejdaha','Ilan','At','Qoyun'];
    return h[i % 12];
  }

  String dk(int g, String b) {
    int d = g % 30;
    return b + ' - ' + (d < 10 ? 'Dek1' : (d < 20 ? 'Dek2' : 'Dek3'));
  }

  String aM(int g, int a) { return amL[((a - 1) * 28 + g - 1) % 28]; }

  String hu(String a) {
    final m = ['Goz','Qas','Burun','Agiz','Cene','Yanaq','Alin','Sac','Boyun','Goz','Qas','Dil',
      'Dis','Dodaq','Dodaq','Qulaq','Cenealti','Yanaq','Alin','Sac','Kirpik','Kirpik','Goz qapagi',
      'Qas arasi','Alin ortasi','Goz alti','Sac uclari','Gizli'];
    return m[a.length % 28];
  }

  String vf(int e) {
    int m = e % 9; if (m == 0) m = 9;
    return m > 6 ? 'Guclu (' + m.toString() + ')' : (m >= 4 ? 'Orta (' + m.toString() + ')' : 'Zeif (' + m.toString() + ')');
  }

  String ia(int e) { return iaL[e % 33]; }

  void hesabla() {
    if (ad.text.isEmpty || gun.text.isEmpty || ay.text.isEmpty || il.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Butun xanalari doldurun!'), backgroundColor: Colors.red));
      return;
    }
    int g = int.parse(gun.text); int a = int.parse(ay.text); int i = int.parse(il.text);
    int e = ebH(ad.text); int c = cfH(e); int p = pfH(ad.text);
    int r = e % 9; if (r == 0) r = 9;
    var b = bT(g, a);
    HapticFeedback.mediumImpact();
    setState(() {
      n = {
        'ad': ad.text, 'e': e, 'c': c, 'p': p, 'r': r, 'b': b,
        'pg': pG(DateTime(i, a, g)), 'cb': cB(i),
        'dk': dk(g, b['ad']!), 'am': aM(g, a),
        'hu': hu(ad.text), 'vf': vf(e), 'ia': ia(e),
      };
    });
  }


  String? aiMetn;
  bool aiYuklenir = false;

  void aiAnaliz() async {
    if (n == null) return;
    setState(() => aiYuklenir = true);
    await Future.delayed(const Duration(milliseconds: 500));
    String metn = AI.sexsi(n!['e'], n!['c'], n!['p'], n!['b']['ad']);
    setState(() {
      aiMetn = metn;
      aiYuklenir = false;
    });
    HapticFeedback.mediumImpact();
  }

  Widget k(String b, String m, Color r) => Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(color: tundQara, borderRadius: BorderRadius.circular(12), border: Border.all(color: r.withOpacity(0.5))),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(b, style: TextStyle(color: r, fontWeight: FontWeight.bold, fontSize: 13)),
      const SizedBox(height: 5),
      Text(m, style: const TextStyle(color: ag, fontSize: 15, height: 1.5)),
    ]),
  );

  Widget f(TextEditingController c, String l) => TextField(
    controller: c,
    decoration: InputDecoration(
      labelText: l, labelStyle: const TextStyle(color: qizil),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: qirmizi)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: qara,
      appBar: AppBar(
        backgroundColor: tundQara,
        title: const Text('SEXSI ANALIZ', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 16)),
        iconTheme: const IconThemeData(color: qirmizi),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          f(ad, 'Ad ve Soyad'),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: f(gun, 'Gun')),
            const SizedBox(width: 8),
            Expanded(child: f(ay, 'Ay')),
            const SizedBox(width: 8),
            Expanded(child: f(il, 'Il')),
          ]),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: hesabla,
            icon: const Icon(Icons.auto_awesome),
            label: const Text('ANALIZ ET', style: TextStyle(fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: qirmizi, foregroundColor: ag,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),

          const SizedBox(height: 12),
          if (n != null) ElevatedButton.icon(
            onPressed: aiYuklenir ? null : aiAnaliz,
            icon: aiYuklenir ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: ag, strokeWidth: 2)) : const Icon(Icons.psychology),
            label: Text(aiYuklenir ? 'AI DUSUNUR...' : 'AI ANALIZ', style: const TextStyle(fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purpleAccent, foregroundColor: ag,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          if (aiMetn != null) Container(
            margin: const EdgeInsets.only(top: 14),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: tundQara,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.purpleAccent, width: 2),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Row(children: [
                Icon(Icons.psychology, color: Colors.purpleAccent, size: 24),
                SizedBox(width: 8),
                Text('AI ANALIZ', style: TextStyle(color: Colors.purpleAccent, fontWeight: FontWeight.bold, fontSize: 14)),
              ]),
              const SizedBox(height: 10),
              Text(aiMetn!, style: const TextStyle(color: ag, fontSize: 15, height: 1.5)),
            ]),
          ),

          const SizedBox(height: 20),
          if (n != null) ...[
            k('Ad', n!['ad'], ag),
            k(Content.ebcad, n!['e'].toString() + '\n' + mE(n!['e']), qizil),
            k(Content.cifr, n!['c'].toString() + ' - ' + Content.cifrMena(n!['c']) + '\n' + mC(n!['c']), Colors.purpleAccent),
            k(Content.rum, n!['r'].toString() + '\n' + mR(n!['r']), Colors.orangeAccent),
            k(Content.numer, n!['p'].toString() + '\n' + mN(n!['p']), Colors.cyan),
            k(Content.burc, n!['b']['ad'] + '\nPlanet: ' + n!['b']['p'] + '\nElement: ' + n!['b']['e'] + '\n' + mB(n!['b']['ad']), Colors.redAccent),
            k(Content.dekanat, n!['dk'], Colors.tealAccent),
            k(Content.ayMenzili, n!['am'] + '\n' + mAm(n!['am']), Colors.indigoAccent),
            k(Content.hurufi, n!['hu'] + '\n' + mHu(n!['hu']), Colors.pinkAccent),
            k(Content.vefq, n!['vf'] + '\n' + mV(n!['e']), Colors.deepOrangeAccent),
            k(Content.ismiAzam, n!['ia'] + '\n' + mIa(n!['ia']), Colors.lightGreenAccent),
            k(Content.planetGunu, n!['pg'], Colors.blueAccent),
            k(Content.cinBurcu, n!['cb'], Colors.greenAccent),
          ],
        ]),
      ),
    );
  }
}

String mE(int e) => 'Adinizin mistik gucu ' + e.toString() + '-dir.';
String mC(int c) {
  final m = {1:'Liderlik enerjisi.',2:'Harmoniya.',3:'Yaradiciliq.',4:'Sabitlik.',5:'Deyisim.',6:'Mesuliyyet.',7:'Meneviyyat.',8:'Bolluq.',9:'Kamillik.'};
  return m[c] ?? '';
}
String mR(int r) => r % 2 == 1 ? 'Ferdiyye - Hucumcu.' : 'Zovciyye - Mudafieci.';
String mN(int n) {
  final m = {1:'Liderlik.',2:'Emekdasliq.',3:'Optimizm.',4:'Sebir.',5:'Azadliq.',6:'Aile.',7:'Mudriklik.',8:'Ugur.',9:'Humanizm.',11:'Master intuisiya.',22:'Master qurucusu.',33:'Master muellimi.'};
  return m[n] ?? '';
}
String mB(String b) {
  final m = {'Qoc':'Cesur, Mars tesiri.','Buga':'Sebirli, Venera tesiri.','Ekizler':'Cevik, Merkuri tesiri.','Xerceng':'Duygusal, Ay tesiri.','Sir':'Lider, Gunes tesiri.','Qiz':'Analitik, Merkuri tesiri.','Terezi':'Balansli, Venera tesiri.','Eqreb':'Guclu, Pluton tesiri.','Oxatan':'Optimist, Yupiter tesiri.','Oglaq':'Meqsedli, Zuhal tesiri.','Dolca':'Yenilikci, Uran tesiri.','Baliq':'Xeyalpərəst, Neptun tesiri.'};
  return m[b] ?? '';
}
String mAm(String am) => 'Ay menzili enerjisi: ' + am;
String mHu(String h) => 'Uzun ' + h + ' cizgisi.';
String mV(int e) {
  int m = e % 9; if (m == 0) m = 9;
  return m > 6 ? 'Guclu merkez.' : (m >= 4 ? 'Orta merkez.' : 'Zeif merkez.');
}
String mIa(String ia) => ia + ' - Allahn adlarindan biri.';
