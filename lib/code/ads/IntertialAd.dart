import 'package:calculatorbac/code/ads/AdHelper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
class IntertialAdontap{
  static InterstitialAd? interstitialAd;
  static bool isInterstitialAdReady = false;
  static void LoadIntertialAd(){
    InterstitialAd.load(
      adUnitId: AdHelper.bottomsheetInterstitialAdId, 
      request: AdRequest(), 
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad){
          interstitialAd = ad;
          isInterstitialAdReady = true;
        }, 
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
          isInterstitialAdReady = false;
        },
      ),
    );
  }
}