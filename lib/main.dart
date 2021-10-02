import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import './screens/login_screen.dart';
import './screens/welcome_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'Sego',
          primaryColor: Color(0xFF363636),
          accentColor: Color(0xFF800000),
          backgroundColor: Colors.black,
          cardColor: Colors.grey[200],
          textTheme: TextTheme(
            headline6: TextStyle(color: Colors.white, fontFamily: 'Sego'),
          )),
      home: WelcomeScreen(),
    );
  }
}
