import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'AdHelper.dart';
class AdBanner extends StatefulWidget {

  @override
  State<AdBanner> createState() => _AdBannerState();
}

class _AdBannerState extends State<AdBanner> {
  late BannerAd bannerAd;
  bool _isAdReady = false;
  final AdSize _adSize = AdSize.banner;
  void _creatBannerAd(){
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdHelper.bannerAdUnitedId,
        listener: BannerAdListener(
          onAdLoaded: (ad){
            setState(() {
              _isAdReady = true;
            });
          }
        ),
        request: AdRequest(),
    );
    bannerAd.load();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _creatBannerAd();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(_isAdReady){
      return Container(
        alignment: Alignment.center,
        width:_adSize.width.toDouble() ,
        height: _adSize.height.toDouble(),
        child: AdWidget(ad: bannerAd),
      );
    }
    return Container(
      width: 0,
      height: 0,
    );
  }
}
