import 'package:calculatorbac/code/HomePage.dart';
import 'package:calculatorbac/code/Splash.dart';
import 'package:calculatorbac/code/calcuPointbac/pointbac.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'code/calcuPointbac/calcupointcontinue.dart';
import 'code/calcubranche/letter/ScienceHumain.dart';
import 'code/calcubranche/letter/adab.dart';
import 'code/calcubranche/math.dart';
import 'code/calcubranche/pc.dart';
import 'code/calcubranche/svt.dart';
import 'code/calcutime/datebac.dart';
void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' :(context) => Splash(),
        '/homepage' :(context) => HomePage(),
        '/calcuPintbac' :(context) => CalcuPointBac(),
        '/calcupiontcontinue':(context) => CalcuPointContinue(),
        '/timebac' :(context) => TimeBac(),
        //url branche SN
        '/svt':(context) => Svt(), 
        '/pc' : (context) =>Pc(),
        '/math':(context) => Math(),
        // url branche AD
        '/adab' : (context) =>Adab(),
        '/science':(context) => ScienceHumain(),
      },
      localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: [
    Locale('ar', 'AE'), // English, no country code
  ],
    ),
  );
}