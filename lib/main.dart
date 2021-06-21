import 'package:rolling_dice/rolling.dart';
import 'package:rolling_dice/user_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: usercchoice(),
      debugShowCheckedModeBanner: false,
      routes: {
        rolling.routename:(context)=>usercchoice(),
      },
    );
  }
}
