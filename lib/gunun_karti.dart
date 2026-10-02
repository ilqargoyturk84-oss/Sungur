import 'content.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class GununKarti extends StatelessWidget {
  const GununKarti({super.key});

  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qizil = Color(0xFFFFD700);
  static const qirmizi = Color(0xFFC62828);
  static const ag = Colors.white;

  static const List<Map<String, String>> k = [
    {'ad': 'Gunes', 'm': 'Ugur ve sevinc', 's': '\u2600'},
    {'ad': 'Araba', 'm': 'Qelebe ve hereket', 's': '\u{1F3C7}'},
    {'ad': 'Guc', 'm': 'Daxili guc', 's': '\u{1F981}'},
    {'ad': 'Ulduz', 'm': 'Umid ve ilham', 's': '\u2B50'},
    {'ad': 'Dunya', 'm': 'Tamamlanma', 's': '\u{1F30D}'},
    {'ad': 'Bext Carxi', 'm': 'Sans ve donus', 's': '\u{1F3A1}'},
    {'ad': 'Imperator', 'm': 'Liderlik', 's': '\u{1F3DB}'},
  ];

  @override
  Widget build(BuildContext context) {
    int gun = DateTime.now().day + DateTime.now().month * 31;
    var kart = k[gun % k.length];
    return Container(
      margin: const EdgeInsets.all(14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF1A0000), Color(0xFF0A0A0A)]),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: qizil.withOpacity(0.5)),
      ),
      child: Row(children: [
        Text(kart['s']!, style: const TextStyle(fontSize: 40)),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('GUNUN KARTI', style: TextStyle(color: qizil, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1)),
          const SizedBox(height: 4),
          Text(kart['ad']!, style: const TextStyle(color: ag, fontSize: 18, fontWeight: FontWeight.bold)),
          Text(kart['m']!, style: const TextStyle(color: Colors.white70, fontSize: 13)),
        ])),
      ]),
    );
  }
}
