import 'package:flutter/material.dart';
import '../l10n/app_languages.dart';
import '../engine/mystic_engine.dart';

class SungurHomeScreen extends StatefulWidget {
  const SungurHomeScreen({super.key});

  @override
  State<SungurHomeScreen> createState() => _SungurHomeScreenState();
}

class _SungurHomeScreenState extends State<SungurHomeScreen> {
  String currentLanguage = 'Azərbaycan';
  DateTime? selectedDate1;
  DateTime? selectedDate2;
  String resultText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SUNGUR', style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: const Color(0xFF161625),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.language, color: Color(0xFFD4AF37)),
            onSelected: (String lang) {
              setState(() {
                currentLanguage = lang;
              });
            },
            itemBuilder: (BuildContext context) {
              return AppLanguages.supportedLanguages.map((String lang) {
                return PopupMenuItem<String>(
                  value: lang,
                  child: Text(lang),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Icon(Icons.auto_awesome, size: 90, color: Color(0xFFD4AF37)),
            const SizedBox(height: 10),
            Text(
              'Dil: $currentLanguage',
              style: const TextStyle(color: Colors.amber, fontSize: 16),
            ),
            const SizedBox(height: 30),
            Card(
              color: const Color(0xFF1E1E2C),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('Fərdi Ezoterik Analiz', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (date != null) {
                          int num = MysticEngine.calculateLifePathNumber(date);
                          setState(() {
                            resultText = 'Həyat Yolu Nömrəniz: $num';
                          });
                        }
                      },
                      child: const Text('Doğum Tarixi Seç'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: const Color(0xFF1E1E2C),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('Cütlük Uyğunluğu (Dual-Pillar)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            selectedDate1 = await showDatePicker(
                              context: context,
                              initialDate: DateTime(2000),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                          },
                          child: const Text('1-ci Şəxs'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            selectedDate2 = await showDatePicker(
                              context: context,
                              initialDate: DateTime(2000),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                          },
                          child: const Text('2-ci Şəxs'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD4AF37)),
                      onPressed: () {
                        if (selectedDate1 != null && selectedDate2 != null) {
                          double score = MysticEngine.calculateCompatibility(selectedDate1!, selectedDate2!);
                          setState(() {
                            resultText = 'Cütlük Uyğunluğu: %${score.toStringAsFixed(1)}';
                          });
                        }
                      },
                      child: const Text('Uyğunluğu Hesabla', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            if (resultText.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFD4AF37)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  resultText,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.amber),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
