import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SehifeCompat extends StatefulWidget {
  const SehifeCompat({super.key});
  @override
  State<SehifeCompat> createState() => _SehifeCompatState();
}

class _SehifeCompatState extends State<SehifeCompat> {
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;
  static const yasil = Colors.greenAccent;

  final a1 = TextEditingController();
  final a2 = TextEditingController();
  final g1 = TextEditingController();
  final m1 = TextEditingController();
  final i1 = TextEditingController();
  final g2 = TextEditingController();
  final m2 = TextEditingController();
  final i2 = TextEditingController();
  final sg = TextEditingController();
  bool hicri = false;
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

  String bT(int g, int a) {
    if ((a == 3 && g >= 21) || (a == 4 && g <= 19)) return 'Qoc';
    if ((a == 4 && g >= 20) || (a == 5 && g <= 20)) return 'Buga';
    if ((a == 5 && g >= 21) || (a == 6 && g <= 20)) return 'Ekizler';
    if ((a == 6 && g >= 21) || (a == 7 && g <= 22)) return 'Xerceng';
    if ((a == 7 && g >= 23) || (a == 8 && g <= 22)) return 'Sir';
    if ((a == 8 && g >= 23) || (a == 9 && g <= 22)) return 'Qiz';
    if ((a == 9 && g >= 23) || (a == 10 && g <= 22)) return 'Terezi';
    if ((a == 10 && g >= 23) || (a == 11 && g <= 21)) return 'Eqreb';
    if ((a == 11 && g >= 22) || (a == 12 && g <= 21)) return 'Oxatan';
    if ((a == 12 && g >= 22) || (a == 1 && g <= 19)) return 'Oglaq';
    if ((a == 1 && g >= 20) || (a == 2 && g <= 18)) return 'Dolca';
    return 'Baliq';
  }

  String el(String b) {
    final m = {'Qoc':'Od','Buga':'Torpaq','Ekizler':'Hava','Xerceng':'Su','Sir':'Od','Qiz':'Torpaq','Terezi':'Hava','Eqreb':'Su','Oxatan':'Od','Oglaq':'Torpaq','Dolca':'Hava','Baliq':'Su'};
    return m[b] ?? '';
  }

  static const List<int> ictima = [1,2,3,4,7,11,13,14,15,16,17,18,19,20,22,23,26,27,28];
  static const List<int> iftirak = [5,6,8,9,10,12,21,24,25,29,30];

  void hesabla() {
    if (a1.text.isEmpty || a2.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Adlari doldurun!'), backgroundColor: Colors.red));
      return;
    }
    int e1 = ebH(a1.text); int e2 = ebH(a2.text);
    int c1 = cfH(e1); int c2 = cfH(e2);
    int p1 = pfH(a1.text); int p2 = pfH(a2.text);
    String b1 = bT(int.tryParse(g1.text) ?? 1, int.tryParse(m1.text) ?? 1);
    String b2 = bT(int.tryParse(g2.text) ?? 1, int.tryParse(m2.text) ?? 1);
    String el1 = el(b1); String el2 = el(b2);

    double bonus = 0.0;
    if (e1 > 0 || e2 > 0) {
      double mx = (e1 > e2 ? e1 : e2).toDouble();
      if (mx > 0) bonus += ((e1 - e2) / mx) * 0.30;
    }
    bonus += ((c1 - c2) / 9.0) * 0.35;
    bonus += ((p1 - p2) / 9.0) * 0.35;
    bonus += ((e1 - e2) / 200.0) * 0.20;

    double elB = 0.0;
    if ((el1 == 'Od' && el2 == 'Hava') || (el1 == 'Hava' && el2 == 'Od')) elB = 0.15;
    else if ((el1 == 'Su' && el2 == 'Torpaq') || (el1 == 'Torpaq' && el2 == 'Su')) elB = 0.10;
    else if ((el1 == 'Od' && el2 == 'Torpaq') || (el1 == 'Torpaq' && el2 == 'Od')) elB = -0.05;
    else if ((el1 == 'Hava' && el2 == 'Su') || (el1 == 'Su' && el2 == 'Hava')) elB = -0.05;
    else if (el1 == el2) elB = 0.05;

    Map<String, double> dost = {
      'Qoc-Sir': 0.25, 'Sir-Qoc': 0.25, 'Qoc-Oxatan': 0.22, 'Oxatan-Qoc': 0.22,
      'Sir-Oxatan': 0.24, 'Oxatan-Sir': 0.24, 'Buga-Qiz': 0.20, 'Qiz-Buga': 0.20,
      'Buga-Oglaq': 0.18, 'Oglaq-Buga': 0.18, 'Ekizler-Terezi': 0.22, 'Terezi-Ekizler': 0.22,
      'Ekizler-Dolca': 0.20, 'Dolca-Ekizler': 0.20, 'Xerceng-Eqreb': 0.28, 'Eqreb-Xerceng': 0.28,
      'Xerceng-Baliq': 0.26, 'Baliq-Xerceng': 0.26,
    };
    double burcB = dost[b1 + '-' + b2] ?? (b1 == b2 ? 0.15 : 0.05);

    int sgG = int.tryParse(sg.text) ?? 1;
    int knz = (e1 + e2 + sgG + 20) % 30;
    if (knz == 0) knz = 30;
    bool nikah = ictima.contains(knz);
    bool ayriliq = iftirak.contains(knz);

    double umumi = bonus + elB + burcB;
    String netice = umumi > 0.15 ? a1.text + ' ustundur' : (umumi < -0.15 ? a2.text + ' ustundur' : 'Beraber gucler');
    Color renk = umumi > 0.15 ? yasil : (umumi < -0.15 ? qizil : qizil);

    HapticFeedback.mediumImpact();
    setState(() {
      n = {
        'e1': e1, 'e2': e2, 'c1': c1, 'c2': c2, 'p1': p1, 'p2': p2,
        'b1': b1, 'b2': b2, 'el1': el1, 'el2': el2,
        'eB': bonus, 'elB': elB, 'bB': burcB, 'umumi': umumi,
        'netice': netice, 'renk': renk, 'knz': knz, 'nikah': nikah, 'ayriliq': ayriliq,
      };
    });
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
        title: const Text('UYGUNLUQ', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 16)),
        iconTheme: const IconThemeData(color: qirmizi),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: tundQara, borderRadius: BorderRadius.circular(12)),
            child: Column(children: [
              const Text('1-ci Sexs', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              f(a1, 'Ad'),
              const SizedBox(height: 8),
              Row(children: [
                Expanded(child: f(g1, 'Gun')),
                const SizedBox(width: 6),
                Expanded(child: f(m1, 'Ay')),
                const SizedBox(width: 6),
                Expanded(child: f(i1, 'Il')),
              ]),
            ]),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: tundQara, borderRadius: BorderRadius.circular(12)),
            child: Column(children: [
              const Text('2-ci Sexs', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              f(a2, 'Ad'),
              const SizedBox(height: 8),
              Row(children: [
                Expanded(child: f(g2, 'Gun')),
                const SizedBox(width: 6),
                Expanded(child: f(m2, 'Ay')),
                const SizedBox(width: 6),
                Expanded(child: f(i2, 'Il')),
              ]),
            ]),
          ),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: f(sg, 'Sual gunu (1-30)')),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(color: tundQara, borderRadius: BorderRadius.circular(10), border: Border.all(color: hicri ? yasil : qizil)),
              child: Row(children: [
                Text(hicri ? 'Hicri' : 'Miladi', style: const TextStyle(color: ag, fontSize: 12)),
                Switch(value: hicri, activeColor: yasil, onChanged: (v) => setState(() => hicri = v)),
              ]),
            ),
          ]),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: hesabla,
            icon: const Icon(Icons.favorite),
            label: const Text('HESABLA', style: TextStyle(fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: qirmizi, foregroundColor: ag,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const SizedBox(height: 20),
          if (n != null) ...[
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: tundQara, borderRadius: BorderRadius.circular(16), border: Border.all(color: n!['renk'], width: 2)),
              child: Column(children: [
                Icon(n!['nikah'] ? Icons.favorite : Icons.heart_broken, color: n!['nikah'] ? yasil : qirmizi, size: 50),
                const SizedBox(height: 12),
                Text(n!['nikah'] ? 'NIKAH OLACAQ' : 'NIKAH OLMAYACAQ', style: TextStyle(color: n!['nikah'] ? yasil : qirmizi, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                const SizedBox(height: 8),
                Text('Bonus: ' + n!['umumi'].toStringAsFixed(3), style: const TextStyle(color: ag, fontSize: 16)),
                const SizedBox(height: 4),
                Text(n!['netice'], style: TextStyle(color: n!['renk'], fontSize: 15, fontWeight: FontWeight.bold)),
              ]),
            ),
            const SizedBox(height: 16),
            k(n!['b1'] + ' (' + n!['el1'] + ')', 'Ebc: ' + n!['e1'].toString() + ' | Cifr: ' + n!['c1'].toString() + ' | Numer: ' + n!['p1'].toString(), Colors.cyan),
            k(n!['b2'] + ' (' + n!['el2'] + ')', 'Ebc: ' + n!['e2'].toString() + ' | Cifr: ' + n!['c2'].toString() + ' | Numer: ' + n!['p2'].toString(), Colors.purpleAccent),
            k('Tefsilar', 'Reqem bonusu: ' + n!['eB'].toStringAsFixed(3) + '\nElement: ' + n!['elB'].toStringAsFixed(3) + '\nBurc: ' + n!['bB'].toStringAsFixed(3) + '\nKenzul: ' + n!['knz'].toString(), qizil),
          ],
        ]),
      ),
    );
  }
}
