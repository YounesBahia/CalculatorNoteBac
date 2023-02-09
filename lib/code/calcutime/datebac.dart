import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../ads/AdBanner.dart';

class TimeBac extends StatefulWidget {

  @override
  State<TimeBac> createState() => _TimeBacState();
}

class _TimeBacState extends State<TimeBac> {
  DateTime date1 = DateTime.now();
  DateTime date2 = DateTime.parse("2023-06-22");
  late int _calcu = date2.difference(date1).inDays;
  late double _persent = (_calcu/365);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
          'الوقت المتبقي للامتحان البكالوريا',
          style: GoogleFonts.cairo(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Container(
          child:CircularPercentIndicator(
            radius: 150,
            percent: _persent,
            lineWidth: 30,
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.deepOrange,
            animation: true,
            animationDuration: 1000,
            center: Text(
              '$_calcu يوم',
              style: GoogleFonts.cairo(
                color:Colors.black,
                fontSize: 40,
              ),
            ),

          ) ,
        ),
      ),
    );
  }
}