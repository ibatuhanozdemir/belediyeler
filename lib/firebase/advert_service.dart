

import 'package:firebase_admob/firebase_admob.dart';


class AdvertService{
    MobileAdTargetingInfo _targetingInfo;

    showIntersitialandroid(){
      InterstitialAd interstitialAd=InterstitialAd(

        adUnitId: "ca-app-pub-2522612173818145~7203139389", targetingInfo: _targetingInfo);
      print('çalıştı');
      interstitialAd
        ..load()
        ..show();
      interstitialAd.dispose();

    }

    showIntersitialIos(){
      InterstitialAd interstitialAd=InterstitialAd(

          adUnitId: "ca-app-pub-2522612173818145~3573233173", targetingInfo: _targetingInfo);
      print('çalıştı');
      interstitialAd
        ..load()
        ..show();
      interstitialAd.dispose();

    }







}