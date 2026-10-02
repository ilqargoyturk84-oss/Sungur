import 'package:flutter/material.dart';
import 'main.dart';

class GununKarti extends StatelessWidget {
  const GununKarti({super.key});

  @override
  Widget build(BuildContext context) {
    int gun = DateTime.now().day + DateTime.now().month * 31;
    final kartlar = [
      ['Gunes', 'Ugur ve sevinc', 'Güneş', 'Başarı ve sevinç', 'The Sun', 'Success and joy', '☀'],
      ['Araba', 'Qelebe ve hereket', 'Araba', 'Zafer ve hareket', 'The Chariot', 'Victory', '🏇'],
      ['Guc', 'Daxili guc', 'Güç', 'İçsel güç', 'Strength', 'Inner power', '🦁'],
      ['Ulduz', 'Umid ve ilham', 'Yıldız', 'Umut ve ilham', 'The Star', 'Hope', '⭐'],
      ['Dunya', 'Tamamlanma', 'Dünya', 'Tamamlanma', 'The World', 'Completion', '🌍'],
      ['Bext Carxi', 'Sans ve donus', 'Kader Çarkı', 'Şans ve dönüş', 'Wheel of Fortune', 'Luck', '🎡'],
      ['Imperator', 'Liderlik', 'İmparator', 'Liderlik', 'The Emperor', 'Leadership', '🏛'],
    ];
    var k = kartlar[gun % kartlar.length];
    String b = L.kod == 'az' ? 'GUNUN KARTI' : (L.kod == 'tr' ? 'GÜNÜN KARTI' : 'CARD OF THE DAY');
    String ad = L.kod == 'az' ? k[0] : (L.kod == 'tr' ? k[2] : k[4]);
    String mena = L.kod == 'az' ? k[1] : (L.kod == 'tr' ? k[3] : k[5]);
    return Container(
      margin: const EdgeInsets.all(14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF1A0000), Color(0xFF0A0A0A)]),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFFFFD700).withOpacity(0.5)),
      ),
      child: Row(children: [
        Text(k[6], style: const TextStyle(fontSize: 40)),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(b, style: const TextStyle(color: Color(0xFFFFD700), fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1)),
          const SizedBox(height: 4),
          Text(ad, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          Text(mena, style: const TextStyle(color: Colors.white70, fontSize: 13)),
        ])),
      ]),
    );
  }
}
