import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ads/IntertialAd.dart';
import '../ads/AdBanner.dart';

class CalcuPointContinue extends StatefulWidget {

  @override
  State<CalcuPointContinue> createState() => _CalcuPointContinueState();
}

class _CalcuPointContinueState extends State<CalcuPointContinue> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      IntertialAdontap.LoadIntertialAd();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text(
          'حساب نقطة المراقبة',
          style: GoogleFonts.cairo(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Button('علوم الحياة والارض', '/svt'),
                SizedBox(height: 10,),
                Button('علوم الفزيائية', '/pc'),
                SizedBox(height: 10,),
                Button('علوم الرياضية', '/math'),
                SizedBox(height: 10,),
                Button('الاداب', '/adab'),
                SizedBox(height: 10,),
                Button('علوم الانسانية', '/science'),
                SizedBox(height: 10,),
              ],
            ),
        ),
      ),
    );
  }
  Widget Button(String text,String urlpage){
    return GestureDetector(
      onTap: (){
        if(IntertialAdontap.isInterstitialAdReady){
          IntertialAdontap.interstitialAd?.show();
          Navigator.of(context).pushNamed(urlpage);
        }else{
          Navigator.of(context).pushNamed(urlpage);
        }
      },
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.cairo(
                fontSize:22,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}