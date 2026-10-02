import 'content.dart';
import 'package:flutter/material.dart';

class Ensiklopediya extends StatefulWidget {
  const Ensiklopediya({super.key});
  @override
  State<Ensiklopediya> createState() => _EnsiklopediyaState();
}
class _EnsiklopediyaState extends State<Ensiklopediya> {
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;
  final axtar = TextEditingController();

  List<Map<String, String>> get data => Content.ensiklopediya();
  String? seciliKateqoriya;

  

  List<Map<String, dynamic>> get gosterilen {
    String a = axtar.text.toLowerCase();
    return data.where((d) {
      if (seciliKateqoriya != null && d['k'] != seciliKateqoriya) return false;
      if (a.isEmpty) return true;
      return (d['b'] as String).toLowerCase().contains(a) || (d['m'] as String).toLowerCase().contains(a);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: qara, appBar: AppBar(backgroundColor: tundQara, title: const Text('MISTIK ENSIKLOPEDIYA', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 14)), iconTheme: const IconThemeData(color: qirmizi)),
      body: Column(children: [
        Padding(padding: const EdgeInsets.all(12), child: TextField(controller: axtar, onChanged: (_) => setState(() {}), style: const TextStyle(color: ag), decoration: InputDecoration(hintText: 'Axtar...', hintStyle: const TextStyle(color: Colors.grey), prefixIcon: const Icon(Icons.search, color: qizil), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: qirmizi))))),
        Expanded(child: ListView.builder(padding: const EdgeInsets.all(12), itemCount: gosterilen.length, itemBuilder: (_, i) {
          var d = gosterilen[i];
          return Container(margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: tundQara, borderRadius: BorderRadius.circular(12), border: Border.all(color: qizil.withOpacity(0.3))), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(d['b'], style: const TextStyle(color: qizil, fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 6),
            Text(d['m'], style: const TextStyle(color: ag, fontSize: 13, height: 1.5)),
          ]));
        })),
      ]));
  }
}
