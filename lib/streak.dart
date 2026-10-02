import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class StreakWidget extends StatefulWidget {
  const StreakWidget({super.key});
  @override
  State<StreakWidget> createState() => _StreakWidgetState();
}

class _StreakWidgetState extends State<StreakWidget> {
  int gun = 0;
  @override
  void initState() { super.initState(); _yukle(); }

  Future<void> _yukle() async {
    final p = await SharedPreferences.getInstance();
    String? son = p.getString('son_tarix');
    int s = p.getInt('streak') ?? 0;
    String buGun = DateTime.now().toString().substring(0, 10);
    if (son != buGun) {
      if (son != null) {
        int ferq = DateTime.now().difference(DateTime.parse(son)).inDays;
        s = (ferq == 1) ? s + 1 : 1;
      } else { s = 1; }
      p.setString('son_tarix', buGun);
      p.setInt('streak', s);
    }
    if (mounted) setState(() => gun = s);
  }

  @override
  Widget build(BuildContext context) {
    if (gun == 0) return const SizedBox.shrink();
    String m = L.kod == 'az' ? '$gun gunluk seriya!' : (L.kod == 'tr' ? '$gun günlük seri!' : '$gun day streak!');
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1A0000),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orangeAccent.withOpacity(0.5)),
      ),
      child: Row(children: [
        const Text('\u{1F525}', style: TextStyle(fontSize: 26)),
        const SizedBox(width: 10),
        Text(m, style: const TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold, fontSize: 14)),
      ]),
    );
  }
}
