import 'dart:io';
import 'package:rolling_dice/listOfAssets.dart';
import 'package:rolling_dice/rolling.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class usercchoice extends StatefulWidget {
  @override
  _usercchoiceState createState() => _usercchoiceState();
}

class _usercchoiceState extends State<usercchoice> {
  TextEditingController choiceNumber = TextEditingController();
  TextEditingController choiceTimes = TextEditingController();
  var MaxHeight, MaxWidth;

  AppBar myAppBar = AppBar(
    backgroundColor: Colors.indigo,
    centerTitle: true,
    title: Text("Let's Play The Game"),
    elevation: 4,
    automaticallyImplyLeading: false,
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () => exit(9),
      child: Scaffold(
        appBar: myAppBar,
        backgroundColor: Colors.white.withOpacity(0.9),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              // height: MaxHeight,
              // width: MaxWidth,
              margin: EdgeInsets.all((size.height+size.width)* 0.021),
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Guess a number between 1 to 6",
                      style: question,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black87.withOpacity(0.2),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all((size.width+size.height)*0.015),
                        hintText: "Enter Your Number",
                        hintStyle: forUserStyle,
                        fillColor: Colors.black,
                      ),
                      keyboardType: TextInputType.number,
                      controller: choiceNumber,
                    ),
                  ),
                  SizedBox(height: size.height * 0.04,),
                  Text(
                    "How many times you want to try to get your number",
                    style: question,
                  ),
                  SizedBox(height: size.height * 0.04,),
                  Container(
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black87.withOpacity(0.2),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter number",
                        contentPadding: EdgeInsets.all((size.width+size.height)*0.015),
                        hintStyle: forUserStyle,
                        fillColor: Colors.black,
                      ),
                      keyboardType: TextInputType.number,
                      controller: choiceTimes,
                    ),
                  ),
                  SizedBox(height: size.height * 0.04,),
                  Container(
                    height: size.height * 0.07,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FlatButton(
                          child: Text("Let's Go",style: TextStyle(fontSize: 20),),
                          color: Colors.indigo,
                          onPressed: () {
                            if (choiceTimes.text.toString() != null &&
                                choiceNumber.text.toString() != null &&
                                int.parse(choiceNumber.text.toString()) < 7 &&
                                int.parse(choiceNumber.text.toString()) > 0 &&
                                int.parse(choiceTimes.text.toString()) > 0) {
                              tempCountWin =
                                  int.parse(choiceNumber.text.toString());
                              tempLeft =
                                  totalTry = int.parse(choiceTimes.text.toString());
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (x) => rolling()));
                            } else {
                              print("Error");
                            }
                          }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
