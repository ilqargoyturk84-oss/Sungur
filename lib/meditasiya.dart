import 'package:flutter/material.dart';
import 'dart:async';

class Meditasiya extends StatefulWidget {
  const Meditasiya({super.key});
  @override
  State<Meditasiya> createState() => _MeditasiyaState();
}
class _MeditasiyaState extends State<Meditasiya> {
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;
  int saniye = 0;
  bool isleyir = false;
  Timer? _t;
  int secilenDəqiqə = 5;

  void basla() {
    setState(() { isleyir = true; saniye = secilenDəqiqə * 60; });
    _t = Timer.periodic(const Duration(seconds: 1), (t) {
      if (saniye <= 1) { t.cancel(); setState(() { isleyir = false; saniye = 0; }); }
      else { setState(() { saniye--; }); }
    });
  }
  void dayandir() { _t?.cancel(); setState(() { isleyir = false; }); }
  void sifirla() { _t?.cancel(); setState(() { isleyir = false; saniye = 0; }); }

  String format(int s) {
    int d = s ~/ 60; int sn = s % 60;
    return (d < 10 ? '0' : '') + d.toString() + ':' + (sn < 10 ? '0' : '') + sn.toString();
  }

  @override
  void dispose() { _t?.cancel(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: qara, appBar: AppBar(backgroundColor: tundQara, title: const Text('MEDITASIYA', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 15)), iconTheme: const IconThemeData(color: qirmizi)),
      body: Center(child: Padding(padding: const EdgeInsets.all(24), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(width: 220, height: 220, decoration: BoxDecoration(shape: BoxShape.circle, color: tundQara, border: Border.all(color: qizil, width: 3)), child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.self_improvement, color: qizil, size: 40),
          const SizedBox(height: 10),
          Text(saniye == 0 ? format(secilenDəqiqə * 60) : format(saniye), style: const TextStyle(color: ag, fontSize: 40, fontWeight: FontWeight.bold)),
        ]))),
        const SizedBox(height: 30),
        if (!isleyir && saniye == 0) Row(mainAxisAlignment: MainAxisAlignment.center, children: [3,5,10,15].map((d) => Padding(padding: const EdgeInsets.all(4), child: ChoiceChip(label: Text(d.toString() + ' deq', style: TextStyle(color: secilenDəqiqə == d ? qara : ag)), selected: secilenDəqiqə == d, onSelected: (_) => setState(() => secilenDəqiqə = d), selectedColor: qizil))).toList()),
        const SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (!isleyir) ElevatedButton.icon(onPressed: basla, icon: const Icon(Icons.play_arrow), label: const Text('BASLA'), style: ElevatedButton.styleFrom(backgroundColor: qizil, foregroundColor: qara, padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14))),
          if (isleyir) ElevatedButton.icon(onPressed: dayandir, icon: const Icon(Icons.pause), label: const Text('DAYANDIR'), style: ElevatedButton.styleFrom(backgroundColor: qirmizi, foregroundColor: ag, padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14))),
          if (saniye > 0 && !isleyir) const SizedBox(width: 10),
          if (saniye > 0 && !isleyir) ElevatedButton.icon(onPressed: sifirla, icon: const Icon(Icons.refresh), label: const Text('SIFIRLA'), style: ElevatedButton.styleFrom(backgroundColor: tundQara, foregroundColor: ag, padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14))),
        ]),
        const SizedBox(height: 30),
        const Text('Derin nefes alin, gozlerinizi yumun', style: TextStyle(color: Colors.grey, fontSize: 13), textAlign: TextAlign.center),
      ]))));
  }
}
