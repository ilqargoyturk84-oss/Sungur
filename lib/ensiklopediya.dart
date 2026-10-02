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
  String? seciliKateqoriya;

  static const List<Map<String, dynamic>> data = [
    {'k': 'Əbcəd', 'b': 'Əbcəd Elmi', 'm': 'Əbcəd ərəb əlifbasındaki hərflərə ədədi dəyər verilməsi ənənəsidir. Hər hərfin öz dəyəri var. Əbcəd-i Kəbir (böyük), Əbcəd-i Səğir (kiçik) və Əbcəd-i Vəsq (orta) növləri var. Misal: Əlif=1, Bə=2, Cim=3, Dal=4.'},
    {'k': 'Cifr', 'b': 'Cifr Elmi', 'm': 'Cifr, Əbcəd cəminin tək rəqəmə endirilməsidir. İmam Cəfər əs-Sadiqə nisbət edilir. Riyazi: Cifr(n) = n mod 9, 0 olarsa 9.'},
    {'k': 'Rûm', 'b': 'Rûm Elmi', 'm': 'Rûm, Əbcəd dəyərinin 9-a bölünməsindən qalan qalıqdır. Tək rəqəmlər (1,3,5,7,9) Fərdiyyə, cüt rəqəmlər (2,4,6,8) Zövciyyə adlanır. Kiçik rəqəm üstündür.'},
    {'k': 'Numerologiya', 'b': 'Pifaqor Numerologiyası', 'm': 'Pifaqor sisteminə görə hərflər 1-9 arası rəqəmlərə uyğun gəlir. Master ədədlər 11, 22, 33 xüsusi gücə malikdir.'},
    {'k': 'Bürc', 'b': 'Günəş Bürcləri', 'm': '12 bürc: Qoç, Buğa, Əkizlər, Xərçəng, Şir, Qız, Tərəzi, Əqrəb, Oxatan, Oğlaq, Dolça, Balıq. Hər bürcün planeti, elementi və gücü var.'},
    {'k': 'Tarot', 'b': '22 Böyük Arkana', 'm': 'Tarot kartları XV əsrdə İtaliyada ortaya çıxdı. 22 Böyük Arkana: Dəli, Sehrbaz, Baş Kahinə, İmperatriça, İmperator, Hierofant, Aşiqlər, Araba, Güc, Zahid, Bəxt Çarxı, Ədalət, Asılmış, Dəyişim, Müvazinət, Şeytan, Qüllə, Ulduz, Ay, Günəş, Məhkəmə, Dünya.'},
    {'k': 'Rəml', 'b': '16 Rəml Fiquru', 'm': 'Rəml qum elmidir. 16 fiqur: Via, Populus, Acquisitio, Laetitia, Fortuna Major, Conjunctio, Rubeus, Amissio, Tristitia, Carcer, Fortuna Minor, Puer, Puella, Albus, Caput Draconis, Cauda Draconis.'},
    {'k': 'Ay Mənzili', 'b': '28 Ay Mənzili', 'm': 'İslam astrologiyasının ən qədim sistemlərindən. 28 mənzil: Şəratəyn, Bətn, Süreya, Dəbəran, Həqəh, Hənnəh, Zirə, Nəsrə, Tərfə, Cəbhə, Zubra, Sərfə, Ava, Simak, Ğafr, Zubana, İklil, Qəlb, Şovlə, Neayim, Bəldə, Səd əl-Zabih, Səd əl-Bula, Səd əs-Süud, Səd əl-Ahbiyə, Fərğ əl-Mukdim, Fərğ əl-Muaxir, Rişa.'},
    {'k': 'İsmi-Əzəm', 'b': '99 İsmi-Əzəm', 'm': 'Allahın 99 adı: Allah, ər-Rahmən, ər-Rahim, əl-Məlik, əl-Quddus, əs-Salam, əl-Mömin, əl-Muheymin, əl-Əziz, əl-Cəbbar və s. Hər adın Əbcəd dəyəri var.'},
    {'k': 'Vəfq', 'b': 'Vəfq (Sehrli Kvadrat)', 'm': 'Vəfq ədədlərin kvadrat şəklində elə düzülməsidir ki, hər sətir, sütun və diaqonalın cəmi eyni olsun. Lo Şu kvadratı (3x3): 4-9-2, 3-5-7, 8-1-6.'},
    {'k': 'Planet', 'b': 'Planet Günləri', 'm': 'Bazar-Günəş, B.e.-Ay, Ç.a.-Mars, Çərşənbə-Merkuri, C.a.-Yupiter, Cümə-Venera, Şənbə-Zühəl.'},
    {'k': 'Çin', 'b': 'Çin Astrologiyası', 'm': '12 heyvan: Siçovul, Öküz, Pələng, Dovşan, Əjdaha, İlan, At, Qoyun, Meymun, Xoruz, İt, Donuz. 5 element: Odun, Od, Torpaq, Metal, Su.'},
    {'k': 'Hürufilik', 'b': 'Hürufilik (28 Məqam)', 'm': 'Fəzlullah Nəimi tərəfindən qurulmuş mistik təriqət. İnsan üzü 28 hərfin təcəssümüdür. Hər hərf üzün bir cizgisinə uyğun gəlir.'},
    {'k': 'Kabbalah', 'b': 'Kabbalah (Sefirot)', 'm': 'Həyat Ağacı 10 Sefirotdan ibarətdir: Keter (Tac), Chokhmah (Hikmət), Binah (Anlama), Chesed (Sevgi), Gevurah (Güc), Tiferet (Gözəllik), Netzach (Qələbə), Hod (Ehtiram), Yesod (Təməl), Malkuth (Krallıq).'},
    {'k': 'Runes', 'b': 'Elder Futhark (24 Run)', 'm': 'Şimali Avropa runları: Fehu, Uruz, Thurisaz, Ansuz, Raidho, Kenaz, Gebo, Wunjo, Hagalaz, Nauthiz, Isa, Jera, Eihwaz, Perthro, Algiz, Sowilo, Tiwaz, Berkano, Ehwaz, Mannaz, Laguz, Ingwaz, Dagaz, Othala.'},
    {'k': 'Vedic', 'b': 'Vedic Astrologiya', 'm': 'Nakshatra 27 ulduz mənzilidir: Ashwini, Bharani, Krittika, Rohini, Mrigashira, Ardra, Punarvasu, Pushya, Ashlesha, Magha, P.Phalguni, U.Phalguni, Hasta, Chitra, Swati, Vishakha, Anuradha, Jyeshtha, Mula, P.Ashadha, U.Ashadha, Shravana, Dhanishta, Shatabhisha, P.Bhadrapada, U.Bhadrapada, Revati.'},
    {'k': 'Dekanat', 'b': 'Bürc Dekanatları', 'm': 'Hər bürc 30°-dir və 3 dekanata (10°) bölünür. Hər dekanatın öz planet hökmdarı var.'},
    {'k': 'Həftəlik', 'b': 'Həftə Günləri', 'm': 'B.e.-Ay, Ç.a.-Mars, Ç.-Merkuri, C.a.-Yupiter, C.-Venera, Ş.-Zühəl, B.-Günəş.'},
    {'k': 'Element', 'b': '4 Element', 'm': 'Od (ehtiraslı, lider), Hava (zəkalı, ünsiyyətçil), Su (duyğusal, intuisiv), Torpaq (dayanıqlı, səbirli).'},
    {'k': 'Mələk', 'b': 'Mələklər', 'm': 'Cəbrail (vəhy), Mikayil (ruz), İsrafil (sur), Əzrail (ölüm), Munkar və Nəkir (sual), Ridvan (cənnət).'},
  ];

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
