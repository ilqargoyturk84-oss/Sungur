import 'package:flutter/material.dart';

class Gizlilik extends StatelessWidget {
  const Gizlilik({super.key});
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: qara, appBar: AppBar(backgroundColor: tundQara, title: const Text('GIZLILIK SIYASETI', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 15)), iconTheme: const IconThemeData(color: qirmizi)),
      body: const SingleChildScrollView(padding: EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('GIZLILIK SIYASETI', style: TextStyle(color: qizil, fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text('Son yenilenme: 01.10.2026', style: TextStyle(color: Colors.grey, fontSize: 12)),
        SizedBox(height: 20),
        Text('1. UMUMI MELUMAT', style: TextStyle(color: qizil, fontWeight: FontWeight.bold, fontSize: 14)),
        SizedBox(height: 6),
        Text('Sungur Mistik tetbiqi istifadecinin sexsi melumatlarini toplamir, saxlamir ve ucuncu tereflere oturmur.', style: TextStyle(color: ag, fontSize: 14, height: 1.5)),
        SizedBox(height: 16),
        Text('2. ELAQE', style: TextStyle(color: qizil, fontWeight: FontWeight.bold, fontSize: 14)),
        SizedBox(height: 6),
        Text('ilqargoyturk84@gmail.com', style: TextStyle(color: ag, fontSize: 14)),
        SizedBox(height: 40),
      ])));
  }
}

class DisclaimerSehife extends StatelessWidget {
  const DisclaimerSehife({super.key});
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: qara, appBar: AppBar(backgroundColor: tundQara, title: const Text('XEBERDARLIQ', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 15)), iconTheme: const IconThemeData(color: qirmizi)),
      body: const SingleChildScrollView(padding: EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('YALNIZ EYLENCE MEQSEDI', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 15)),
        SizedBox(height: 10),
        Text('Bu tetbiqdeki butun hesablamalar YALNIZ EYLENCE meqsedi dasiyir. Elmi faktlar DEYIL.', style: TextStyle(color: ag, fontSize: 14, height: 1.6)),
        SizedBox(height: 16),
        Text('18+', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 15)),
        SizedBox(height: 10),
        Text('Bu tetbiq 18 yasdan yuxari istifadeciler ucundur.', style: TextStyle(color: ag, fontSize: 14, height: 1.6)),
        SizedBox(height: 40),
      ])));
  }
}

class Haqqinda extends StatelessWidget {
  const Haqqinda({super.key});
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: qara, appBar: AppBar(backgroundColor: tundQara, title: const Text('HAQQINDA', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 15)), iconTheme: const IconThemeData(color: qirmizi)),
      body: Center(child: Padding(padding: const EdgeInsets.all(24), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(width: 100, height: 100, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black, border: Border.all(color: qirmizi, width: 2)), child: Padding(padding: const EdgeInsets.all(15), child: Image.asset('assets/logo.png', fit: BoxFit.contain, errorBuilder: (_, __, ___) => const Icon(Icons.local_fire_department, color: qirmizi, size: 50)))),
        const SizedBox(height: 20),
        const Text('SUNGUR MISTIK', style: TextStyle(color: qirmizi, fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 2)),
        const SizedBox(height: 6),
        const Text('Version 1.0.0', style: TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 30),
        ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Gizlilik())), child: const Text('GIZLILIK SIYASETI')),
        const SizedBox(height: 10),
        ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DisclaimerSehife())), child: const Text('XEBERDARLIQ')),
        const SizedBox(height: 30),
        const Text('© 2026 ilqargoyturk84', style: TextStyle(color: Colors.grey, fontSize: 11)),
      ]))));
  }
}
