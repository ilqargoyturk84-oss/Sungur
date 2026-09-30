import 'ai_destek.dart';
import 'ai_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SehifeReml extends StatefulWidget {
  const SehifeReml({super.key});
  @override
  State<SehifeReml> createState() => _SehifeRemlState();
}

class _SehifeRemlState extends State<SehifeReml> {
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;

  final ad = TextEditingController();
  final niyyet = TextEditingController();
  Map<String, dynamic>? n;

  static const List<Map<String, String>> fiqurlar = [
    {'ad': 'Via', 'en': 'Way', 'mena': 'Yol, seyahet', 'b': '0.00', 'n': '\u25CF\u25CF\u25CF\u25CF'},
    {'ad': 'Populus', 'en': 'People', 'mena': 'Kutle, xalq', 'b': '+0.15', 'n': '\u25CB\u25CB\u25CB\u25CB'},
    {'ad': 'Acquisitio', 'en': 'Gain', 'mena': 'Qazanc', 'b': '+0.22', 'n': '\u25CF\u25CF\u25CF\u25CB'},
    {'ad': 'Laetitia', 'en': 'Joy', 'mena': 'Sevinc', 'b': '+0.28', 'n': '\u25CF\u25CF\u25CB\u25CF'},
    {'ad': 'Fortuna Major', 'en': 'Greater Fortune', 'mena': 'Boyuk bext', 'b': '+0.30', 'n': '\u25CF\u25CB\u25CF\u25CF'},
    {'ad': 'Conjunctio', 'en': 'Conjunction', 'mena': 'Ittifaq', 'b': '+0.18', 'n': '\u25CB\u25CF\u25CF\u25CF'},
    {'ad': 'Rubeus', 'en': 'Red', 'mena': 'Qezeb', 'b': '-0.18', 'n': '\u25CB\u25CB\u25CF\u25CB'},
    {'ad': 'Amissio', 'en': 'Loss', 'mena': 'Itki', 'b': '-0.25', 'n': '\u25CB\u25CB\u25CB\u25CF'},
    {'ad': 'Tristitia', 'en': 'Sadness', 'mena': 'Keder', 'b': '-0.15', 'n': '\u25CF\u25CB\u25CB\u25CB'},
    {'ad': 'Carcer', 'en': 'Prison', 'mena': 'Mehdudiyyet', 'b': '-0.22', 'n': '\u25CB\u25CF\u25CB\u25CB'},
    {'ad': 'Fortuna Minor', 'en': 'Lesser Fortune', 'mena': 'Kicik bext', 'b': '+0.15', 'n': '\u25CF\u25CF\u25CB\u25CB'},
    {'ad': 'Puer', 'en': 'Boy', 'mena': 'Genc guc', 'b': '+0.20', 'n': '\u25CB\u25CB\u25CF\u25CF'},
    {'ad': 'Puella', 'en': 'Girl', 'mena': 'Harmoniya', 'b': '+0.12', 'n': '\u25CF\u25CB\u25CF\u25CB'},
    {'ad': 'Albus', 'en': 'White', 'mena': 'Safliq', 'b': '+0.10', 'n': '\u25CB\u25CF\u25CB\u25CF'},
    {'ad': 'Caput Draconis', 'en': "Dragon's Head", 'mena': 'Yeni furset', 'b': '+0.08', 'n': '\u25CF\u25CB\u25CB\u25CF'},
    {'ad': 'Cauda Draconis', 'en': "Dragon's Tail", 'mena': 'Baglanma', 'b': '-0.12', 'n': '\u25CB\u25CF\u25CF\u25CB'},
  ];

  int hash(String s) {
    int h = 0;
    for (int i = 0; i < s.length; i++) { h = (h * 31 + s.codeUnitAt(i)) % 100000; }
    return h;
  }

  void cek() {
    if (ad.text.isEmpty || niyyet.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ad ve niyyet doldurun!'), backgroundColor: Colors.red));
      return;
    }
    String seed = ad.text + niyyet.text;
    int idx = hash(seed) % 16;
    var f = fiqurlar[idx];
    HapticFeedback.mediumImpact();
    setState(() {
      n = {'ad': f['ad'], 'en': f['en'], 'mena': f['mena'], 'b': f['b'], 'nq': f['n']};
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
        title: const Text('REML', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 16)),
        iconTheme: const IconThemeData(color: qirmizi),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          f(ad, 'Adiniz'),
          const SizedBox(height: 12),
          f(niyyet, 'Niyyetiniz (sualiniz)'),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: cek,
            icon: const Icon(Icons.grid_on),
            label: const Text('FIQUR CEK', style: TextStyle(fontWeight: FontWeight.bold)),
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
              border: Border.all(color: qizil, width: 2),
            ),
            child: Column(children: [
              Text(n!['nq'], style: const TextStyle(fontSize: 50, color: qizil, letterSpacing: 8)),
              const SizedBox(height: 16),
              Text(n!['ad'], style: const TextStyle(color: qizil, fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              const SizedBox(height: 4),
              Text(n!['en'], style: const TextStyle(color: Colors.white70, fontSize: 13, fontStyle: FontStyle.italic)),
              const SizedBox(height: 16),
              Text(n!['mena'], style: const TextStyle(color: ag, fontSize: 16), textAlign: TextAlign.center),
              const SizedBox(height: 12),
              Text('Bonus: ' + n!['b'], style: const TextStyle(color: qizil, fontSize: 18, fontWeight: FontWeight.bold)),
            ]),
          ),
          AIButton(hazir: n != null, getMetn: () => AI.reml(n!['ad'], n!['mena'], niyyet.text)),
        ]),
      ),
    );
  }
}
