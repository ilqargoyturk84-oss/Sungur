import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SehifePersonal extends StatefulWidget {
  const SehifePersonal({super.key});
  @override
  State<SehifePersonal> createState() => _SehifePersonalState();
}

class _SehifePersonalState extends State<SehifePersonal> {
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const boz = Color(0xFF888888);
  static const ag = Colors.white;

  final ad = TextEditingController();
  final gun = TextEditingController();
  final ay = TextEditingController();
  final il = TextEditingController();
  Map<String, dynamic>? n;

  static final Map<String, int> ebced = {
    'a': 1, 'e': 1, 'b': 2, 'p': 2, 'c': 3, 'g': 3, 'd': 4,
    'h': 5, 'v': 6, 'o': 6, 'u': 6, 'z': 7, 'i': 10, 'y': 10,
    'k': 20, 'l': 30, 'm': 40, 'n': 50, 's': 60, 'f': 80,
    'q': 100, 'r': 200, 't': 400, 'x': 600,
    '\u0259': 1, '\u00e7': 3, '\u00f6': 6, '\u00fc': 6,
    '\u0131': 10, '\u015f': 300, '\u011f': 1000,
  };

  static final Map<String, int> pifaqor = {
    'a': 1, 'b': 2, 'c': 3, 'd': 4, 'e': 5, 'f': 6, 'g': 7, 'h': 8,
    'i': 9, 'j': 1, 'k': 2, 'l': 3, 'm': 4, 'n': 5, 'o': 6, 'p': 7,
    'q': 8, 'r': 9, 's': 1, 't': 2, 'u': 3, 'v': 4, 'w': 5, 'x': 6,
    'y': 7, 'z': 8, '\u0259': 5, '\u00e7': 3, '\u00f6': 6,
    '\u00fc': 3, '\u0131': 9, '\u015f': 1, '\u011f': 7,
  };

  static final Map<int, String> cifrMena = {
    1: 'Vahid, Liderlik',
    2: 'Cutluk, Harmoniya',
    3: 'Ucluk, Yaradiciliq',
    4: 'Dordluk, Sabitlik',
    5: 'Beslik, Deyisim',
    6: 'Altiliq, Mesuliyyet',
    7: 'Yeddilik, Mudriklik',
    8: 'Sekkizlik, Bolluq',
    9: 'Doqquzluq, Kamillik',
  };

  int ebcH(String s) {
    int c = 0; String k = s.toLowerCase();
    for (int i = 0; i < k.length; i++) {
      if (ebced.containsKey(k[i])) c += ebced[k[i]]!;
    }
    return c;
  }

  int pifH(String s) {
    int c = 0; String k = s.toLowerCase();
    for (int i = 0; i < k.length; i++) {
      if (pifaqor.containsKey(k[i])) c += pifaqor[k[i]]!;
    }
    while (c > 9 && c != 11 && c != 22 && c != 33) {
      int y = 0; while (c > 0) { y += c % 10; c ~/= 10; } c = y;
    }
    return c;
  }

  int cifH(int e) {
    if (e == 0) return 0;
    int c = e % 9; return c == 0 ? 9 : c;
  }

  Map<String, String> burcT(int g, int a) {
    if ((a == 3 && g >= 21) || (a == 4 && g <= 19)) return {'ad': 'Qoc', 'p': 'Mars', 'e': 'Od', 's': '\u2648'};
    if ((a == 4 && g >= 20) || (a == 5 && g <= 20)) return {'ad': 'Buga', 'p': 'Venera', 'e': 'Torpaq', 's': '\u2649'};
    if ((a == 5 && g >= 21) || (a == 6 && g <= 20)) return {'ad': 'Ekizler', 'p': 'Merkuri', 'e': 'Hava', 's': '\u264A'};
    if ((a == 6 && g >= 21) || (a == 7 && g <= 22)) return {'ad': 'Xerceng', 'p': 'Ay', 'e': 'Su', 's': '\u264B'};
    if ((a == 7 && g >= 23) || (a == 8 && g <= 22)) return {'ad': 'Sir', 'p': 'Gunes', 'e': 'Od', 's': '\u264C'};
    if ((a == 8 && g >= 23) || (a == 9 && g <= 22)) return {'ad': 'Qiz', 'p': 'Merkuri', 'e': 'Torpaq', 's': '\u264D'};
    if ((a == 9 && g >= 23) || (a == 10 && g <= 22)) return {'ad': 'Terezi', 'p': 'Venera', 'e': 'Hava', 's': '\u264E'};
    if ((a == 10 && g >= 23) || (a == 11 && g <= 21)) return {'ad': 'Eqreb', 'p': 'Pluton', 'e': 'Su', 's': '\u264F'};
    if ((a == 11 && g >= 22) || (a == 12 && g <= 21)) return {'ad': 'Oxatan', 'p': 'Yupiter', 'e': 'Od', 's': '\u2650'};
    if ((a == 12 && g >= 22) || (a == 1 && g <= 19)) return {'ad': 'Oglaq', 'p': 'Zuhal', 'e': 'Torpaq', 's': '\u2651'};
    if ((a == 1 && g >= 20) || (a == 2 && g <= 18)) return {'ad': 'Dolca', 'p': 'Uran', 'e': 'Hava', 's': '\u2652'};
    return {'ad': 'Baliq', 'p': 'Neptun', 'e': 'Su', 's': '\u2653'};
  }

  String planetG(DateTime t) {
    final c = {7: 'Gunes', 1: 'Ay', 2: 'Mars', 3: 'Merkuri', 4: 'Yupiter', 5: 'Venera', 6: 'Zuhal'};
    return c[t.weekday] ?? 'Gunes';
  }

  String cinB(int i) {
    final h = ['Meymun','Xoruz','It','Donuz','Sicovul','Okuz','Peleng','Dovsan','Ejdaha','Ilan','At','Qoyun'];
    return h[i % 12];
  }

  void hesabla() {
    if (ad.text.isEmpty || gun.text.isEmpty || ay.text.isEmpty || il.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Butun xanalari doldurun!'), backgroundColor: Colors.red));
      return;
    }
    int g = int.parse(gun.text);
    int a = int.parse(ay.text);
    int i = int.parse(il.text);

    int e = ebcH(ad.text);
    int c = cifH(e);
    int p = pifH(ad.text);
    int r = e % 9; if (r == 0) r = 9;
    var b = burcT(g, a);
    String pg = planetG(DateTime(i, a, g));
    String cb = cinB(i);

    HapticFeedback.mediumImpact();
    setState(() {
      n = {'ad': ad.text, 'e': e, 'c': c, 'p': p, 'r': r, 'b': b, 'pg': pg, 'cb': cb};
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
        title: const Text('SEXSI ANALIZ', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 16)),
        iconTheme: const IconThemeData(color: qirmizi),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          f(ad, 'Ad ve Soyad'),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: f(gun, 'Gun')),
            const SizedBox(width: 8),
            Expanded(child: f(ay, 'Ay')),
            const SizedBox(width: 8),
            Expanded(child: f(il, 'Il')),
          ]),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: hesabla,
            icon: const Icon(Icons.auto_awesome),
            label: const Text('ANALIZ ET', style: TextStyle(fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: qirmizi, foregroundColor: ag,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const SizedBox(height: 20),
          if (n != null) ...[
            k('Ad', n!['ad'], ag),
            k('EBCED', '${n!['e']}', qizil),
            k('CIFR', '${n!['c']} - ${cifrMena[n!['c']]}', Colors.purpleAccent),
            k('RUM', '${n!['r']}', Colors.orangeAccent),
            k('NUMEROLOGIYA', '${n!['p']}', Colors.cyan),
            k('${n!['b']['s']} BURC', '${n!['b']['ad']}\nPlanet: ${n!['b']['p']}\nElement: ${n!['b']['e']}', Colors.redAccent),
            k('PLANET GUNU', n!['pg'], Colors.blueAccent),
            k('CIN BURCU', n!['cb'], Colors.greenAccent),
          ],
        ]),
      ),
    );
  }
}