// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// class AdMobViewModel extends ChangeNotifier {
//   final BannerAd myBanner = BannerAd(
//     adUnitId: Platform.isAndroid
//         ? 'ca-app-pub-8897722284194429/1728606561' // Android ad unit ID
//         : 'ca-app-pub-8897722284194429/4289252922', // iOS ad unit ID
//     size: AdSize.banner,
//     request: const AdRequest(),
//     listener: BannerAdListener(
//       onAdFailedToLoad: (ad, error) {
//         ad.dispose();
//       },
//     ),
//   );
//
//   void loadBanner() {
//     myBanner.load();
//   }
//
//   BannerAd showBanner() {
//     return myBanner;
//   }
//
//   void disposeBanner() {
//     myBanner.dispose();
//   }
// }