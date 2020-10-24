import 'package:firebase_admob/firebase_admob.dart';

class AdvertService {
  static final AdvertService _instance = AdvertService._internal();
  factory AdvertService() => _instance;
  MobileAdTargetingInfo _targetInfo;

  final String _bannerAd = "ca-app-pub-5718815122578206/8645160714";
  final String _gecisAd = "ca-app-pub-5718815122578206/8903540389";
  AdvertService._internal() {
    _targetInfo = MobileAdTargetingInfo();
  }

  showBanner() {
    BannerAd banner = BannerAd(
        adUnitId: _bannerAd,
        size: AdSize.smartBanner,
        targetingInfo: _targetInfo);
    banner
      ..load()
      ..show(anchorOffset: 10);
    banner.dispose();
  }

  showIntersitial() {
    InterstitialAd interstitialAd =
        InterstitialAd(adUnitId: _gecisAd, targetingInfo: _targetInfo);
    interstitialAd
      ..load()
      ..show();
    interstitialAd.dispose();
  }
}
