import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ads/AdBanner.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Adab extends StatefulWidget {

  @override
  State<Adab> createState() => _Adab();
}

class _Adab extends State<Adab> {
  List Total = [0,0,0,0,0,0,0,0,0,0,0];
  late int Totalecoefficient = 26;
  late double GrandTotal = 0,Generaltotale=0;


  // creat variable controller 
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();
  TextEditingController _controller5 = TextEditingController();
  TextEditingController _controller6 = TextEditingController();
  TextEditingController _controller7 = TextEditingController();
  TextEditingController _controller8 = TextEditingController();
  TextEditingController _controller9 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'الاداب',
          style: GoogleFonts.cairo(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),

      body: Container(
        color: Colors.grey.shade200,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Bar(),
              Formtext(),
              Form('العربية',4,0,_controller1),
              Form('اللغة الفرنسية',4,1,_controller2),
              Form('اللغة الاجنبية التانية', 4, 2,_controller3),
              Form('التاريخ و الجغرافية', 3, 3,_controller4),
              Form('الفلسفة', 3, 4,_controller5),
              Form('التربية الاسلامية', 2, 5,_controller6),
              Form('الرياضيات', 1, 6,_controller7),
              Form('التربية البدنية', 4, 8,_controller8),
              Form('المواضبة و السلوك', 1, 10,_controller9),
              
            ],
          ),
        ),
      ),
      bottomNavigationBar: AdBanner(),
    );
  }
  Widget Bar(){
    return Container(
              width: double.infinity,
              height:100,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Text(
                          'المعاملات',
                          style: GoogleFonts.cairo(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 18.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Text(
                            '$Totalecoefficient',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Text(
                          'المجموع العام',
                          style: GoogleFonts.cairo(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Text(
                            '$GrandTotal',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: Column(
                      children: [
                        Text(
                          'المعدل العام',
                          style: GoogleFonts.cairo(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Text(
                            '$Generaltotale',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
            ),
          );
  }
  Widget Formtext(){
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 150,
              child: Padding(
                padding: const EdgeInsets.only(right : 0.0),
                child: Text(
                  'المادة',
                  style: GoogleFonts.cairo(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
          ),
          Container(
            child: Text(
              'النقطة',
              style: GoogleFonts.cairo(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            child: Text(
              'المعامل',
              style: GoogleFonts.cairo(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            child: Text(
              'المجموع',
              style: GoogleFonts.cairo(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget Form(String Subject ,int coefficient,int key,TextEditingController controller){
    late double point = 0;
    late double TotalModal=0;
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: double.infinity,
      height: 70,
      color: Colors.white,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 150,
              child: Padding(
                padding: const EdgeInsets.only(right : 8.0),
                child: Text(
                  '$Subject',
                  style: GoogleFonts.cairo(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
          ),
          Container(
            width: 80,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 240, 240, 240),
              borderRadius: BorderRadius.circular(25)
            ),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
              keyboardType: TextInputType.number,
              controller: controller,
              onChanged: (value){
                setState(() {
                  if(value.length<1){
                    value = '0';
                    point = double.parse(value) ;
                    TotalModal = double.parse((point * coefficient).toStringAsFixed(2));
                    Total[key] = TotalModal;
                    GrandTotal=0;
                    for(int i=0;i<11;i++){
                      GrandTotal=GrandTotal+Total[i];
                    }
                    Generaltotale=GrandTotal/26;
                  }else{
                    point = double.parse(value) ;
                    if(point < 0 || point > 20){
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
                          value = '0';
                          point = double.parse(value) ;
                          TotalModal = double.parse((point * coefficient).toStringAsFixed(2));
                          Total[key] = TotalModal;
                          GrandTotal=0;
                          for(int i=0;i<11;i++){
                            GrandTotal=GrandTotal+Total[i];
                          }
                          Generaltotale=GrandTotal/26;
                      }else{
                        TotalModal = double.parse((point * coefficient).toStringAsFixed(2));
                        Total[key] = TotalModal;
                        GrandTotal=0;
                        for(int i=0;i<11;i++){
                          GrandTotal=double.parse((GrandTotal+Total[i]).toStringAsFixed(2));
                        }
                        Generaltotale=double.parse((GrandTotal/26).toStringAsFixed(2));
                      }
                  }
                });
              },
            ),
          ),
          Container(
            width: 80,
            child: Center(
              child: Text(
                '$coefficient',
                style: GoogleFonts.cairo(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),Container(
            width: 80,
            child: Center(
              child: Text(
                '${Total[key]}',
                style: GoogleFonts.cairo(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}