import 'meditasiya.dart';
import 'ensiklopediya.dart';
import 'huquq/senedler.dart';
import 'uc_sistem.dart';
import 'bes_sistem.dart';
import 'bati_astro.dart';
import 'gunun_ay.dart';
import 'streak.dart';
import 'chatbot.dart';
import 'gunun_karti.dart';
import 'ai_destek.dart';
import 'bilikler.dart';
import 'movqe.dart';
import 'reml.dart';
import 'tarot.dart';
import 'uygunluq.dart';
import 'sehzsi_analiz.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  final prefs = await SharedPreferences.getInstance();
  String? dil = prefs.getString('dil');
  runApp(SungurApp(baslangicDili: dil));
}

class L {
  static const Map<String, Map<String, String>> _s = {
    'az': {
      'app': 'Sungur Mistik', 'tag': '25 Mistik Elm', 'choose': 'Dil seçin',
      'personal': 'ŞƏXSİ ANALİZ', 'compat': 'UYĞUNLUQ', 'tarot': 'TAROT',
      'reml': 'RƏML', 'position': 'MÖVQE / YER', 'reference': 'BİLİKLƏR',
      'personal_d': 'Ad və tarixlə mistik dəyərlər', 'compat_d': 'İki şəxsin uyğunluğu',
      'tarot_d': 'Niyyətini kartla yoxla', 'reml_d': 'Niyyətini rəmlə yoxla',
      'position_d': 'Yerdə qalma müddəti', 'reference_d': 'Cədvəllər və axtarış',
    },
    'tr': {
      'app': 'Sungur Mistik', 'tag': '25 Mistik İlim', 'choose': 'Dil seçin',
      'personal': 'KİŞİSEL ANALİZ', 'compat': 'UYUMLULUK', 'tarot': 'TAROT',
      'reml': 'REML', 'position': 'KONUM / YER', 'reference': 'BİLGİLER',
      'personal_d': 'İsim ve tarihle mistik değerler', 'compat_d': 'İki kişinin uyumu',
      'tarot_d': 'Niyetini kartla kontrol et', 'reml_d': 'Niyetini reml ile kontrol et',
      'position_d': 'Yerde kalma süresi', 'reference_d': 'Tablolar ve arama',
    },
    'ru': {
      'app': 'Sungur Мистик', 'tag': '25 Мистических Наук', 'choose': 'Выберите язык',
      'personal': 'ЛИЧНЫЙ АНАЛИЗ', 'compat': 'СОВМЕСТИМОСТЬ', 'tarot': 'ТАРО',
      'reml': 'РЕМЛ', 'position': 'ПОЗИЦИЯ / МЕСТО', 'reference': 'ЗНАНИЯ',
      'personal_d': 'Мистические значения', 'compat_d': 'Совместимость двух людей',
      'tarot_d': 'Проверь намерение картой', 'reml_d': 'Проверь намерение ремлем',
      'position_d': 'Время пребывания', 'reference_d': 'Таблицы и поиск',
    },
    'en': {
      'app': 'Sungur Mystic', 'tag': '25 Mystic Sciences', 'choose': 'Choose language',
      'personal': 'PERSONAL ANALYSIS', 'compat': 'COMPATIBILITY', 'tarot': 'TAROT',
      'reml': 'REML', 'position': 'POSITION / PLACE', 'reference': 'KNOWLEDGE',
      'personal_d': 'Mystic values by name & date', 'compat_d': 'Compatibility of two people',
      'tarot_d': 'Check your intention with cards', 'reml_d': 'Check your intention with reml',
      'position_d': 'Duration of stay', 'reference_d': 'Tables and search',
    },
    'ar': {
      'app': 'سونغور صوفي', 'tag': '٢٥ علمًا صوفيًا', 'choose': 'اختر اللغة',
      'personal': 'تحليل شخصي', 'compat': 'التوافق', 'tarot': 'التاروت',
      'reml': 'الرمل', 'position': 'الموقع / المكان', 'reference': 'المعرفة',
      'personal_d': 'القيم الصوفية', 'compat_d': 'توافق شخصين',
      'tarot_d': 'تحقق من نيتك', 'reml_d': 'تحقق من نيتك',
      'position_d': 'مدة البقاء', 'reference_d': 'الجداول والبحث',
    },
    'fa': {
      'app': 'سونگور میستیک', 'tag': '۲۵ علم عرفانی', 'choose': 'زبان را انتخاب کنید',
      'personal': 'تحلیل شخصی', 'compat': 'سازگاری', 'tarot': 'تاروت',
      'reml': 'رمل', 'position': 'موقعیت / مکان', 'reference': 'دانش',
      'personal_d': 'ارزش‌های عرفانی', 'compat_d': 'سازگاری دو نفر',
      'tarot_d': 'نیّت خود را بسنجید', 'reml_d': 'نیّت خود را بسنجید',
      'position_d': 'مدت ماندن', 'reference_d': 'جداول و جستجو',
    },
    'de': {
      'app': 'Sungur Mystik', 'tag': '25 Mystische Wissenschaften', 'choose': 'Sprache wählen',
      'personal': 'PERSÖNLICHE ANALYSE', 'compat': 'KOMPATIBILITÄT', 'tarot': 'TAROT',
      'reml': 'REML', 'position': 'POSITION / ORT', 'reference': 'WISSEN',
      'personal_d': 'Mystische Werte', 'compat_d': 'Kompatibilität zweier Personen',
      'tarot_d': 'Prüfe deine Absicht', 'reml_d': 'Prüfe deine Absicht',
      'position_d': 'Aufenthaltsdauer', 'reference_d': 'Tabellen und Suche',
    },
    'fr': {
      'app': 'Sungur Mystique', 'tag': '25 Sciences Mystiques', 'choose': 'Choisir la langue',
      'personal': 'ANALYSE PERSONNELLE', 'compat': 'COMPATIBILITÉ', 'tarot': 'TAROT',
      'reml': 'REML', 'position': 'POSITION / LIEU', 'reference': 'CONNAISSANCE',
      'personal_d': 'Valeurs mystiques', 'compat_d': 'Compatibilité de deux personnes',
      'tarot_d': 'Vérifiez votre intention', 'reml_d': 'Vérifiez votre intention',
      'position_d': 'Durée du séjour', 'reference_d': 'Tableaux et recherche',
    },
    'es': {
      'app': 'Sungur Místico', 'tag': '25 Ciencias Místicas', 'choose': 'Elegir idioma',
      'personal': 'ANÁLISIS PERSONAL', 'compat': 'COMPATIBILIDAD', 'tarot': 'TAROT',
      'reml': 'REML', 'position': 'POSICIÓN / LUGAR', 'reference': 'CONOCIMIENTO',
      'personal_d': 'Valores místicos', 'compat_d': 'Compatibilidad de dos personas',
      'tarot_d': 'Verifica tu intención', 'reml_d': 'Verifica tu intención',
      'position_d': 'Duración de estancia', 'reference_d': 'Tablas y búsqueda',
    },
    'zh': {
      'app': 'Sungur 神秘', 'tag': '25 神秘科学', 'choose': '选择语言',
      'personal': '个人分析', 'compat': '兼容性', 'tarot': '塔罗',
      'reml': '雷姆尔', 'position': '位置 / 地点', 'reference': '知识',
      'personal_d': '神秘价值', 'compat_d': '两人的兼容性',
      'tarot_d': '用卡片验证你的意图', 'reml_d': '用雷姆尔验证你的意图',
      'position_d': '停留时间', 'reference_d': '表格和搜索',
    },
  };

  static late String _k;
  static late Map<String, String> _c;

  static void set(String kod) {
    _k = kod;
    _c = _s[kod] ?? _s['az']!;
  }

  static String get kod => _k;
  static String t(String a) => _c[a] ?? a;

  static const List<Map<String, String>> list = [
    {'kod': 'az', 'ad': 'Azərbaycan', 'bayraq': '🇦🇿'},
    {'kod': 'tr', 'ad': 'Türkçe', 'bayraq': '🇹🇷'},
    {'kod': 'ru', 'ad': 'Русский', 'bayraq': '🇷🇺'},
    {'kod': 'en', 'ad': 'English', 'bayraq': '🇬🇧'},
    {'kod': 'ar', 'ad': 'العربية', 'bayraq': '🇸🇦'},
    {'kod': 'fa', 'ad': 'فارسی', 'bayraq': '🇮🇷'},
    {'kod': 'de', 'ad': 'Deutsch', 'bayraq': '🇩🇪'},
    {'kod': 'fr', 'ad': 'Français', 'bayraq': '🇫🇷'},
    {'kod': 'es', 'ad': 'Español', 'bayraq': '🇪🇸'},
    {'kod': 'zh', 'ad': '中文', 'bayraq': '🇨🇳'},
  ];
}

class C {
  static const qara = Color(0xFF0A0A0A);
  static const tundQara = Color(0xFF1A0000);
  static const qirmizi = Color(0xFFC62828);
  static const qirmiziAcik = Color(0xFFE53935);
  static const qizil = Color(0xFFFFD700);
  static const boz = Color(0xFF888888);
  static const ag = Colors.white;
}

class SungurApp extends StatelessWidget {
  final String? baslangicDili;
  const SungurApp({super.key, this.baslangicDili});

  @override
  Widget build(BuildContext context) {
    if (baslangicDili != null) L.set(baslangicDili!);
    return MaterialApp(
      title: 'Sungur Mistik',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: C.qara,
      ),
      home: baslangicDili == null ? const Splash() : const EsasEkran(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const DilSecimi()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.qara,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 160, height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                border: Border.all(color: C.qirmizi, width: 3),
                boxShadow: [BoxShadow(color: C.qirmizi.withOpacity(0.4), blurRadius: 30, spreadRadius: 5)],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/logo.png', fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(Icons.local_fire_department, color: C.qirmizi, size: 80),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text('SUNGUR', style: TextStyle(color: C.qirmizi, fontSize: 34, fontWeight: FontWeight.bold, letterSpacing: 8)),
            const SizedBox(height: 4),
            const Text('MİSTİK', style: TextStyle(color: C.ag, fontSize: 14, letterSpacing: 12)),
            const SizedBox(height: 40),
            const SizedBox(
              width: 30, height: 30,
              child: CircularProgressIndicator(color: C.qirmizi, strokeWidth: 2),
            ),
          ],
        ),
      ),
    );
  }
}

class DilSecimi extends StatelessWidget {
  const DilSecimi({super.key});

  Future<void> _sec(BuildContext ctx, String kod) async {
    final p = await SharedPreferences.getInstance();
    await p.setString('dil', kod);
    L.set(kod);
    if (ctx.mounted) {
      Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (_) => const EsasEkran()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.qara,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              width: 80, height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.black,
                border: Border.all(color: C.qirmizi, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset('assets/logo.png', fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(Icons.local_fire_department, color: C.qirmizi, size: 40),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('SUNGUR MİSTİK', style: TextStyle(color: C.qirmizi, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 4)),
            const SizedBox(height: 30),
            const Text('Dil seçin / Choose language', style: TextStyle(color: C.boz, fontSize: 14)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: L.list.length,
                itemBuilder: (ctx, i) {
                  final d = L.list[i];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ElevatedButton(
                      onPressed: () => _sec(ctx, d['kod']!),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: C.tundQara,
                        foregroundColor: C.ag,
                        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: C.qirmizi.withOpacity(0.5), width: 1),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        children: [
                          Text(d['bayraq']!, style: const TextStyle(fontSize: 22)),
                          const SizedBox(width: 14),
                          Text(d['ad']!, style: const TextStyle(fontSize: 15)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EsasEkran extends StatelessWidget {
  const EsasEkran({super.key});

  @override
  Widget build(BuildContext context) {
    final kartlar = [
      {'ad': L.t('personal'), 'alt': L.t('personal_d'), 'ikon': Icons.auto_awesome, 'reng': C.qirmizi},
      {'ad': L.t('compat'), 'alt': L.t('compat_d'), 'ikon': Icons.favorite, 'reng': C.qirmiziAcik},
      {'ad': L.t('tarot'), 'alt': L.t('tarot_d'), 'ikon': Icons.style, 'reng': C.qizil},
      {'ad': L.t('reml'), 'alt': L.t('reml_d'), 'ikon': Icons.grid_on, 'reng': C.qirmizi},
      {'ad': L.t('position'), 'alt': L.t('position_d'), 'ikon': Icons.place, 'reng': C.qirmiziAcik},
      {'ad': L.t('reference'), 'alt': L.t('reference_d'), 'ikon': Icons.menu_book, 'reng': C.qizil},
      {'ad': 'CHATBOT', 'alt': 'Sungur AI ile sohbet', 'ikon': Icons.psychology, 'reng': Colors.purpleAccent},
      {'ad': 'BATI ASTROLOJIYASI', 'alt': 'Dogum xeritesi (Birth Chart)', 'ikon': Icons.public, 'reng': Colors.orangeAccent},
      {'ad': 'SINASTRİYA', 'alt': 'Iki xeritenin uygunlugu', 'ikon': Icons.compare_arrows, 'reng': Colors.teal},
      {'ad': 'VEDIC ASTROLOGIYA', 'alt': 'Nakshatra sistemi', 'ikon': Icons.auto_awesome, 'reng': Colors.deepPurpleAccent},
      {'ad': 'BA ZI', 'alt': 'Cin 4 sutun analizi', 'ikon': Icons.view_column, 'reng': Colors.brown},
      {'ad': 'KABBALAH', 'alt': 'Həyat agaci (Sefirot)', 'ikon': Icons.account_tree, 'reng': Colors.lightBlueAccent},
      {'ad': 'RUNES', 'alt': 'Elder Futhark (24 run)', 'ikon': Icons.text_fields, 'reng': Colors.pinkAccent},
      {'ad': 'GUNLUK JURNAL', 'alt': 'Gunluk qeydler', 'ikon': Icons.book, 'reng': Colors.lightGreen},
      {'ad': 'YUXU GUNDELIYI', 'alt': 'Yuxularinizi yazin', 'ikon': Icons.nightlight_round, 'reng': Colors.indigo},
      {'ad': 'AFFIRMASIYALAR', 'alt': 'Gunun pozitiv sozleri', 'ikon': Icons.self_improvement, 'reng': Colors.amber},
      {'ad': 'ENSIKLOPEDIYA', 'alt': '50+ mistik meqale', 'ikon': Icons.library_books, 'reng': Colors.deepOrangeAccent},
      {'ad': 'MEDITASIYA', 'alt': 'Nefes ve fokus taymeri', 'ikon': Icons.spa, 'reng': Colors.tealAccent},
      {'ad': 'HAQQINDA', 'alt': 'Tetbiq ve hüquqi melumat', 'ikon': Icons.info_outline, 'reng': Colors.blueGrey},
    ];

    return Scaffold(
      backgroundColor: C.qara,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 30, height: 30,
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: C.qirmizi, width: 1.5)),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Image.asset('assets/logo.png', fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(Icons.local_fire_department, color: C.qirmizi, size: 18),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(L.t('app'), style: const TextStyle(color: C.qirmizi, fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 2)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.language, color: C.qirmizi),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DilSecimi())),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Text(L.t('tag'), style: const TextStyle(color: C.boz, fontSize: 12, letterSpacing: 2)),
          const GununKarti(),
          const GununAy(),
          const StreakWidget(),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.05,
              ),
              itemCount: kartlar.length,
              itemBuilder: (ctx, i) {
                final k = kartlar[i];
                return _Kart(
                  ad: k['ad'] as String,
                  alt: k['alt'] as String,
                  ikon: k['ikon'] as IconData,
                  reng: k['reng'] as Color,
                  onTap: () => _ac(ctx, i),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  void _ac(BuildContext ctx, int i) {
    final sehifeler = [
      const SehifePersonal(),
      const SehifeCompat(),
      const SehifeTarot(),
      const SehifeReml(),
      const SehifePosition(),
      const SehifeReference(),
      const Chatbot(),
      const BatiAstro(),
      const Sinastriya(),
      const Vedic(),
      const BaZi(),
      const Kabbalah(),
      const Runes(),
      const Jurnal(),
      const Yuxu(),
      const Affirmasiyalar(),
      const Ensiklopediya(),
      const Meditasiya(),
      const Haqqinda(),
    ];
    Navigator.push(ctx, MaterialPageRoute(builder: (_) => sehifeler[i]));
  }
}

class _Kart extends StatefulWidget {
  final String ad, alt;
  final IconData ikon;
  final Color reng;
  final VoidCallback onTap;
  const _Kart({required this.ad, required this.alt, required this.ikon, required this.reng, required this.onTap});

  @override
  State<_Kart> createState() => _KartState();
}

class _KartState extends State<_Kart> {
  bool _basildi = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _basildi = true),
      onTapUp: (_) => setState(() => _basildi = false),
      onTapCancel: () => setState(() => _basildi = false),
      onTap: () {
        HapticFeedback.mediumImpact();
        widget.onTap();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              _basildi ? widget.reng.withOpacity(0.3) : C.tundQara,
              C.qara,
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: widget.reng.withOpacity(_basildi ? 1 : 0.4), width: 1.5),
          boxShadow: _basildi
              ? [BoxShadow(color: widget.reng.withOpacity(0.4), blurRadius: 20, spreadRadius: 2)]
              : [BoxShadow(color: widget.reng.withOpacity(0.1), blurRadius: 10)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48, height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.reng.withOpacity(0.15),
                border: Border.all(color: widget.reng.withOpacity(0.5)),
              ),
              child: Icon(widget.ikon, color: widget.reng, size: 26),
            ),
            const Spacer(),
            Text(widget.ad, style: const TextStyle(color: C.ag, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
            const SizedBox(height: 4),
            Text(widget.alt, style: TextStyle(color: C.boz, fontSize: 10, height: 1.3), maxLines: 2, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}

class _SehifePlaceholder extends StatelessWidget {
  final String ad;
  final IconData ikon;
  final Color reng;
  const _SehifePlaceholder({required this.ad, required this.ikon, required this.reng});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.qara,
      appBar: AppBar(
        backgroundColor: C.tundQara,
        title: Text(ad, style: const TextStyle(color: C.qirmizi, fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: C.qirmizi),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100, height: 100,
              decoration: BoxDecoration(shape: BoxShape.circle, color: reng.withOpacity(0.15), border: Border.all(color: reng, width: 2)),
              child: Icon(ikon, color: reng, size: 50),
            ),
            const SizedBox(height: 24),
            Text(ad, style: const TextStyle(color: C.ag, fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('Tezliklə əlavə olunacaq', style: TextStyle(color: C.boz, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}






