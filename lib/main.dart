import 'package:floor/constants/routes.dart';
import 'package:floor/sample/screen1.dart';
import 'package:floor/sample/screen2.dart';
import 'package:floor/sample/screen3.dart';
import 'package:floor/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

// Bro
void main() {

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: Screen1(),
      // initialRoute: HomeScreen.routeName,

    );
  }


}

