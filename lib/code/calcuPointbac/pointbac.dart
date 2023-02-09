import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ads/IntertialAd.dart';
import '../ads/AdBanner.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CalcuPointBac extends StatefulWidget {

  @override
  State<CalcuPointBac> createState() => _CalcuPointBacState();
}

class _CalcuPointBacState extends State<CalcuPointBac> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();


  late double controle = 0.0;
  late double regionale = 0.0;
  late double nationale = 0.0;
  late double totale = 0;
  late String text ='',feature='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      IntertialAdontap.LoadIntertialAd();
    });
  }


  total(){
    setState(() {
      controle = double.parse(_controller1.text)*25;
      regionale = double.parse(_controller2.text)*25;
      nationale = double.parse(_controller3.text)*50;
      totale =double.parse(((controle + regionale +nationale)/100).toStringAsFixed(2));
      text = totale.toString();
      if(totale >=0.00 && totale<=6.99){
        feature = "سقوط الى العام المقبل";
      }else if(totale >= 7 && totale <=9.99){
        feature = "الاستدراكية";
      }else if(totale >=10.00 && totale<=11.99){
        feature = 'ناجح ميزة مقبول';
      }else if(totale >= 12.00 && totale <13.99){
        feature = "ناجح بميزة مستحسن ";
      }else if(totale >= 14.00 && totale <=15.99){
        feature ="ناجح بميزة حسن";
      }else if(totale >= 16.00 && totale <=20.00){
        feature =" ناجح بميزة حسن جدا";
      }
      
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'حساب نقطة البكالوريا',
          style: GoogleFonts.cairo(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InputForm('نقطة المراقبة المستمرة',_controller1),
            InputForm('نقطة الجهوي', _controller2),
            InputForm('نقطة الوطني', _controller3),
            SizedBox(height: 40,),
            Button(),
          ],
        ),
      ),
      bottomNavigationBar: AdBanner(),
        
    );
  }
  Widget InputForm(String title,TextEditingController controller){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: GoogleFonts.cairo(
                fontSize: 20,
              ),
            ),
          ),
        ),
        SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.only(left : 15.0,right: 15.0),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
              border: Border(
                bottom: BorderSide(color: Colors.black,width:2),
                top: BorderSide(color: Colors.black,width: 2),
                left: BorderSide(color: Colors.black,width: 2),
                right: BorderSide(color: Colors.black,width: 2),
              ),

            ),
            child: Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: TextField(
                controller: controller,
                maxLines: 1,
                textAlign: TextAlign.center,
                onChanged: ((value) {
                  setState(() {
                    if(value == ''){
                      value = '0';
                      late double va = double.parse(value);

                    }else{ 
                      late double va = double.parse(value);
                      if(va < 0 || va > 20){
                        Fluttertoast.showToast(
                              msg: "المرجو ادخال رقم بين 0 و  20",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 5,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 20.0
                          );
                          controller.clear();
                      }
                    }
                  });
                }),
                decoration:InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: title,
                  hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 25),
                ),
                keyboardType:TextInputType.number ,
                style: TextStyle(color: Colors.black,fontSize: 30),
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget Button(){
    return GestureDetector(
      onTap: (){
        if(IntertialAdontap.isInterstitialAdReady){
          IntertialAdontap.interstitialAd?.show();
        }
        setState(() {
          total();
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            context: context, 
            builder:(BuildContext context){
              return Container(
                height: 200,
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Text(
                      'المعدل العام : $text',
                      style: GoogleFonts.cairo(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      feature,
                      style: GoogleFonts.cairo(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    

                  ],
                ),
              );
            }, 
          );
        });

      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(247, 127, 11,1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'المعدل العام ',
            style:GoogleFonts.cairo(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
  
  
}