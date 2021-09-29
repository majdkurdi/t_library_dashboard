import 'package:flutter/material.dart';
import './screens/welcome_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Color(0xFF363636),
          accentColor: Color(0xFF800000),
          backgroundColor: Colors.black,
          textTheme: TextTheme(
            headline6: TextStyle(color: Colors.white, fontFamily: 'Sego'),
          )),
      home: LoginScreen(),
    );
  }
}
