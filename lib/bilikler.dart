import 'package:flutter/material.dart';

class SehifeReference extends StatefulWidget {
  const SehifeReference({super.key});
  @override
  State<SehifeReference> createState() => _SehifeReferenceState();
}

class _SehifeReferenceState extends State<SehifeReference> {
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;
  final axtar = TextEditingController();

  static const List<Map<String, String>> burcler = [
    {'ad': 'Qoc', 'tarix': '21.03 - 19.04', 'p': 'Mars', 'e': 'Od', 'g': '1.8', 'x': 'Cesur'},
    {'ad': 'Buga', 'tarix': '20.04 - 20.05', 'p': 'Venera', 'e': 'Torpaq', 'g': '1.2', 'x': 'Sebirli'},
    {'ad': 'Ekizler', 'tarix': '21.05 - 20.06', 'p': 'Merkuri', 'e': 'Hava', 'g': '1.5', 'x': 'Cevik'},
    {'ad': 'Xerceng', 'tarix': '21.06 - 22.07', 'p': 'Ay', 'e': 'Su', 'g': '1.0', 'x': 'Duygusal'},
    {'ad': 'Sir', 'tarix': '23.07 - 22.08', 'p': 'Gunes', 'e': 'Od', 'g': '2.0', 'x': 'Lider'},
    {'ad': 'Qiz', 'tarix': '23.08 - 22.09', 'p': 'Merkuri', 'e': 'Torpaq', 'g': '1.3', 'x': 'Analitik'},
    {'ad': 'Terezi', 'tarix': '23.09 - 22.10', 'p': 'Venera', 'e': 'Hava', 'g': '1.1', 'x': 'Balansli'},
    {'ad': 'Eqreb', 'tarix': '23.10 - 21.11', 'p': 'Pluton', 'e': 'Su', 'g': '1.7', 'x': 'Guclu'},
    {'ad': 'Oxatan', 'tarix': '22.11 - 21.12', 'p': 'Yupiter', 'e': 'Od', 'g': '1.6', 'x': 'Optimist'},
    {'ad': 'Oglaq', 'tarix': '22.12 - 19.01', 'p': 'Zuhal', 'e': 'Torpaq', 'g': '0.8', 'x': 'Meqsedli'},
    {'ad': 'Dolca', 'tarix': '20.01 - 18.02', 'p': 'Uran', 'e': 'Hava', 'g': '1.1', 'x': 'Yenilikci'},
    {'ad': 'Baliq', 'tarix': '19.02 - 20.03', 'p': 'Neptun', 'e': 'Su', 'g': '1.4', 'x': 'Xeyalperest'},
  ];

  static const List<Map<String, String>> ayMenzil = [
    {'ad': 'Serateyn', 'm': 'Baslangic, muharibe', 'b': '+0.12'},
    {'ad': 'Betn əl-Hut', 'm': 'Seyahat, gizli', 'b': '+0.08'},
    {'ad': 'Sureya', 'm': 'Evlilik, bolluq', 'b': '+0.18'},
    {'ad': 'Debaran', 'm': 'Xeyir, muveffeqiyyet', 'b': '+0.20'},
    {'ad': 'Heqeh', 'm': 'Qazanc, ugur', 'b': '+0.22'},
    {'ad': 'Henneh', 'm': 'Ittifaq, yardim', 'b': '+0.15'},
    {'ad': 'Zire', 'm': 'Mulk qazanmaq', 'b': '+0.18'},
    {'ad': 'Nesre', 'm': 'Cetin gun', 'b': '-0.10'},
    {'ad': 'Terfe', 'm': 'Uzun xestelik', 'b': '-0.15'},
    {'ad': 'Cebhe', 'm': 'Muveffeqiyyet', 'b': '+0.16'},
    {'ad': 'Zubra', 'm': 'Yaxsiliq, dostluq', 'b': '+0.14'},
    {'ad': 'Serfe', 'm': 'Keder, mane', 'b': '-0.08'},
    {'ad': 'Ava', 'm': 'Intiqam, qorxu', 'b': '-0.12'},
    {'ad': 'Simak', 'm': 'Asan dogum, rifah', 'b': '+0.10'},
    {'ad': 'Gafr', 'm': 'Xezine, gizli', 'b': '+0.08'},
    {'ad': 'Zubana', 'm': 'Esaret, belalar', 'b': '-0.18'},
    {'ad': 'Iklil', 'm': 'Xeyirli', 'b': '+0.12'},
    {'ad': 'Qelb', 'm': 'Guc, quvvet', 'b': '+0.20'},
    {'ad': 'Sovle', 'm': 'Yaxsi isler', 'b': '+0.15'},
    {'ad': 'Neayim', 'm': 'Ayriliq, huzn', 'b': '-0.10'},
    {'ad': 'Belde', 'm': 'Geri donus', 'b': '+0.05'},
    {'ad': 'SedZabih', 'm': 'Azadliq, sefa', 'b': '+0.18'},
    {'ad': 'SedBula', 'm': 'Xestelik', 'b': '-0.08'},
    {'ad': 'SedSuud', 'm': 'Evlilik, muveffeqiyyet', 'b': '+0.22'},
    {'ad': 'SedAhbiye', 'm': 'Yagis, artim', 'b': '+0.15'},
    {'ad': 'FergMukdim', 'm': 'Bina, ev', 'b': '+0.10'},
    {'ad': 'FergMuaxir', 'm': 'Mehsul, ugur', 'b': '+0.12'},
    {'ad': 'Risa', 'm': 'Baliqchiliq, xosbextlik', 'b': '+0.16'},
  ];

  static const List<Map<String, String>> tarot = [
    {'ad': 'Deli', 'm': 'Risk, baslangic', 'b': '+0.20', 's': '\u{1F3AD}'},
    {'ad': 'Sehrbaz', 'm': 'Irade, bacariq', 'b': '+0.30', 's': '\u{1F52E}'},
    {'ad': 'Bas Kahine', 'm': 'Bilik, intuisiya', 'b': '+0.15', 's': '\u{1F319}'},
    {'ad': 'Imperatrica', 'm': 'Bolluq', 'b': '+0.25', 's': '\u{1F451}'},
    {'ad': 'Imperator', 'm': 'Liderlik', 'b': '+0.35', 's': '\u{1F3DB}'},
    {'ad': 'Hierofant', 'm': 'Enene', 'b': '+0.18', 's': '\u{1F4DC}'},
    {'ad': 'Asiqler', 'm': 'Harmoniya', 'b': '+0.22', 's': '\u{1F495}'},
    {'ad': 'Araba', 'm': 'Qelebe', 'b': '+0.40', 's': '\u{1F3C7}'},
    {'ad': 'Guc', 'm': 'Cesaret', 'b': '+0.45', 's': '\u{1F981}'},
    {'ad': 'Zahid', 'm': 'Fokus', 'b': '+0.12', 's': '\u{1F9D8}'},
    {'ad': 'Bext Carxi', 'm': 'Sans', 'b': '+0.35', 's': '\u{1F3A1}'},
    {'ad': 'Edalet', 'm': 'Balans', 'b': '+0.15', 's': '\u2696'},
    {'ad': 'Asilmis', 'm': 'Gozleme', 'b': '-0.10', 's': '\u{1F643}'},
    {'ad': 'Deyisim', 'm': 'Transformasiya', 'b': '+0.05', 's': '\u{1F480}'},
    {'ad': 'Muvazinet', 'm': 'Sebir', 'b': '+0.18', 's': '\u{1F30A}'},
    {'ad': 'Seytan', 'm': 'Asliliq', 'b': '-0.20', 's': '\u{1F608}'},
    {'ad': 'Qulle', 'm': 'Dagilma', 'b': '-0.30', 's': '\u{1F5FC}'},
    {'ad': 'Ulduz', 'm': 'Umid', 'b': '+0.28', 's': '\u2B50'},
    {'ad': 'Ay', 'm': 'Illuziya', 'b': '-0.15', 's': '\u{1F315}'},
    {'ad': 'Gunes', 'm': 'Ugur', 'b': '+0.50', 's': '\u2600'},
    {'ad': 'Mehkeme', 'm': 'Oyanis', 'b': '+0.22', 's': '\u{1F4EF}'},
    {'ad': 'Dunya', 'm': 'Tamamlanma', 'b': '+0.45', 's': '\u{1F30D}'},
  ];

  static const List<Map<String, String>> reml = [
    {'ad': 'Via', 'm': 'Yol, seyahet', 'b': '0.00'},
    {'ad': 'Populus', 'm': 'Kutle, xalq', 'b': '+0.15'},
    {'ad': 'Acquisitio', 'm': 'Qazanc', 'b': '+0.22'},
    {'ad': 'Laetitia', 'm': 'Sevinc', 'b': '+0.28'},
    {'ad': 'Fortuna Major', 'm': 'Boyuk bext', 'b': '+0.30'},
    {'ad': 'Conjunctio', 'm': 'Ittifaq', 'b': '+0.18'},
    {'ad': 'Rubeus', 'm': 'Qezeb', 'b': '-0.18'},
    {'ad': 'Amissio', 'm': 'Itki', 'b': '-0.25'},
    {'ad': 'Tristitia', 'm': 'Keder', 'b': '-0.15'},
    {'ad': 'Carcer', 'm': 'Mehdudiyyet', 'b': '-0.22'},
    {'ad': 'Fortuna Minor', 'm': 'Kicik bext', 'b': '+0.15'},
    {'ad': 'Puer', 'm': 'Genc guc', 'b': '+0.20'},
    {'ad': 'Puella', 'm': 'Harmoniya', 'b': '+0.12'},
    {'ad': 'Albus', 'm': 'Safliq', 'b': '+0.10'},
    {'ad': 'Caput Draconis', 'm': 'Yeni furset', 'b': '+0.08'},
    {'ad': 'Cauda Draconis', 'm': 'Baglanma', 'b': '-0.12'},
  ];

  static const List<Map<String, String>> cifr = [
    {'r': '1', 'm': 'Vahid, Baslangic', 'e': 'Liderlik'},
    {'r': '2', 'm': 'Cutluk, Tarazliq', 'e': 'Harmoniya'},
    {'r': '3', 'm': 'Ucluk, Yaradiciliq', 'e': 'Optimizm'},
    {'r': '4', 'm': 'Dordluk, Sabitlik', 'e': 'Sebir'},
    {'r': '5', 'm': 'Beslik, Deyisim', 'e': 'Azadliq'},
    {'r': '6', 'm': 'Altiliq, Mesuliyyet', 'e': 'Qaygi'},
    {'r': '7', 'm': 'Yeddilik, Meneviyyat', 'e': 'Mudriklik'},
    {'r': '8', 'm': 'Sekkizlik, Bolluq', 'e': 'Ugur'},
    {'r': '9', 'm': 'Doqquzluq, Tamamlanma', 'e': 'Kamillik'},
  ];

  static const List<Map<String, String>> planet = [
    {'g': 'Bazar', 'p': 'Gunes', 'e': 'Liderlik', 'b': '+0.18'},
    {'g': 'B.e.', 'p': 'Ay', 'e': 'Duygu', 'b': '+0.10'},
    {'g': 'C.a.', 'p': 'Mars', 'e': 'Aqressiya', 'b': '+0.15'},
    {'g': 'Cersenbe', 'p': 'Merkuri', 'e': 'Zeka', 'b': '+0.05'},
    {'g': 'C.a.', 'p': 'Yupiter', 'e': 'Ugur', 'b': '+0.20'},
    {'g': 'Cume', 'p': 'Venera', 'e': 'Harmoniya', 'b': '+0.12'},
    {'g': 'Senbe', 'p': 'Zuhal', 'e': 'Mehdudiyyet', 'b': '-0.10'},
  ];
