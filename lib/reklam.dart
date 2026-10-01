import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ReklamServisi {
  static BannerAd? _banner;
  static bool _hazir = false;

  static void baslat() {
    MobileAds.instance.initialize();
  }

  static BannerAd? bannerAl() {
    if (_hazir) return _banner;
    _banner = BannerAd(
      adUnitId: 'ca-app-pub-8968870467626631/5328719348',
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) { _hazir = true; },
        onAdFailedToLoad: (ad, err) { ad.dispose(); _banner = null; },
      ),
    )..load();
    return _banner;
  }
}

class BannerReklam extends StatefulWidget {
  const BannerReklam({super.key});
  @override
  State<BannerReklam> createState() => _BannerReklamState();
}

class _BannerReklamState extends State<BannerReklam> {
  BannerAd? _b;
  @override
  void initState() {
    super.initState();
    _b = ReklamServisi.bannerAl();
  }
  @override
  Widget build(BuildContext context) {
    if (_b == null) return const SizedBox.shrink();
    return Container(
      alignment: Alignment.center,
      width: _b!.size.width.toDouble(),
      height: _b!.size.height.toDouble(),
      child: AdWidget(ad: _b!),
    );
  }
}
