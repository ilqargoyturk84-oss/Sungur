import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ========== 1. GUNLUK JURNAL ==========
class Jurnal extends StatefulWidget {
  const Jurnal({super.key});
  @override
  State<Jurnal> createState() => _JurnalState();
}
class _JurnalState extends State<Jurnal> {
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;
  final q = TextEditingController();
  List<Map<String, String>> qeydler = [];
  @override
  void initState() { super.initState(); _yukle(); }
  Future<void> _yukle() async {
    final p = await SharedPreferences.getInstance();
    List<String>? l = p.getStringList('jurnal');
    if (l != null) {
      setState(() { qeydler = l.map((e) { var s = e.split('|||'); return {'t': s[0], 'm': s[1]}; }).toList(); });
    }
  }
  Future<void> _yaz() async {
    if (q.text.isEmpty) return;
    final p = await SharedPreferences.getInstance();
    String tarix = DateTime.now().toString().substring(0, 16);
    qeydler.insert(0, {'t': tarix, 'm': q.text});
    await p.setStringList('jurnal', qeydler.map((e) => e['t']! + '|||' + e['m']!).toList());
    q.clear();
    HapticFeedback.mediumImpact();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: qara, appBar: AppBar(backgroundColor: tundQara, title: const Text('GUNLUK JURNAL', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 15)), iconTheme: const IconThemeData(color: qirmizi)),
      body: Column(children: [
        Padding(padding: const EdgeInsets.all(12), child: TextField(controller: q, maxLines: 3, style: const TextStyle(color: ag), decoration: InputDecoration(hintText: 'Bugun ne bas verdi?', hintStyle: const TextStyle(color: Colors.grey), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: qirmizi))))),
        ElevatedButton.icon(onPressed: _yaz, icon: const Icon(Icons.save), label: const Text('YADDA SAXLA'), style: ElevatedButton.styleFrom(backgroundColor: qirmizi, foregroundColor: ag)),
        const SizedBox(height: 10),
        Expanded(child: ListView.builder(padding: const EdgeInsets.all(12), itemCount: qeydler.length, itemBuilder: (_, i) => Container(margin: const EdgeInsets.only(bottom: 8), padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: tundQara, borderRadius: BorderRadius.circular(10), border: Border.all(color: qizil.withOpacity(0.3))), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(qeydler[i]['t']!, style: const TextStyle(color: qizil, fontSize: 11)), const SizedBox(height: 6), Text(qeydler[i]['m']!, style: const TextStyle(color: ag, fontSize: 14, height: 1.4))])))),
      ]));
  }
}

// ========== 2. YUXU GUNDELIYI ==========
class Yuxu extends StatefulWidget {
  const Yuxu({super.key});
  @override
  State<Yuxu> createState() => _YuxuState();
}
class _YuxuState extends State<Yuxu> {
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;
  final y = TextEditingController();
  List<Map<String, String>> yuxular = [];
  @override
  void initState() { super.initState(); _yukle(); }
  Future<void> _yukle() async {
    final p = await SharedPreferences.getInstance();
    List<String>? l = p.getStringList('yuxu');
    if (l != null) {
      setState(() { yuxular = l.map((e) { var s = e.split('|||'); return {'t': s[0], 'm': s[1]}; }).toList(); });
    }
  }
  Future<void> _yaz() async {
    if (y.text.isEmpty) return;
    final p = await SharedPreferences.getInstance();
    String tarix = DateTime.now().toString().substring(0, 10);
    yuxular.insert(0, {'t': tarix, 'm': y.text});
    await p.setStringList('yuxu', yuxular.map((e) => e['t']! + '|||' + e['m']!).toList());
    y.clear();
    HapticFeedback.mediumImpact();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: qara, appBar: AppBar(backgroundColor: tundQara, title: const Text('YUXU GUNDELIYI', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 15)), iconTheme: const IconThemeData(color: qirmizi)),
      body: Column(children: [
        Padding(padding: const EdgeInsets.all(12), child: TextField(controller: y, maxLines: 3, style: const TextStyle(color: ag), decoration: InputDecoration(hintText: 'Yuxunuzu yazin...', hintStyle: const TextStyle(color: Colors.grey), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: qirmizi))))),
        ElevatedButton.icon(onPressed: _yaz, icon: const Icon(Icons.nightlight), label: const Text('YADDA SAXLA'), style: ElevatedButton.styleFrom(backgroundColor: qirmizi, foregroundColor: ag)),
        const SizedBox(height: 10),
        Expanded(child: ListView.builder(padding: const EdgeInsets.all(12), itemCount: yuxular.length, itemBuilder: (_, i) => Container(margin: const EdgeInsets.only(bottom: 8), padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: tundQara, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.indigoAccent.withOpacity(0.3))), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(yuxular[i]['t']!, style: const TextStyle(color: Colors.indigoAccent, fontSize: 11)), const SizedBox(height: 6), Text(yuxular[i]['m']!, style: const TextStyle(color: ag, fontSize: 14, height: 1.4))])))),
      ]));
  }
}

// ========== 3. AFFIRMASIYALAR ==========
class Affirmasiyalar extends StatelessWidget {
  const Affirmasiyalar({super.key});
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;
  static const List<String> aff = [
    'Men gucluyem ve her cetinliyi doyuse bilerem.',
    'Men oz deyerimi bilirem ve ozume hormet edirem.',
    'Bu gun menim ucun yeni imkanlar acilir.',
    'Men sevgiye ve hormete layiqem.',
    'Her nefes meni daha guclu edir.',
    'Men oz heyatimin sahibiyem.',
    'Bugun men minnetdarliq hissi ile oyanıram.',
    'Men saglamliq ve bolluq enerjisi yayiram.',
    'Her addim meni meqsedime yaxinlasdirir.',
    'Men oz fikirlerimi idare ede bilirem.',
    'Kainat menim terefimdedir.',
    'Men guzest ve sevgi ile dolu bir insanam.',
    'Bu gun men yalniz pozitiv enerji qebul edirem.',
    'Men ozumun en yaxsi versiyasini yaradiram.',
    'Her sey menim xeyrime hell olur.',
  ];
  @override
  Widget build(BuildContext context) {
    int idx = DateTime.now().day % aff.length;
    return Scaffold(backgroundColor: qara, appBar: AppBar(backgroundColor: tundQara, title: const Text('AFFIRMASIYALAR', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 15)), iconTheme: const IconThemeData(color: qirmizi)),
      body: Center(child: Padding(padding: const EdgeInsets.all(24), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(padding: const EdgeInsets.all(30), decoration: BoxDecoration(color: tundQara, borderRadius: BorderRadius.circular(20), border: Border.all(color: qizil, width: 2)), child: Column(children: [
          const Icon(Icons.self_improvement, color: qizil, size: 60),
          const SizedBox(height: 20),
          const Text('GUNUN AFFIRMASIYASI', style: TextStyle(color: qizil, fontSize: 11, letterSpacing: 2, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Text(aff[idx], style: const TextStyle(color: ag, fontSize: 18, height: 1.6, fontStyle: FontStyle.italic), textAlign: TextAlign.center),
        ])),
        const SizedBox(height: 20),
        const Text('Her gun yeni affirmasiya', style: TextStyle(color: Colors.grey, fontSize: 12)),
      ]))));
  }
}
