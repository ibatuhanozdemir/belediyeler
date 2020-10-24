import 'package:firebase_admob/firebase_admob.dart';


class AdvertService{
    MobileAdTargetingInfo _targetingInfo;

    showIntersitial(){
      InterstitialAd interstitialAd=InterstitialAd(

        adUnitId: InterstitialAd.testAdUnitId, targetingInfo: _targetingInfo);
      print('çalıştı');
      interstitialAd
        ..load()
        ..show();
      interstitialAd.dispose();

    }









}