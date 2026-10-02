import 'content.dart';
import 'package:flutter/material.dart';

class SehifeReference extends StatefulWidget {
  const SehifeReference({super.key});
  @override
  State<SehifeReference> createState() => _SehifeReferenceState();
}

class _SehifeReferenceState extends State<SehifeReference> {
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;

  static const List<List<String>> burcler = [
    ['Qoc', 'Mars', 'Od', '1.8', 'Cesur'],
    ['Buga', 'Venera', 'Torpaq', '1.2', 'Sebirli'],
    ['Ekizler', 'Merkuri', 'Hava', '1.5', 'Cevik'],
    ['Xerceng', 'Ay', 'Su', '1.0', 'Duygusal'],
    ['Sir', 'Gunes', 'Od', '2.0', 'Lider'],
    ['Qiz', 'Merkuri', 'Torpaq', '1.3', 'Analitik'],
    ['Terezi', 'Venera', 'Hava', '1.1', 'Balansli'],
    ['Eqreb', 'Pluton', 'Su', '1.7', 'Guclu'],
    ['Oxatan', 'Yupiter', 'Od', '1.6', 'Optimist'],
    ['Oglaq', 'Zuhal', 'Torpaq', '0.8', 'Meqsedli'],
    ['Dolca', 'Uran', 'Hava', '1.1', 'Yenilikci'],
    ['Baliq', 'Neptun', 'Su', '1.4', 'Xeyalperest'],
  ];

  static const List<List<String>> cifr = [
    ['1', 'Vahid, Baslangic', 'Liderlik'],
    ['2', 'Cutluk, Tarazliq', 'Harmoniya'],
    ['3', 'Ucluk, Yaradiciliq', 'Optimizm'],
    ['4', 'Dordluk, Sabitlik', 'Sebir'],
    ['5', 'Beslik, Deyisim', 'Azadliq'],
    ['6', 'Altiliq, Mesuliyyet', 'Qaygi'],
    ['7', 'Yeddilik, Meneviyyat', 'Mudriklik'],
    ['8', 'Sekkizlik, Bolluq', 'Ugur'],
    ['9', 'Doqquzluq, Tamamlanma', 'Kamillik'],
  ];

  static const List<List<String>> tarot = [
    ['Deli', 'Risk, baslangic', '+0.20'],
    ['Sehrbaz', 'Irade, bacariq', '+0.30'],
    ['Bas Kahine', 'Bilik, intuisiya', '+0.15'],
    ['Imperatrica', 'Bolluq', '+0.25'],
    ['Imperator', 'Liderlik', '+0.35'],
    ['Hierofant', 'Enene', '+0.18'],
    ['Asiqler', 'Harmoniya', '+0.22'],
    ['Araba', 'Qelebe', '+0.40'],
    ['Guc', 'Cesaret', '+0.45'],
    ['Zahid', 'Fokus', '+0.12'],
    ['Bext Carxi', 'Sans', '+0.35'],
    ['Edalet', 'Balans', '+0.15'],
    ['Asilmis', 'Gozleme', '-0.10'],
    ['Deyisim', 'Transformasiya', '+0.05'],
    ['Muvazinet', 'Sebir', '+0.18'],
    ['Seytan', 'Asliliq', '-0.20'],
    ['Qulle', 'Dagilma', '-0.30'],
    ['Ulduz', 'Umid', '+0.28'],
    ['Ay', 'Illuziya', '-0.15'],
    ['Gunes', 'Ugur', '+0.50'],
    ['Mehkeme', 'Oyanis', '+0.22'],
    ['Dunya', 'Tamamlanma', '+0.45'],
  ];

  static const List<List<String>> reml = [
    ['Via', 'Yol, seyahet', '0.00'],
    ['Populus', 'Kutle, xalq', '+0.15'],
    ['Acquisitio', 'Qazanc', '+0.22'],
    ['Laetitia', 'Sevinc', '+0.28'],
    ['Fortuna Major', 'Boyuk bext', '+0.30'],
    ['Conjunctio', 'Ittifaq', '+0.18'],
    ['Rubeus', 'Qezeb', '-0.18'],
    ['Amissio', 'Itki', '-0.25'],
    ['Tristitia', 'Keder', '-0.15'],
    ['Carcer', 'Mehdudiyyet', '-0.22'],
    ['Fortuna Minor', 'Kicik bext', '+0.15'],
    ['Puer', 'Genc guc', '+0.20'],
    ['Puella', 'Harmoniya', '+0.12'],
    ['Albus', 'Safliq', '+0.10'],
    ['Caput Draconis', 'Yeni furset', '+0.08'],
    ['Cauda Draconis', 'Baglanma', '-0.12'],
  ];

  static const List<List<String>> planet = [
    ['Bazar', 'Gunes', 'Liderlik', '+0.18'],
    ['B.e.', 'Ay', 'Duygu', '+0.10'],
    ['C.a.', 'Mars', 'Aqressiya', '+0.15'],
    ['Cersenbe', 'Merkuri', 'Zeka', '+0.05'],
    ['C.a.', 'Yupiter', 'Ugur', '+0.20'],
    ['Cume', 'Venera', 'Harmoniya', '+0.12'],
    ['Senbe', 'Zuhal', 'Mehdudiyyet', '-0.10'],
  ];

  void _ac(String basliq, List<List<String>> data, List<String> keys) {
    showModalBottomSheet(
      context: context,
      backgroundColor: qara,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.85,
        builder: (_, scroll) => Column(children: [
          Container(margin: const EdgeInsets.all(12), width: 40, height: 4, decoration: BoxDecoration(color: qizil, borderRadius: BorderRadius.circular(2))),
          Padding(padding: const EdgeInsets.all(12), child: Text(basliq, style: const TextStyle(color: qizil, fontSize: 18, fontWeight: FontWeight.bold))),
          Expanded(child: ListView.builder(
            controller: scroll,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: data.length,
            itemBuilder: (_, i) {
              var d = data[i];
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: tundQara, borderRadius: BorderRadius.circular(10), border: Border.all(color: qizil.withOpacity(0.3))),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(d[0], style: const TextStyle(color: qizil, fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 4),
                  for (int j = 1; j < d.length; j++)
                    Text(keys[j] + ': ' + d[j], style: const TextStyle(color: ag, fontSize: 13, height: 1.4)),
                ]),
              );
            },
          )),
        ]),
      ),
    );
  }

  Widget _card(String ad, IconData ikon, Color r, VoidCallback onTap) => InkWell(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: tundQara, borderRadius: BorderRadius.circular(12), border: Border.all(color: r.withOpacity(0.5))),
      child: Row(children: [
        Icon(ikon, color: r, size: 28),
        const SizedBox(width: 14),
        Expanded(child: Text(ad, style: const TextStyle(color: ag, fontSize: 16, fontWeight: FontWeight.bold))),
        Icon(Icons.arrow_forward_ios, color: r, size: 16),
      ]),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: qara,
      appBar: AppBar(
        backgroundColor: tundQara,
        title: const Text('BILIKLER', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 16)),
        iconTheme: const IconThemeData(color: qirmizi),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          _card('12 Burc Cedveli', Icons.star, qizil, () => _ac('12 BURC', burcler, ['', 'Planet', 'Element', 'Guc', 'Xasiyyet'])),
          _card('Cifr Menalari', Icons.numbers, Colors.cyan, () => _ac('CIFR MENALARI', cifr, ['', 'Mena', 'Enerji'])),
          _card('22 Tarot Kartlari', Icons.style, Colors.purpleAccent, () => _ac('22 TAROT', tarot, ['', 'Mena', 'Bonus'])),
          _card('16 Reml Fiquru', Icons.grid_on, qirmizi, () => _ac('16 REML', reml, ['', 'Mena', 'Bonus'])),
          _card('Planet Gunleri', Icons.calendar_today, Colors.blueAccent, () => _ac('PLANET GUNLERI', planet, ['', 'Planet', 'Enerji', 'Bonus'])),
        ]),
      ),
    );
  }
}
