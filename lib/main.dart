import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t_library_dashboard/screens/main_screen.dart';
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
          iconTheme: IconThemeData(color: Colors.white),
          cardColor: Colors.grey[200],
          textTheme: TextTheme(
            headline6: TextStyle(color: Colors.white, fontFamily: 'Sego'),
            headline1: TextStyle(color: Colors.white, fontFamily: 'Sego'),
            headline2: TextStyle(color: Colors.white, fontFamily: 'Sego'),
            headline3: TextStyle(color: Colors.white, fontFamily: 'Sego'),
            headline4: TextStyle(color: Colors.white, fontFamily: 'Sego'),
            headline5: TextStyle(color: Colors.white, fontFamily: 'Sego'),
          )),
      home: MainScreen(),
    );
  }
}
