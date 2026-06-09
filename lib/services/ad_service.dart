import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// Servicio centralizado para anuncios de AdMob.
class AdService {
  // IDs de produccion (reemplazar si deseas IDs exclusivos por app/pais).
  static String get _bannerAdUnitId => Platform.isAndroid
      ? 'ca-app-pub-9670246345724768/8738883375'
      : 'ca-app-pub-3940256099942544/2934735716';

  static String get bannerAdUnitId => _bannerAdUnitId;

  static Future<void> initialize() async {
    try {
      await MobileAds.instance.initialize();
      debugPrint('AdMob inicializado correctamente');
    } catch (e) {
      debugPrint('Error al inicializar AdMob: $e');
    }
  }

  static BannerAd? createBannerAd({
    required void Function(Ad ad) onAdLoaded,
    required void Function(Ad ad, LoadAdError error) onAdFailedToLoad,
  }) {
    try {
      final banner = BannerAd(
        adUnitId: _bannerAdUnitId,
        size: AdSize.banner,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: onAdLoaded,
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            onAdFailedToLoad(ad, error);
          },
        ),
      );

      banner.load();
      return banner;
    } catch (e) {
      debugPrint('Error al crear banner: $e');
      return null;
    }
  }

  static void disposeBanner(BannerAd? banner) {
    banner?.dispose();
  }
}
