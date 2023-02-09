
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ads/IntertialAd.dart';
import 'ads/AdBanner.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.transparent,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Image.asset('assets/Welcome.png',width: 300,height: 300,),
                ),
                Button('حساب نقطة البكالوريا','/calcuPintbac'),
                SizedBox(height: 10,),
                Button('حساب نقطة المراقبة','/calcupiontcontinue'),
                SizedBox(height: 10,),
                Button('الوقت المتبقي للامتحان','/timebac'),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        
      ),
      bottomNavigationBar: AdBanner(),
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