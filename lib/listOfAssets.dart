import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String dice1 = "Assets/dice_1.jpeg";
const String dice2 = "Assets/dice_2.jpeg";
const String dice3 = "Assets/dice_3.jpeg";
const String dice4 = "Assets/dice_4.jpeg";
const String dice5 = "Assets/dice_5.jpeg";
const String dice6 = "Assets/dice_6.jpeg";
const String play = "Assets/play.svg";
const String pause = "Assets/pause.svg";
const String replay = "Assets/replay.svg";
var countLoose=0,countWin=0,totalTry=0,tempCountWin=0,tempLeft=0;
String result="Processing";
String current_picture = dice2;
const TextStyle textStyle = TextStyle(fontSize: 20,color: Colors.indigo,fontWeight: FontWeight.bold);
const TextStyle winStyle = TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold);
const TextStyle looseStyle = TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold);
const TextStyle forUserStyle = TextStyle(fontSize: 18,color: Colors.black,);
const TextStyle question = TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold);
const TextStyle totalTryStyle = TextStyle(fontSize: 18,color: Colors.orange,fontWeight: FontWeight.bold);