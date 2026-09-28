import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SehifeReml extends StatefulWidget {
  const SehifeReml({super.key});
  @override
  State<SehifeReml> createState() => _SehifeRemlState();
}

class _SehifeRemlState extends State<SehifeReml> {
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;

  final ad = TextEditingController();
  final niyyet = TextEditingController();
  Map<String, dynamic>? n;

  static const List<Map<String, String>> fiqurlar = [
    {'ad': 'Via', 'en': 'Way', 'mena': 'Yol, seyahet', 'b': '0.00', 'n': '\u25CF\u25CF\u25CF\u25CF'},
    {'ad': 'Populus', 'en': 'People', 'mena': 'Kutle, xalq', 'b': '+0.15', 'n': '\u25CB\u25CB\u25CB\u25CB'},
    {'ad': 'Acquisitio', 'en': 'Gain', 'mena': 'Qazanc, elde etme', 'b': '+0.22', 'n': '\u25CF\u25CF\u25CF\u25CB'},
    {'ad': 'Laetitia', 'en': 'Joy', 'mena': 'Sevinc, xosbextlik', 'b': '+0.28', 'n': '\u25CF\u25CF\u25CB\u25CF'},
    {'ad': 'Fortuna Major', 'en': 'Greater Fortune', 'mena': 'Boyuk bext, ugur', 'b': '+0.30', 'n': '\u25CF\u25CB\u25CF\u25CF'},
    {'ad': 'Conjunctio', 'en': 'Conjunction', 'mena': 'Birlesme, ittifaq', 'b': '+0.18', 'n': '\u25CB\u25CF\u25CF\u25CF'},
    {'ad': 'Rubeus', 'en': 'Red', 'mena': 'Aqressiya, qezeb', 'b': '-0.18', 'n': '\u25CB\u25CB\u25CF\u25CB'},
    {'ad': 'Amissio', 'en': 'Loss', 'mena': 'Itki, meglubiyyet', 'b': '-0.25', 'n': '\u25CB\u25CB\u25CB\u25CF'},
    {'ad': 'Tristitia', 'en': 'Sadness', 'mena': 'Keder, huzn', 'b': '-0.15', 'n': '\u25CF\u25CB\u25CB\u25CB'},
    {'ad': 'Carcer', 'en': 'Prison', 'mena': 'Mehdudiyyet, hebs', 'b': '-0.22', 'n': '\u25CB\u25CF\u25CB\u25CB'},
    {'ad': 'Fortuna Minor', 'en': 'Lesser Fortune', 'mena': 'Kicik bext', 'b': '+0.15', 'n': '\u25CF\u25CF\u25CB\u25CB'},
    {'ad': 'Puer', 'en': 'Boy', 'mena': 'Genc guc, impulsivlik', 'b': '+0.20', 'n': '\u25CB\u25CB\u25CF\u25CF'},
    {'ad': 'Puella', 'en': 'Girl', 'mena': 'Harmoniya, gozellik', 'b': '+0.12', 'n': '\u25CF\u25CB\u25CF\u25CB'},
    {'ad': 'Albus', 'en': 'White', 'mena': 'Aydinliq, safliq', 'b': '+0.10', 'n': '\u25CB\u25CF\u25CB\u25CF'},
    {'ad': 'Caput Draconis', 'en': "Dragon's Head", 'mena': 'Baslangic, yeni furset', 'b': '+0.08', 'n': '\u25CF\u25CB\u25CB\u25CF'},
    {'ad': 'Cauda Draconis', 'en': "Dragon's Tail", 'mena': 'Son, baglanma', 'b': '-0.12', 'n': '\u25CB\u25CF\u25CF\u25CB'},
  ];

  int hash(String s) {
    int h = 0;
    for (int i = 0; i < s.length; i++) { h = (h * 31 + s.codeUnitAt(i)) % 100000; }
    return h;
  }

  void cek() {
    if (ad.text.isEmpty || niyyet.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ad ve niyyet doldurun!'), backgroundColor: Colors.red));
      return;
    }
    String seed = ad.text + niyyet.text;
    int idx = hash(seed) % 16;
    var f = fiqurlar[idx];
    HapticFeedback.mediumImpact();
    setState(() {
      n = {'ad': f['ad'], 'en': f['en'], 'mena': f['mena'], 'b': f['b'], 'nq': f['n']};
    });
  }
