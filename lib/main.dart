import 'package:aurora_fruts/ui/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aurora_fruts/data/constants.dart' as constant;
import 'package:aurora_fruts/utils/config.dart' as config;

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white.withOpacity(0.0),
      statusBarIconBrightness: Brightness.dark));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: config.convertColor(constant.colors['primary']),
        textTheme: TextTheme(
            title: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.black,
              fontSize: 32.0,
            ),
            button: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black54,
                fontSize: 16.0),
            overline: TextStyle(
                letterSpacing: 0.0,
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.w500),
            display1: TextStyle(fontSize: 24.0, color: Colors.black),
            display4: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        accentColor: config.convertColor(constant.colors['tertiary']),
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
