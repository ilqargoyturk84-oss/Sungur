import 'ai_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SehifePosition extends StatefulWidget {
  const SehifePosition({super.key});
  @override
  State<SehifePosition> createState() => _SehifePositionState();
}

class _SehifePositionState extends State<SehifePosition> {
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const yasil = Colors.greenAccent;
  static const ag = Colors.white;

  final ad = TextEditingController();
  final yer = TextEditingController();
  final sg = TextEditingController();
  bool hicri = false;
  Map<String, dynamic>? n;

  static final Map<String, int> eb = {
    'a': 1, 'e': 1, 'b': 2, 'p': 2, 'c': 3, 'g': 3, 'd': 4, 'h': 5,
    'v': 6, 'o': 6, 'u': 6, 'z': 7, 'i': 10, 'y': 10, 'k': 20, 'l': 30,
    'm': 40, 'n': 50, 's': 60, 'f': 80, 'q': 100, 'r': 200, 't': 400, 'x': 600,
    '\u0259': 1, '\u00e7': 3, '\u00f6': 6, '\u00fc': 6, '\u0131': 10, '\u015f': 300, '\u011f': 1000,
  };

  static const List<int> beka = [1,2,3,4,7,11,13,14,15,16,17,18,19,20,22,23,26,27,28];
  static const List<int> zeval = [5,6,8,9,10,12,21,24,25,29,30];

  int ebH(String s) {
    int c = 0; String k = s.toLowerCase();
    for (int i = 0; i < k.length; i++) { if (eb.containsKey(k[i])) c += eb[k[i]]!; }
    return c;
  }

  void hesabla() {
    if (ad.text.isEmpty || yer.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ad ve yer doldurun!'), backgroundColor: Colors.red));
      return;
    }
    int e = ebH(ad.text) + ebH(yer.text);
    int sgG = int.tryParse(sg.text) ?? 1;
    int k = (e + sgG + 20) % 30;
    if (k == 0) k = 30;
    bool b = beka.contains(k);
    HapticFeedback.mediumImpact();
    setState(() {
      n = {'k': k, 'beka': b};
    });
  }

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
        title: const Text('MOVQE / YER', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 16)),
        iconTheme: const IconThemeData(color: qirmizi),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          f(ad, 'Adiniz'),
          const SizedBox(height: 12),
          f(yer, 'Seher / Yer adi'),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: f(sg, 'Sual gunu (1-30)')),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(color: tundQara, borderRadius: BorderRadius.circular(10), border: Border.all(color: hicri ? yasil : qirmizi)),
              child: Row(children: [
                Text(hicri ? 'Hicri' : 'Miladi', style: const TextStyle(color: ag, fontSize: 12)),
                Switch(value: hicri, activeColor: yasil, onChanged: (v) => setState(() => hicri = v)),
              ]),
            ),
          ]),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: hesabla,
            icon: const Icon(Icons.place),
            label: const Text('HESABLA', style: TextStyle(fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: qirmizi, foregroundColor: ag,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const SizedBox(height: 24),
          if (n != null) Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: tundQara,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: n!['beka'] ? yasil : qirmizi, width: 2),
              boxShadow: [BoxShadow(color: (n!['beka'] ? yasil : qirmizi).withOpacity(0.3), blurRadius: 20)],
            ),
            child: Column(children: [
              Icon(n!['beka'] ? Icons.home : Icons.directions_walk, color: n!['beka'] ? yasil : qirmizi, size: 60),
              const SizedBox(height: 16),
              Text(n!['beka'] ? 'UZUN MUDDET QALACAQ' : 'TEZ GEDECEK', style: TextStyle(color: n!['beka'] ? yasil : qirmizi, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              const SizedBox(height: 8),
              Text(n!['beka'] ? '(Beka levhasi)' : '(Zeval levhasi)', style: const TextStyle(color: Colors.white70, fontSize: 12, fontStyle: FontStyle.italic)),
              const SizedBox(height: 12),
              Text(n!['beka'] ? 'Sexs teyin olundugu yerde uzun muddet qalacaq.' : 'Sexs teyin olundugu yerde cox qalmayacaq, tez gedecək.', style: const TextStyle(color: ag, fontSize: 14), textAlign: TextAlign.center),
              const SizedBox(height: 8),
              Text('Kenzul: ' + n!['k'].toString(), style: const TextStyle(color: qizil, fontSize: 12)),
            ]),
          ),
        ]),
      ),
    );
  }
}
