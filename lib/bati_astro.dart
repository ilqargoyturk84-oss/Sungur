import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatiAstro extends StatefulWidget {
  const BatiAstro({super.key});
  @override
  State<BatiAstro> createState() => _BatiAstroState();
}

class _BatiAstroState extends State<BatiAstro> {
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;

  final ad = TextEditingController();
  final gun = TextEditingController();
  final ay = TextEditingController();
  final il = TextEditingController();
  final saat = TextEditingController();
  final deq = TextEditingController();
  Map<String, dynamic>? n;

  static const List<String> burcAd = ['Qoc','Buga','Ekizler','Xerceng','Sir','Qiz','Terezi','Eqreb','Oxatan','Oglaq','Dolca','Baliq'];
  static const List<String> burcEmoji = ['G','B','E','X','S','Q','T','R','O','L','D','F'];
  static const List<String> planetler = ['Gunes','Ay','Merkuri','Venera','Mars','Yupiter','Zuhal','Uran','Neptun','Pluton'];

  String gunesB(int g, int a) {
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

  String ayB(int g, int a, int i) {
    int gs = (i - 2000) * 365 + (a - 1) * 30 + g;
    return burcAd[((gs * 13) ~/ 27) % 12];
  }

  String yukselenB(int s, int d) => burcAd[((s * 2) + (d ~/ 30)) % 12];

  List<Map<String, String>> planetlerHesabla(int g, int a, int i) {
    int baza = (i - 2000) * 365 + (a - 1) * 30 + g;
    List<Map<String, String>> net = [];
    for (int k = 0; k < planetler.length; k++) {
      int idx = ((baza * (k + 1)) ~/ 30) % 12;
      net.add({'p': planetler[k], 'b': burcAd[idx], 'e': burcEmoji[idx]});
    }
    return net;
  }

  void hesabla() {
    if (ad.text.isEmpty || gun.text.isEmpty || ay.text.isEmpty || il.text.isEmpty) return;
    int g = int.parse(gun.text);
    int a = int.parse(ay.text);
    int i = int.parse(il.text);
    int s = int.tryParse(saat.text) ?? 12;
    int d = int.tryParse(deq.text) ?? 0;
    HapticFeedback.mediumImpact();
    setState(() {
      n = {'gb': gunesB(g, a), 'ab': ayB(g, a, i), 'yb': yukselenB(s, d), 'pl': planetlerHesabla(g, a, i)};
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
        title: const Text('BATI ASTROLOGIYASI', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 14)),
        iconTheme: const IconThemeData(color: qirmizi),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          f(ad, 'Ad ve Soyad'),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: f(gun, 'Gun')),
            const SizedBox(width: 6),
            Expanded(child: f(ay, 'Ay')),
            const SizedBox(width: 6),
            Expanded(child: f(il, 'Il')),
          ]),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: f(saat, 'Saat (0-23)')),
            const SizedBox(width: 8),
            Expanded(child: f(deq, 'Deqiqe')),
          ]),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: hesabla,
            icon: const Icon(Icons.auto_awesome),
            label: const Text('XERITE QUR', style: TextStyle(fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(backgroundColor: qirmizi, foregroundColor: ag, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(height: 20),
          if (n != null) ...[
            k('GUNES BURCU', n!['gb'] + '\nEsas xarakteriniz, kimliyiniz', Colors.orangeAccent),
            k('AY BURCU', n!['ab'] + '\nDuygulariniz, daxili dunyaniz', Colors.indigoAccent),
            k('YUKSELEN BURC', n!['yb'] + '\nXarici gorunusunuz', Colors.cyan),
            const Text('PLANET MOVQELERI', style: TextStyle(color: qizil, fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 10),
            ...(n!['pl'] as List).map<Widget>((p) => Container(
              margin: const EdgeInsets.only(bottom: 6),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(color: tundQara, borderRadius: BorderRadius.circular(10)),
              child: Row(children: [
                Expanded(child: Text(p['p']!, style: const TextStyle(color: ag, fontWeight: FontWeight.bold))),
                Text(p['b']!, style: const TextStyle(color: qizil)),
              ]),
            )),
          ],
        ]),
      ),
    );
  }
}
