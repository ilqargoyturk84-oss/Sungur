import 'package:flutter/material.dart';

class GununAy extends StatelessWidget {
  const GununAy({super.key});

  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;

  static const List<String> aylar = [
    'Serateyn','Betn','Sureya','Debaran','Heqeh','Henneh','Zire','Nesre',
    'Terfe','Cebhe','Zubra','Serfe','Ava','Simak','Gafr','Zubana','Iklil','Qelb',
    'Sovle','Neayim','Belde','SedZabih','SedBula','SedSuud','SedAhbiye',
    'FergMukdim','FergMuaxir','Risa'
  ];

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    int idx = (now.day + now.month * 31 + now.year) % 28;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF1A0000), Color(0xFF0A0A0A)]),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.indigoAccent.withOpacity(0.5)),
      ),
      child: Row(children: [
        const Icon(Icons.nightlight_round, color: Colors.indigoAccent, size: 36),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('GUNUN AY MENZILI', style: TextStyle(color: Colors.indigoAccent, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1)),
          const SizedBox(height: 4),
          Text(aylar[idx], style: const TextStyle(color: ag, fontSize: 16, fontWeight: FontWeight.bold)),
          const Text('Ay enerjisi bugun sizinle', style: TextStyle(color: Colors.white70, fontSize: 12)),
        ])),
      ]),
    );
  }
}
