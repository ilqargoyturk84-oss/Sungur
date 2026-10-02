import 'dart:math';
import 'package:flutter/material.dart';

// ═══════════════════════════════════════════════════
// 1. RƏNGLƏR
// ═══════════════════════════════════════════════════
class Reng {
  static const qara = Color(0xFF05050A);
  static const tund = Color(0xFF0F0A14);
  static const qirmizi = Color(0xFFC62828);
  static const qirmiziParlaq = Color(0xFFE53935);
  static const qizil = Color(0xFFFFD700);
  static const qizilParlaq = Color(0xFFFFEB3B);
  static const benovseyi = Color(0xFF8E24AA);
  static const mavi = Color(0xFF1E88E5);
  static const yasil = Color(0xFF43A047);
  static const ag = Colors.white;
  static const boz = Color(0xFF9E9E9E);

  static const gradientQirmizi = LinearGradient(
    begin: Alignment.topLeft, end: Alignment.bottomRight,
    colors: [Color(0xFF3A0808), Color(0xFF0F0A14)],
  );
  static const gradientQizil = LinearGradient(
    begin: Alignment.topLeft, end: Alignment.bottomRight,
    colors: [Color(0xFF3A2E08), Color(0xFF0F0A14)],
  );
  static const gradientBenovseyi = LinearGradient(
    begin: Alignment.topLeft, end: Alignment.bottomRight,
    colors: [Color(0xFF2A0A3A), Color(0xFF0F0A14)],
  );
  static const gradientMavi = LinearGradient(
    begin: Alignment.topLeft, end: Alignment.bottomRight,
    colors: [Color(0xFF0A1F3A), Color(0xFF0F0A14)],
  );

  static LinearGradient dinamik(Color esas) => LinearGradient(
    begin: Alignment.topLeft, end: Alignment.bottomRight,
    colors: [esas.withOpacity(0.35), qara],
  );
}

// ═══════════════════════════════════════════════════
// 2. ULDÚZLAR + AY ARXA FONU (animasiyalı)
// ═══════════════════════════════════════════════════
class UlduzluArxaFon extends StatefulWidget {
  final Widget child;
  const UlduzluArxaFon({super.key, required this.child});
  @override
  State<UlduzluArxaFon> createState() => _UlduzluArxaFonState();
}

class _UlduzluArxaFonState extends State<UlduzluArxaFon> with SingleTickerProviderStateMixin {
  late AnimationController _c;
  final List<_Ulduz> _ulduzlar = [];
  final Random _r = Random(42);

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(seconds: 8))..repeat();
    for (int i = 0; i < 60; i++) {
      _ulduzlar.add(_Ulduz(
        x: _r.nextDouble(),
        y: _r.nextDouble(),
        size: _r.nextDouble() * 2.5 + 0.5,
        tezlik: _r.nextDouble() * 0.5 + 0.3,
        gecikme: _r.nextDouble(),
      ));
    }
  }

  @override
  void dispose() { _c.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(color: Reng.qara),
      Positioned.fill(child: AnimatedBuilder(
        animation: _c,
        builder: (_, __) => CustomPaint(painter: _GöyPainter(_ulduzlar, _c.value)),
      )),
      widget.child,
    ]);
  }
}

class _Ulduz {
  final double x, y, size, tezlik, gecikme;
  _Ulduz({required this.x, required this.y, required this.size, required this.tezlik, required this.gecikme});
}

class _GöyPainter extends CustomPainter {
  final List<_Ulduz> ulduzlar;
  final double t;
  _GöyPainter(this.ulduzlar, this.t);

  @override
  void paint(Canvas canvas, Size s) {
    // Ay (sağ üstdə, parlayan)
    final ayX = s.width * 0.85;
    final ayY = s.height * 0.15;
    final ayR = 55.0;

    // Ay halo (parıltı)
    for (int i = 3; i > 0; i--) {
      canvas.drawCircle(
        Offset(ayX, ayY), ayR + i * 15,
        Paint()..color = Reng.qizil.withOpacity(0.04 * (4 - i) * (0.7 + 0.3 * sin(t * 2 * pi))),
      );
    }
    // Ay gövdəsi
    canvas.drawCircle(Offset(ayX, ayY), ayR,
      Paint()..shader = RadialGradient(colors: [
        Reng.qizilParlaq.withOpacity(0.95),
        Reng.qizil.withOpacity(0.7),
        Reng.qizil.withOpacity(0.1),
      ]).createShader(Rect.fromCircle(center: Offset(ayX, ayY), radius: ayR)));

    // Ulduzlar (parlayan)
    final paint = Paint()..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.5);
    for (var u in ulduzlar) {
      double p = (sin((t * 2 * pi) * u.tezlik + u.gecikme * 2 * pi) + 1) / 2;
      paint.color = Reng.ag.withOpacity(0.2 + p * 0.7);
      canvas.drawCircle(Offset(u.x * s.width, u.y * s.height), u.size * (0.6 + p * 0.6), paint);
    }
  }

  @override
  bool shouldRepaint(_) => true;
}

// ═══════════════════════════════════════════════════
// 3. SUNGUR QUŞU (QANAD ÇALAN + ÜZƏN)
// ═══════════════════════════════════════════════════
class SungurQusu extends StatefulWidget {
  final double size;
  final Color reng;
  const SungurQusu({super.key, this.size = 120, this.reng = Reng.qirmizi});
  @override
  State<SungurQusu> createState() => _SungurQusuState();
}

class _SungurQusuState extends State<SungurQusu> with TickerProviderStateMixin {
  late AnimationController _qanad, _suzme;

  @override
  void initState() {
    super.initState();
    _qanad = AnimationController(vsync: this, duration: const Duration(milliseconds: 800))..repeat(reverse: true);
    _suzme = AnimationController(vsync: this, duration: const Duration(seconds: 3))..repeat(reverse: true);
  }

  @override
  void dispose() { _qanad.dispose(); _suzme.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_qanad, _suzme]),
      builder: (_, __) {
        double y = sin(_suzme.value * 2 * pi) * 6;
        return Transform.translate(
          offset: Offset(0, y),
          child: CustomPaint(
            size: Size(widget.size, widget.size),
            painter: _SungurPainter(widget.reng, _qanad.value),
          ),
        );
      },
    );
  }
}

class _SungurPainter extends CustomPainter {
  final Color reng;
  final double qanad;
  _SungurPainter(this.reng, this.qanad);

  @override
  void paint(Canvas canvas, Size s) {
    final w = s.width, h = s.height;
    final cx = w / 2, cy = h / 2;

    // Parlama halo
    canvas.drawCircle(Offset(cx, cy), w * 0.45,
      Paint()..color = reng.withOpacity(0.06 + qanad * 0.06)
             ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 18));

    // Qanad açısı: 0.0 = aşağı, 1.0 = yuxarı
    double wingUp = qanad;        // 0-1
    double wingDown = 1 - qanad;  // 0-1

    final body = Paint()..color = reng..style = PaintingStyle.fill;
    final wing = Paint()..color = reng.withOpacity(0.95)..style = PaintingStyle.fill;

    // Sol qanad
    Path sol = Path()
      ..moveTo(cx - 2, cy + 2)
      ..quadraticBezierTo(cx - 30, cy - 15 - wingUp * 22, cx - 50, cy - 30 - wingUp * 25)
      ..quadraticBezierTo(cx - 38, cy - 8 - wingUp * 12, cx - 22, cy + 8)
      ..quadraticBezierTo(cx - 30, cy + 2 + wingDown * 10, cx - 40, cy + 12 + wingDown * 15)
      ..quadraticBezierTo(cx - 22, cy + 8, cx - 2, cy + 2)
      ..close();
    canvas.drawPath(sol, wing);

    // Sağ qanad (güzgü)
    Path sag = Path()
      ..moveTo(cx + 2, cy + 2)
      ..quadraticBezierTo(cx + 30, cy - 15 - wingUp * 22, cx + 50, cy - 30 - wingUp * 25)
      ..quadraticBezierTo(cx + 38, cy - 8 - wingUp * 12, cx + 22, cy + 8)
      ..quadraticBezierTo(cx + 30, cy + 2 + wingDown * 10, cx + 40, cy + 12 + wingDown * 15)
      ..quadraticBezierTo(cx + 22, cy + 8, cx + 2, cy + 2)
      ..close();
    canvas.drawPath(sag, wing);

    // Bədən (quş silueti)
    Path body_ = Path()
      ..moveTo(cx, cy - 22)                    // baş
      ..quadraticBezierTo(cx + 6, cy - 8, cx + 4, cy + 5)   // sağ boyun
      ..quadraticBezierTo(cx + 8, cy + 20, cx + 2, cy + 35) // sağ bədən
      ..quadraticBezierTo(cx, cy + 30, cx - 2, cy + 35)     // quyruq
      ..quadraticBezierTo(cx - 8, cy + 20, cx - 4, cy + 5)  // sol bədən
      ..quadraticBezierTo(cx - 6, cy - 8, cx, cy - 22)      // sol boyun
      ..close();
    canvas.drawPath(body_, body);

    // Baş (dairə)
    canvas.drawCircle(Offset(cx, cy - 24), 6, body);

    // Göz (ağ)
    canvas.drawCircle(Offset(cx + 2, cy - 25), 1.5, Paint()..color = Colors.white);

    // Halo dairə (baş üstündə)
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy - 38), radius: 14),
      pi * 0.15, pi * 0.7, false,
      Paint()..color = reng.withOpacity(0.6)
             ..style = PaintingStyle.stroke
             ..strokeWidth = 2.5
             ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(_) => true;
}

// ═══════════════════════════════════════════════════
// 4. GLASSMORPHISM KART
// ═══════════════════════════════════════════════════
class ShusheKart extends StatelessWidget {
  final Widget child;
  final Color reng;
  final EdgeInsets padding;
  final double radius;
  const ShusheKart({
    super.key, required this.child,
    this.reng = Reng.qirmizi,
    this.padding = const EdgeInsets.all(16),
    this.radius = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft, end: Alignment.bottomRight,
          colors: [reng.withOpacity(0.15), reng.withOpacity(0.03)],
        ),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: reng.withOpacity(0.35), width: 1.2),
        boxShadow: [
          BoxShadow(color: reng.withOpacity(0.15), blurRadius: 20, spreadRadius: 1),
          BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: child,
    );
  }
}

// ═══════════════════════════════════════════════════
// 5. SPLASH ANİMASİYASI
// ═══════════════════════════════════════════════════
class SplashAnimasiya extends StatefulWidget {
  final VoidCallback? bitdi;
  const SplashAnimasiya({super.key, this.bitdi});
  @override
  State<SplashAnimasiya> createState() => _SplashAnimasiyaState();
}

class _SplashAnimasiyaState extends State<SplashAnimasiya> with SingleTickerProviderStateMixin {
  late AnimationController _c;
  late Animation<double> _fade, _scale;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800))..forward();
    _fade = CurvedAnimation(parent: _c, curve: const Interval(0, 0.6, curve: Curves.easeOut));
    _scale = Tween(begin: 0.6, end: 1.0).animate(CurvedAnimation(parent: _c, curve: Curves.easeOutBack));
    _c.addStatusListener((st) { if (st == AnimationStatus.completed) widget.bitdi?.call(); });
  }

  @override
  void dispose() { _c.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return UlduzluArxaFon(child: Center(
      child: FadeTransition(opacity: _fade, child: ScaleTransition(scale: _scale, child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SungurQusu(size: 160, reng: Reng.qirmizi),
          const SizedBox(height: 24),
          Text('SUNGUR', style: TextStyle(
            color: Reng.qirmizi, fontSize: 38, fontWeight: FontWeight.bold, letterSpacing: 8,
            shadows: [Shadow(color: Reng.qirmizi.withOpacity(0.8), blurRadius: 20)],
          )),
          const SizedBox(height: 6),
          const Text('M Y S T I C', style: TextStyle(color: Reng.qizil, fontSize: 14, letterSpacing: 12)),
        ],
      ))),
    ));
  }
}

// ═══════════════════════════════════════════════════
// 6. BOTTOM NAVIGATION
// ═══════════════════════════════════════════════════
class AltMenyu extends StatelessWidget {
  final int secili;
  final Function(int) deyis;
  final List<Map<String, dynamic>> items;
  const AltMenyu({super.key, required this.secili, required this.deyis, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter, end: Alignment.bottomCenter,
          colors: [Color(0xFF0F0A14), Color(0xFF05050A)],
        ),
        border: Border(top: BorderSide(color: Reng.qirmizi.withOpacity(0.3), width: 1)),
        boxShadow: [BoxShadow(color: Reng.qirmizi.withOpacity(0.15), blurRadius: 25, offset: const Offset(0, -4))],
      ),
      child: SafeArea(top: false, child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (i) {
          bool s = i == secili;
          return GestureDetector(
            onTap: () => deyis(i),
            behavior: HitTestBehavior.opaque,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Icon(items[i]['ikon'], color: s ? Reng.qirmizi : Reng.boz, size: s ? 26 : 22),
                const SizedBox(height: 3),
                Text(items[i]['ad'], style: TextStyle(
                  color: s ? Reng.qirmizi : Reng.boz,
                  fontSize: 10,
                  fontWeight: s ? FontWeight.bold : FontWeight.normal,
                )),
                if (s) Container(
                  margin: const EdgeInsets.only(top: 3),
                  width: 4, height: 4,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Reng.qirmizi,
                    boxShadow: [BoxShadow(color: Reng.qirmizi, blurRadius: 6)]),
                ),
              ]),
            ),
          );
        }),
      )),
    );
  }
}
