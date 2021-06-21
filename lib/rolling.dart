import 'dart:math';

import 'package:rolling_dice/listOfAssets.dart';
import 'package:rolling_dice/user_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class rolling extends StatefulWidget {
  static const String routename = '/rolling';
  @override
  _rollingState createState() => _rollingState();
}

class _rollingState extends State<rolling> {
  Future<bool> ?onWillPop;
  String current_button = play;
  var number, temp, num, height, width;
  String status = "Please Roll On";
  AppBar myAppBar = AppBar(
    title: Text("Roll The Dice"),
    centerTitle: true,
    backgroundColor: Colors.deepPurple,
    automaticallyImplyLeading: false,
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: myAppBar,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all((size.height+size.width)* 0.021),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // GestureDetector(
                  //   child: SvgPicture.asset(replay,height: 40,width: 40,),
                  //   onTap: ()
                  //   {
                  //       setState(() {
                  //         countLoose=0;countWin=0;status="Please Roll On";totalTry=tempLeft;
                  //         result = "Processing";
                  //       });
                  //   },
                  // ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: Container(
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(29),
                      color: Colors.teal.withOpacity(0.9)
                    ),
                    child: Image.asset(current_picture)),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                height: size.height* 0.07,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: FlatButton(
                    child: Text(
                      "Roll On",
                      style: TextStyle(color: Colors.black, fontSize: 19),
                    ),
                    color: Colors.indigoAccent,
                    onPressed: () {
                      setState(() {
                        afterOneTap();
                        if (tempCountWin == num) {
                          print("You Win");
                          result = "You Win, Wait";
                          Future.delayed(Duration(seconds: 1)).whenComplete(() {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (w) => usercchoice()));
                            result = "Processing";
                          });
                        }
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height:size.height*0.08,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .04,
                width: MediaQuery.of(context).size.width,
                //color: Colors.teal,
                child: Text(
                  "$status",
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(
                color: Colors.deepPurple,
                height: 10,
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Target", style: textStyle),
                  Text("Loose", style: textStyle),
                  Text("Left", style: textStyle),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("$tempCountWin", style: winStyle),
                    Text("$countLoose", style: looseStyle),
                    Text("$totalTry", style: totalTryStyle),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  void afterOneTap() {
    setState(() {
      totalTry--;
      if (totalTry == 0) {
        print("You Loose");
        result = "You Loose, Wait";
        Future.delayed(Duration(seconds: 1)).whenComplete(() {
          Navigator.push(
              context, MaterialPageRoute(builder: (w) => usercchoice()));
          result = "Processing";
        });
      } else {
        number = new Random();
        do {
          num = 1 + number.nextInt(7 - 1);
        } while (temp == num);
        print(num);
        switch (num) {
          case 1:
            current_picture = dice1;
            status = "You Loose, Try Again";
            countLoose++;
            break;
          case 2:
            current_picture = dice2;
            status = "You Loose, Try Again";
            countLoose++;
            break;
          case 3:
            current_picture = dice3;
            status = "You Loose, Try Again";
            countLoose++;
            break;
          case 4:
            current_picture = dice4;
            status = "You Loose, Try Again";
            countLoose++;
            break;
          case 5:
            current_picture = dice5;
            status = "You Loose, Try Again";
            countLoose++;
            break;
          case 6:
            current_picture = dice6;
            status = "You Win";
            countWin++;
            break;
        }
        temp = num;
      }
    });
  }
}
