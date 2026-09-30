import 'ai_destek.dart';
import 'ai_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SehifeTarot extends StatefulWidget {
  const SehifeTarot({super.key});
  @override
  State<SehifeTarot> createState() => _SehifeTarotState();
}

class _SehifeTarotState extends State<SehifeTarot> {
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;

  final ad = TextEditingController();
  final niyyet = TextEditingController();
  Map<String, dynamic>? n;

  static const List<Map<String, String>> kartlar = [
    {'ad': 'Deli', 'en': 'The Fool', 'mena': 'Risk, yeni baslangic', 'b': '+0.20', 's': '\u{1F3AD}'},
    {'ad': 'Sehrbaz', 'en': 'The Magician', 'mena': 'Irade, bacariq', 'b': '+0.30', 's': '\u{1F52E}'},
    {'ad': 'Bas Kahine', 'en': 'The High Priestess', 'mena': 'Bilik, intuisiya', 'b': '+0.15', 's': '\u{1F319}'},
    {'ad': 'Imperatrica', 'en': 'The Empress', 'mena': 'Bolluq, yaradiciliq', 'b': '+0.25', 's': '\u{1F451}'},
    {'ad': 'Imperator', 'en': 'The Emperor', 'mena': 'Liderlik, nizam', 'b': '+0.35', 's': '\u{1F3DB}'},
    {'ad': 'Hierofant', 'en': 'The Hierophant', 'mena': 'Enene, telim', 'b': '+0.18', 's': '\u{1F4DC}'},
    {'ad': 'Asiqler', 'en': 'The Lovers', 'mena': 'Harmoniya, secim', 'b': '+0.22', 's': '\u{1F495}'},
    {'ad': 'Araba', 'en': 'The Chariot', 'mena': 'Qelebe, hereket', 'b': '+0.40', 's': '\u{1F3C7}'},
    {'ad': 'Guc', 'en': 'Strength', 'mena': 'Daxili guc, cesaret', 'b': '+0.45', 's': '\u{1F981}'},
    {'ad': 'Zahid', 'en': 'The Hermit', 'mena': 'Fokus, tefekkur', 'b': '+0.12', 's': '\u{1F9D8}'},
    {'ad': 'Bext Carxi', 'en': 'Wheel of Fortune', 'mena': 'Sans, donus', 'b': '+0.35', 's': '\u{1F3A1}'},
    {'ad': 'Edalet', 'en': 'Justice', 'mena': 'Balans, edalet', 'b': '+0.15', 's': '\u2696'},
    {'ad': 'Asilmis', 'en': 'The Hanged Man', 'mena': 'Fedakarlig, gozleme', 'b': '-0.10', 's': '\u{1F643}'},
    {'ad': 'Deyisim', 'en': 'Death', 'mena': 'Transformasiya', 'b': '+0.05', 's': '\u{1F480}'},
    {'ad': 'Muvazinet', 'en': 'Temperance', 'mena': 'Sebir, balans', 'b': '+0.18', 's': '\u{1F30A}'},
    {'ad': 'Seytan', 'en': 'The Devil', 'mena': 'Vesvese, asliliq', 'b': '-0.20', 's': '\u{1F608}'},
    {'ad': 'Qulle', 'en': 'The Tower', 'mena': 'Dagilma, sarsinti', 'b': '-0.30', 's': '\u{1F5FC}'},
    {'ad': 'Ulduz', 'en': 'The Star', 'mena': 'Umid, ilham', 'b': '+0.28', 's': '\u2B50'},
    {'ad': 'Ay', 'en': 'The Moon', 'mena': 'Illuziya, qorxu', 'b': '-0.15', 's': '\u{1F315}'},
    {'ad': 'Gunes', 'en': 'The Sun', 'mena': 'Ugur, sevinc', 'b': '+0.50', 's': '\u2600'},
    {'ad': 'Mehkeme', 'en': 'Judgement', 'mena': 'Oyanis, hesab', 'b': '+0.22', 's': '\u{1F4EF}'},
    {'ad': 'Dunya', 'en': 'The World', 'mena': 'Tamamlanma, nailiyyet', 'b': '+0.45', 's': '\u{1F30D}'},
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
    int h = hash(seed);
    int idx = h % 22;
    bool ters = (h ~/ 22) % 5 == 0;
    var k = kartlar[idx];
    HapticFeedback.mediumImpact();
    setState(() {
      n = {
        'ad': k['ad'], 'en': k['en'], 'mena': k['mena'], 'b': k['b'], 's': k['s'],
        'ters': ters,
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
        title: const Text('TAROT', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 16)),
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
            icon: const Icon(Icons.style),
            label: const Text('KART CEK', style: TextStyle(fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: qirmizi, foregroundColor: ag,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const SizedBox(height: 24),
          if (n != null) ...[
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: tundQara,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: n!['ters'] ? qirmizi : qizil, width: 2),
                boxShadow: [BoxShadow(color: (n!['ters'] ? qirmizi : qizil).withOpacity(0.3), blurRadius: 20)],
              ),
              child: Column(children: [
                Text(n!['s'], style: const TextStyle(fontSize: 70)),
                const SizedBox(height: 12),
                Text(n!['ad'], style: TextStyle(color: n!['ters'] ? qirmizi : qizil, fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(n!['en'], style: const TextStyle(color: Colors.white70, fontSize: 13, fontStyle: FontStyle.italic)),
                const SizedBox(height: 16),
                if (n!['ters']) Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: qirmizi.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
                  child: const Text('TERS KART', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 12)),
                ),
                const SizedBox(height: 16),
                Text(n!['mena'], style: const TextStyle(color: ag, fontSize: 16), textAlign: TextAlign.center),
                const SizedBox(height: 12),
                Text('Bonus: ' + n!['b'], style: TextStyle(color: n!['ters'] ? qirmizi : qizil, fontSize: 18, fontWeight: FontWeight.bold)),
              ]),
            ),
          AIButton(hazir: n != null, getMetn: () => AI.tarot(n!['ad'], n!['mena'], niyyet.text)),
          ],
        ]),
      ),
    );
  }
}
