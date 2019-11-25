import 'package:aurora_fruts/ui/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white.withOpacity(0.0),
    statusBarIconBrightness: Brightness.dark
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          title: TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.black,
            fontSize: 32.0,
          ),
          button: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black54,
            fontSize: 16.0
          ),
          overline: TextStyle(
            fontFamily: 'Helvetica',
            letterSpacing: 0.0,
            color: Colors.grey[500],
            fontSize: 24.0
          )
        ),
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
