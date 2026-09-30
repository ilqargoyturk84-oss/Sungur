import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});
  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qizil = Color(0xFFFFD700);
  static const ag = Colors.white;

  final msg = TextEditingController();
  final List<Map<String, String>> mesajlar = [
    {'rol': 'bot', 'metn': 'Salam! Men Sungur AI. Bu gun size ne komek ede bilerem?'}
  ];

  static const List<Map<String, String>> cavablar = [
    {'a': 'sevgi', 'c': 'Sevgi haqqinda sorushursunuz. Tarot kartlarina gore, sevgi yolda. Sabirli olun.'},
    {'a': 'is', 'c': 'Is haqqinda. Bugun yeni imkanlar var. Cesur olun ve qerar verin.'},
    {'a': 'pul', 'c': 'Maddi veziyyet haqqinda. Bolluq enerjisi sizinledir. Legv olun, ugur gelecek.'},
    {'a': 'saglamliq', 'c': 'Saglamliq vacibdir. Bu gun istirahet edin, su icin, derin nefes alin.'},
    {'a': 'aile', 'c': 'Aile haqqinda. Onlarla vaxt kecirmek size guclu enerji verecek.'},
    {'a': 'yol', 'c': 'Yol haqqinda. Yeni seyahet ugurlu olacaq. Diqqetli olun.'},
    {'a': 'tarot', 'c': 'Tarot kartlari sizinle. Kart cekmek ucun Tarot sehifesine kecin.'},
    {'a': 'burc', 'c': 'Burcunuz haqqinda melumat ucun Sexsi Analiz sehifesine kecin.'},
  ];

  void gonder() {
    if (msg.text.isEmpty) return;
    String m = msg.text.toLowerCase();
    mesajlar.add({'rol': 'user', 'metn': msg.text});
    String c = 'Sualinizi basa dusdum. Daha detalli cavab ucun Tarot ve ya Reml sehifelerine kecin.';
    for (var cv in cavablar) {
      if (m.contains(cv['a']!)) { c = cv['c']!; break; }
    }
    mesajlar.add({'rol': 'bot', 'metn': c});
    msg.clear();
    HapticFeedback.lightImpact();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: qara,
      appBar: AppBar(
        backgroundColor: tundQara,
        title: const Text('AI CHATBOT', style: TextStyle(color: qirmizi, fontWeight: FontWeight.bold, fontSize: 16)),
        iconTheme: const IconThemeData(color: qirmizi),
      ),
      body: Column(children: [
        Expanded(child: ListView.builder(
          padding: const EdgeInsets.all(14),
          itemCount: mesajlar.length,
          itemBuilder: (_, i) {
            var m = mesajlar[i];
            bool bot = m['rol'] == 'bot';
            return Align(
              alignment: bot ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(12),
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                decoration: BoxDecoration(
                  color: bot ? tundQara : qirmizi,
                  borderRadius: BorderRadius.circular(14),
                  border: bot ? Border.all(color: qizil.withOpacity(0.4)) : null,
                ),
                child: Text(m['metn']!, style: const TextStyle(color: ag, fontSize: 14, height: 1.4)),
              ),
            );
          },
        )),
        Container(
          padding: const EdgeInsets.all(10),
          color: tundQara,
          child: Row(children: [
            Expanded(child: TextField(
              controller: msg,
              style: const TextStyle(color: ag),
              decoration: InputDecoration(
                hintText: 'Sualinizi yazin...',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: qirmizi)),
              ),
              onSubmitted: (_) => gonder(),
            )),
            const SizedBox(width: 8),
            CircleAvatar(backgroundColor: qirmizi, child: IconButton(icon: const Icon(Icons.send, color: ag), onPressed: gonder)),
          ]),
        ),
      ]),
    );
  }
}
