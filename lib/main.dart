import 'package:flutter/material.dart';
import 'package:gerstore/screens/Login_Screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.lightBlueAccent
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
