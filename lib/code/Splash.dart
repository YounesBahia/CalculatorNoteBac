import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState(){
    startTimer();
    super.initState();
  }
  startTimer(){
    var duration = Duration(seconds:5);
    return Timer(duration, route);
  }

  route(){
    Navigator.of(context).pushReplacementNamed('/homepage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/Calculator-bro.png"),
              Text(
                'حساب النقط البكالوريا',
                style:GoogleFonts.cairo(
                  fontSize: 30,
                ),
                
              )
            ]
          ),
        ),
      ),
    );
  }
}