import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:core';
import 'dart:io';
import 'dart:math';



void main()=> runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ada(),

    );
  }
}

class ada extends StatefulWidget {

  @override
  State<ada> createState() => _adaState();


}
class _adaState extends State<ada> {

  TextEditingController inputcontroller1= new TextEditingController();
  TextEditingController inputcontroller2= new TextEditingController();
  String text1="";
  String text2="";
   double _percent=0;
   double number=0;

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text( "Plagiarism Checker" , style: TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.italic,
          color: Colors.white,
        ),),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: 20,
            // ),
            // TextField(
            //   style: TextStyle(
            //     color: Colors.white
            //
            //   ),
            //
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            Container(
              // padding: EdgeInsets.all(10),
              height: _mediaQuery.height*(0.25),
              width: _mediaQuery.width*(0.85),
              child: Container(
                child: TextField(
                  maxLines: null,
                  minLines: null,
                  expands: true,
                  controller: inputcontroller1,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "type here"
                  ),
                ),
                margin:EdgeInsets.fromLTRB(20, 10, 20, 10),
              ),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),

                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              // padding: EdgeInsets.all(10),
              height: _mediaQuery.height*(0.25),
              width: _mediaQuery.width*(0.85),
              child: Container(
                child: TextField(
                  maxLines: null,
                  minLines: null,
                  expands: true,
                  controller: inputcontroller2,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "type here"
                  ),
                ),
                margin:EdgeInsets.fromLTRB(20, 10, 20, 10),
              ),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),

                color: Colors.white,
              ),
            ),

            SizedBox(
              height: 20,
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                     text1=inputcontroller1.text;
                     text2=inputcontroller2.text;
                    if( text1==null)
                      {
                        text1='';
                      }
                    if( text2==null)
                      {
                        text2=='';
                      }
                    _percent=run( text1,text2);
                     number= _percent*100;
                });
              },
              child: Text(
                "Check now", style: TextStyle(
                  color: Colors.white
              ),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(250,50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  primary: Colors.blueAccent
              ),

            ),

            // Container(
            //     height: 50,
            //     width: 250,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20),
            //       color: Colors.blueAccent,
            //     ),
            //     alignment: Alignment.center,
            //     child: ElevatedButton(
            //       onPressed: () {  },
            //       child: Text(
            //          "Check now", style: TextStyle(
            //            color: Colors.white
            //        ),
            //       ),
            //       style: ElevatedButton.styleFrom(
            //         minimumSize: Size(250,50),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(20),
            //         ),
            //         primary: Colors.blueAccent
            //       ),
            //
            //     ),
            //
            //
            // ),
            SizedBox(
              height: 40,
            ),
            // CircularPercentIndicator(
            //   radius: 100,
            //   lineWidth: 20,
            //   animation: true,
            //   // lineHeight: 40,
            //   // width: 200,
            //   percent: 0.3,
            //   progressColor: Colors.blueAccent,
            //   circularStrokeCap: CircularStrokeCap.round,
            //   // alignment: MainAxisAlignment.center,
            //   backgroundColor: Colors.blueAccent.shade100,
            //   animationDuration: 1000,
            // ),
            LinearPercentIndicator(
              restartAnimation: false,
              animation: true,
              lineHeight: 50,
              center: Text(
                '$number%', style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
              ),
              width: 220,
              percent: _percent,
              progressColor: Colors.blueAccent,
              alignment: MainAxisAlignment.center,
              backgroundColor: Colors.blueAccent.shade100,
              animationDuration: 1000,

            ),

            SizedBox(
              height: 20,
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  text1=' ';
                  text2=' ';
                  inputcontroller1.clear();
                  inputcontroller2.clear();
                  if( text1==null)
                  {
                    text1=' ';
                  }
                  if( text2==null)
                  {
                    text2==' ';
                  }
                  _percent=0;
                  number=0;
                });
              },
              child: Text(
                "Reset", style: TextStyle(
                  color: Colors.white
              ),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(150,25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  primary: Colors.blueAccent
              ),

            ),
/*
            Text('$text1',style: TextStyle(fontSize: 10, color: Colors.white),),
            SizedBox(
              height: 5,
            ),
            Text('$text2',style: TextStyle(fontSize: 10, color: Colors.white),)*/
          ],
        ),
      ),
    );
  }
}

int max(int a, int b) {
  if (a >= b) {
    return a;
  } else {
    return b;
  }
}

double roundDouble(double value, int places){
  num mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}

int solve(List<String> v1, List<String> v2, int i, int j) {
  int n = v1.length;
  int m = v2.length;

  int ct = 0;
  while (i < n && j < m && v1[i] == v2[j]) {
    ct = ct + 1;
    i = i + 1;
    j = j + 1;
  }

  return ct;
}

double run( String s1 , String s2) {
  var str1;
  var str2;

  str1 = s1;
  str2 = s2;

  int n = str1.length;
  int m = str2.length;

  List<String> v1 = [];
  List<String> v2 = [];

  var curr = "";
  var prev = ' ';

  for (int i = 0; i < n; i++) {
    if (str1[i] != ' ') {
      curr = curr + str1[i];
    } else if (prev != ' ') {
      v1.add(curr);
      curr = "";
    }

    prev = str1[i];
  }

  v1.add(curr);

  curr = "";
  prev = ' ';

  for (int i = 0; i < m; i++) {
    if (str2[i] != ' ') {
      curr = curr + str2[i];
    } else if (prev != ' ') {
      v2.add(curr);
      curr = "";
    }

    prev = str2[i];
  }
  v2.add(curr);

  double len = 0;
  double total_len = 0;
  for (int i = 0; i < v1.length; i++) {
    int res = 0;
    for (int j = 0; j < v2.length; j++) {
      if (v1[i] == v2[j]) {
        res = max(res, solve(v1, v2, i, j));
      }
    }
    if (res > 3) {
      // print(i);
      // print(i + res - 1);
      for (int k = i; k <= i + res - 1; k++) {
        len = len + v1[k].length;
      }
      i = i + (res - 1);
    }
  }

  for (int i = 0; i < v1.length; i++) {
    total_len = total_len + v1[i].length;
  }

  double plag = (len / total_len);
  // print("the plagarism % is");
  // print("$plag");

  double ans= roundDouble(plag, 3);
  return ans;
}

