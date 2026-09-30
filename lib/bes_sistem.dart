import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ========== 1. SINASTRİYA ==========
class Sinastriya extends StatefulWidget {
  const Sinastriya({super.key});
  @override
  State<Sinastriya> createState() => _SinastriyaState();
}
class _SinastriyaState extends State<Sinastriya> {
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;
  final a1 = TextEditingController(); final a2 = TextEditingController();
  final g1 = TextEditingController(); final m1 = TextEditingController(); final i1 = TextEditingController();
  final g2 = TextEditingController(); final m2 = TextEditingController(); final i2 = TextEditingController();
  Map<String, dynamic>? n;
  static const bAd = ['Qoc','Buga','Ekizler','Xerceng','Sir','Qiz','Terezi','Eqreb','Oxatan','Oglaq','Dolca','Baliq'];
  static const el = ['Od','Torpaq','Hava','Su','Od','Torpaq','Hava','Su','Od','Torpaq','Hava','Su'];
  String bT(int g, int a) {
    if ((a == 3 && g >= 21) || (a == 4 && g <= 19)) return bAd[0];
    if ((a == 4 && g >= 20) || (a == 5 && g <= 20)) return bAd[1];
    if ((a == 5 && g >= 21) || (a == 6 && g <= 20)) return bAd[2];
    if ((a == 6 && g >= 21) || (a == 7 && g <= 22)) return bAd[3];
    if ((a == 7 && g >= 23) || (a == 8 && g <= 22)) return bAd[4];
    if ((a == 8 && g >= 23) || (a == 9 && g <= 22)) return bAd[5];
    if ((a == 9 && g >= 23) || (a == 10 && g <= 22)) return bAd[6];
    if ((a == 10 && g >= 23) || (a == 11 && g <= 21)) return bAd[7];
    if ((a == 11 && g >= 22) || (a == 12 && g <= 21)) return bAd[8];
    if ((a == 12 && g >= 22) || (a == 1 && g <= 19)) return bAd[9];
    if ((a == 1 && g >= 20) || (a == 2 && g <= 18)) return bAd[10];
    return bAd[11];
  }
  void h() {
    if (g1.text.isEmpty || g2.text.isEmpty) return;
    String b1 = bT(int.parse(g1.text), int.parse(m1.text));
    String b2 = bT(int.parse(g2.text), int.parse(m2.text));
    int e1 = el[bAd.indexOf(b1)].length; int e2 = el[bAd.indexOf(b2)].length;
    String eA = el[bAd.indexOf(b1)]; String eB = el[bAd.indexOf(b2)];
    String netice; Color renk;
    if (eA == eB) { netice = 'Eyni element - GUCLU UYĞUNLUQ'; renk = Colors.greenAccent; }
    else if ((eA == 'Od' && eB == 'Hava') || (eA == 'Hava' && eB == 'Od')) { netice = 'Dost elementler - YAXSI'; renk = Colors.greenAccent; }
    else if ((eA == 'Su' && eB == 'Torpaq') || (eA == 'Torpaq' && eB == 'Su')) { netice = 'Dost elementler - YAXSI'; renk = Colors.greenAccent; }
    else if (b1 == b2) { netice = 'Eyni burc - TARAZLIQ'; renk = qizil; }
    else { netice = 'Ferqli enerjiler - ORTA'; renk = Colors.amber; }
    HapticFeedback.mediumImpact();
    setState(() { n = {'b1': b1, 'b2': b2, 'eA': eA, 'eB': eB, 'n': netice, 'r': renk}; });
  }
  Widget f(TextEditingController c, String l) => TextField(controller: c, decoration: InputDecoration(labelText: l, labelStyle: const TextStyle(color: qizil), border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: qirmizi))));
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: qara, appBar: AppBar(backgroundColor: tundQara, title: const Text('SINASTRİYA', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 15)), iconTheme: const IconThemeData(color: qirmizi)),
      body: SingleChildScrollView(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: tundQara, borderRadius: BorderRadius.circular(12)), child: Column(children: [const Text('1-ci Sexs', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold)), f(a1, 'Ad'), Row(children: [Expanded(child: f(g1, 'Gun')), Expanded(child: f(m1, 'Ay')), Expanded(child: f(i1, 'Il'))])])),
        const SizedBox(height: 8),
        Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: tundQara, borderRadius: BorderRadius.circular(12)), child: Column(children: [const Text('2-ci Sexs', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold)), f(a2, 'Ad'), Row(children: [Expanded(child: f(g2, 'Gun')), Expanded(child: f(m2, 'Ay')), Expanded(child: f(i2, 'Il'))])])),
        const SizedBox(height: 14),
        ElevatedButton(onPressed: h, style: ElevatedButton.styleFrom(backgroundColor: qirmizi, padding: const EdgeInsets.symmetric(vertical: 14)), child: const Text('HESABLA', style: TextStyle(color: ag, fontWeight: FontWeight.bold))),
        const SizedBox(height: 16),
        if (n != null) Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: tundQara, borderRadius: BorderRadius.circular(14), border: Border.all(color: n!['r'], width: 2)), child: Column(children: [
          Text(n!['n'], style: TextStyle(color: n!['r'], fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          const SizedBox(height: 12),
          Text(n!['b1'] + ' + ' + n!['b2'], style: const TextStyle(color: ag, fontSize: 16)),
          Text('Element: ' + n!['eA'] + ' + ' + n!['eB'], style: const TextStyle(color: ag, fontSize: 14)),
        ])),
      ])));
  }
}

// ========== 2. VEDIC ==========
class Vedic extends StatefulWidget {
  const Vedic({super.key});
  @override
  State<Vedic> createState() => _VedicState();
}
class _VedicState extends State<Vedic> {
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;
  final g = TextEditingController(); final a = TextEditingController(); final i = TextEditingController();
  Map<String, dynamic>? n;
  static const List<String> nak = ['Ashwini','Bharani','Krittika','Rohini','Mrigashira','Ardra','Punarvasu','Pushya','Ashlesha','Magha','P.Phalguni','U.Phalguni','Hasta','Chitra','Swati','Vishakha','Anuradha','Jyeshtha','Mula','P.Ashadha','U.Ashadha','Shravana','Dhanishta','Shatabhisha','P.Bhadrapada','U.Bhadrapada','Revati'];
  void h() {
    if (g.text.isEmpty) return;
    int gi = int.parse(g.text); int ai = int.parse(a.text); int ii = int.parse(i.text);
    int gunSay = (ii - 2000) * 365 + (ai - 1) * 30 + gi;
    int idx = (gunSay * 27 ~/ 365) % 27;
    HapticFeedback.mediumImpact();
    setState(() { n = {'nak': nak[idx], 'idx': idx + 1}; });
  }
  Widget f(TextEditingController c, String l) => TextField(controller: c, decoration: InputDecoration(labelText: l, labelStyle: const TextStyle(color: qizil), border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: qirmizi))));
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: qara, appBar: AppBar(backgroundColor: tundQara, title: const Text('VEDIC ASTROLOGIYA', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 15)), iconTheme: const IconThemeData(color: qirmizi)),
      body: SingleChildScrollView(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [Expanded(child: f(g, 'Gun')), const SizedBox(width: 6), Expanded(child: f(a, 'Ay')), const SizedBox(width: 6), Expanded(child: f(i, 'Il'))]),
        const SizedBox(height: 16),
        ElevatedButton(onPressed: h, style: ElevatedButton.styleFrom(backgroundColor: qirmizi, padding: const EdgeInsets.symmetric(vertical: 14)), child: const Text('NAKSHATRA TAP', style: TextStyle(color: ag, fontWeight: FontWeight.bold))),
        const SizedBox(height: 20),
        if (n != null) Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: tundQara, borderRadius: BorderRadius.circular(14), border: Border.all(color: qizil, width: 2)), child: Column(children: [
          Text('Nakshatra #' + n!['idx'].toString(), style: const TextStyle(color: qizil, fontSize: 14)),
          const SizedBox(height: 8),
          Text(n!['nak'], style: const TextStyle(color: ag, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('27 Ulduz Menzilinden biri', style: TextStyle(color: Colors.white70, fontSize: 12)),
        ])),
      ])));
  }
}

// ========== 3. BA ZI ==========
class BaZi extends StatefulWidget {
  const BaZi({super.key});
  @override
  State<BaZi> createState() => _BaZiState();
}
class _BaZiState extends State<BaZi> {
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;
  final s = TextEditingController(); final d = TextEditingController(); final saat = TextEditingController();
  Map<String, dynamic>? n;
  static const List<String> heyvan = ['Siçovul','Öküz','Pələng','Dovşan','Əjdaha','İlan','At','Qoyun','Meymun','Xoruz','İt','Donuz'];
  static const List<String> element = ['Metal','Metal','Su','Su','Odun','Odun','Od','Od','Torpaq','Torpaq'];
  void h() {
    if (s.text.isEmpty) return;
    int ii = int.parse(s.text); int aa = int.parse(d.text); int gg = int.parse(saat.text);
    String h1 = heyvan[ii % 12]; String e1 = element[ii % 10];
    String h2 = heyvan[aa % 12]; String e2 = element[aa % 10];
    String h3 = heyvan[gg % 12]; String e3 = element[gg % 10];
    HapticFeedback.mediumImpact();
    setState(() { n = {'h1': h1, 'e1': e1, 'h2': h2, 'e2': e2, 'h3': h3, 'e3': e3}; });
  }
  Widget f(TextEditingController c, String l) => TextField(controller: c, decoration: InputDecoration(labelText: l, labelStyle: const TextStyle(color: qizil), border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: qirmizi))));
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: qara, appBar: AppBar(backgroundColor: tundQara, title: const Text('BA ZI (4 SUTUN)', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 15)), iconTheme: const IconThemeData(color: qirmizi)),
      body: SingleChildScrollView(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        f(s, 'Il'), const SizedBox(height: 8), f(d, 'Ay'), const SizedBox(height: 8), f(saat, 'Gun'),
        const SizedBox(height: 16),
        ElevatedButton(onPressed: h, style: ElevatedButton.styleFrom(backgroundColor: qirmizi, padding: const EdgeInsets.symmetric(vertical: 14)), child: const Text('PILLARLARI TAP', style: TextStyle(color: ag, fontWeight: FontWeight.bold))),
        const SizedBox(height: 20),
        if (n != null) ...[
          Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: tundQara, borderRadius: BorderRadius.circular(12), border: Border.all(color: qizil.withOpacity(0.5))), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('IL SUTUNU', style: TextStyle(color: qizil, fontWeight: FontWeight.bold, fontSize: 12)),
            Text(n!['h1'] + ' - ' + n!['e1'], style: const TextStyle(color: ag, fontSize: 16)),
            const SizedBox(height: 12),
            const Text('AY SUTUNU', style: TextStyle(color: qizil, fontWeight: FontWeight.bold, fontSize: 12)),
            Text(n!['h2'] + ' - ' + n!['e2'], style: const TextStyle(color: ag, fontSize: 16)),
            const SizedBox(height: 12),
            const Text('GUN SUTUNU', style: TextStyle(color: qizil, fontWeight: FontWeight.bold, fontSize: 12)),
            Text(n!['h3'] + ' - ' + n!['e3'], style: const TextStyle(color: ag, fontSize: 16)),
          ])),
        ],
      ])));
  }
}

// ========== 4. KABBALAH ==========
class Kabbalah extends StatefulWidget {
  const Kabbalah({super.key});
  @override
  State<Kabbalah> createState() => _KabbalahState();
}
class _KabbalahState extends State<Kabbalah> {
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;
  final ad = TextEditingController();
  Map<String, dynamic>? n;
  static const List<Map<String, String>> sef = [
    {'a': 'Keter', 'm': 'Tac - Ilahi irade'},
    {'a': 'Chokhmah', 'm': 'Hikmet - Yaradiciliq'},
    {'a': 'Binah', 'm': 'Anlama - Idrak'},
    {'a': 'Chesed', 'm': 'Sevgi - Merhamet'},
    {'a': 'Gevurah', 'm': 'Guc - Edalet'},
    {'a': 'Tiferet', 'm': 'Gozellik - Tarazliq'},
    {'a': 'Netzach', 'm': 'Qelebe - Davamliliq'},
    {'a': 'Hod', 'm': 'Ehtiram - Teslimiyyet'},
    {'a': 'Yesod', 'm': 'Temel - Baglanti'},
    {'a': 'Malkuth', 'm': 'Krallıq - Maddi dunya'},
  ];
  static final Map<String, int> eb = {'a':1,'e':1,'b':2,'p':2,'c':3,'g':3,'d':4,'h':5,'v':6,'o':6,'u':6,'z':7,'i':10,'y':10,'k':20,'l':30,'m':40,'n':50,'s':60,'f':80,'q':100,'r':200,'t':400,'x':600,'\u0259':1,'\u00e7':3,'\u00f6':6,'\u00fc':6,'\u0131':10,'\u015f':300,'\u011f':1000};
  void h() {
    if (ad.text.isEmpty) return;
    int c = 0; String k = ad.text.toLowerCase();
    for (int i = 0; i < k.length; i++) { if (eb.containsKey(k[i])) c += eb[k[i]]!; }
    int idx = c % 10;
    HapticFeedback.mediumImpact();
    setState(() { n = {'sef': sef[idx], 'req': c}; });
  }
  Widget f(TextEditingController c, String l) => TextField(controller: c, decoration: InputDecoration(labelText: l, labelStyle: const TextStyle(color: qizil), border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: qirmizi))));
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: qara, appBar: AppBar(backgroundColor: tundQara, title: const Text('KABBALAH', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 15)), iconTheme: const IconThemeData(color: qirmizi)),
      body: SingleChildScrollView(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        f(ad, 'Adiniz'),
        const SizedBox(height: 16),
        ElevatedButton(onPressed: h, style: ElevatedButton.styleFrom(backgroundColor: qirmizi, padding: const EdgeInsets.symmetric(vertical: 14)), child: const Text('SEFIROT TAP', style: TextStyle(color: ag, fontWeight: FontWeight.bold))),
        const SizedBox(height: 20),
        if (n != null) Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: tundQara, borderRadius: BorderRadius.circular(14), border: Border.all(color: qizil, width: 2)), child: Column(children: [
          const Icon(Icons.account_tree, color: qizil, size: 50),
          const SizedBox(height: 12),
          Text(n!['sef']['a']!, style: const TextStyle(color: qizil, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(n!['sef']['m']!, style: const TextStyle(color: ag, fontSize: 14)),
          const SizedBox(height: 8),
          Text('Ebcəd: ' + n!['req'].toString(), style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ])),
      ])));
  }
}

// ========== 5. RUNES ==========
class Runes extends StatefulWidget {
  const Runes({super.key});
  @override
  State<Runes> createState() => _RunesState();
}
class _RunesState extends State<Runes> {
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;
  final ad = TextEditingController(); final niyyet = TextEditingController();
  Map<String, dynamic>? n;
  static const List<Map<String, String>> r = [
    {'a': 'Fehu', 'm': 'Varliq, bolluq, ugur'},
    {'a': 'Uruz', 'm': 'Guc, saglamliq, enerji'},
    {'a': 'Thurisaz', 'm': 'Qoruma, mudafie'},
    {'a': 'Ansuz', 'm': 'Bilik, kommunikasiya'},
    {'a': 'Raidho', 'm': 'Seyahet, hereket'},
    {'a': 'Kenaz', 'm': 'Yaradiciliq, ilham'},
    {'a': 'Gebo', 'm': 'Hediye, mubadile'},
    {'a': 'Wunjo', 'm': 'Sevinc, harmoniya'},
    {'a': 'Hagalaz', 'm': 'Deyisim, sarsinti'},
    {'a': 'Nauthiz', 'm': 'Ehtiyac, sebir'},
    {'a': 'Isa', 'm': 'Fokus, gozleme'},
    {'a': 'Jera', 'm': 'Mehsul, mükafat'},
    {'a': 'Eihwaz', 'm': 'Guc, davamliliq'},
    {'a': 'Perthro', 'm': 'Sirr, gizli bilik'},
    {'a': 'Algiz', 'm': 'Qoruma, intuisiya'},
    {'a': 'Sowilo', 'm': 'Gunes, qelebe'},
    {'a': 'Tiwaz', 'm': 'Edalet, cesaret'},
    {'a': 'Berkano', 'm': 'Dogus, yeni baslangic'},
    {'a': 'Ehwaz', 'm': 'Ireli, terefdas'},
    {'a': 'Mannaz', 'm': 'Insan, cemiyyet'},
    {'a': 'Laguz', 'm': 'Su, intuisiya'},
    {'a': 'Ingwaz', 'm': 'Tamamlanma'},
    {'a': 'Dagaz', 'm': 'Oyanis, donusum'},
    {'a': 'Othala', 'm': 'Miras, aile'},
  ];
  int hash(String s) { int h = 0; for (int i = 0; i < s.length; i++) h = (h * 31 + s.codeUnitAt(i)) % 100000; return h; }
  void h() {
    if (ad.text.isEmpty || niyyet.text.isEmpty) return;
    int idx = hash(ad.text + niyyet.text) % 24;
    HapticFeedback.mediumImpact();
    setState(() { n = {'r': r[idx], 'idx': idx}; });
  }
  Widget f(TextEditingController c, String l) => TextField(controller: c, decoration: InputDecoration(labelText: l, labelStyle: const TextStyle(color: qizil), border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: qirmizi))));
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: qara, appBar: AppBar(backgroundColor: tundQara, title: const Text('RUNES', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 15)), iconTheme: const IconThemeData(color: qirmizi)),
      body: SingleChildScrollView(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        f(ad, 'Adiniz'), const SizedBox(height: 8), f(niyyet, 'Niyyetiniz'),
        const SizedBox(height: 16),
        ElevatedButton(onPressed: h, style: ElevatedButton.styleFrom(backgroundColor: qirmizi, padding: const EdgeInsets.symmetric(vertical: 14)), child: const Text('RUN CEK', style: TextStyle(color: ag, fontWeight: FontWeight.bold))),
        const SizedBox(height: 20),
        if (n != null) Container(padding: const EdgeInsets.all(24), decoration: BoxDecoration(color: tundQara, borderRadius: BorderRadius.circular(14), border: Border.all(color: qizil, width: 2)), child: Column(children: [
          Text(n!['r']['a']![0], style: const TextStyle(color: qizil, fontSize: 60, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Text(n!['r']['a']!, style: const TextStyle(color: qizil, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(n!['r']['m']!, style: const TextStyle(color: ag, fontSize: 15), textAlign: TextAlign.center),
        ])),
      ])));
  }
}
