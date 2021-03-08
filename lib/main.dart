import 'package:flutter/material.dart';
import 'package:parkingapp/UI/Login/Login_pagues.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ParkinUpvt',
      home: LoginPagues(),
    );
  }
}
