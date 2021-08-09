import 'package:floor/constants/routes.dart';
import 'package:floor/screens/emptyscreen.dart';
import 'package:floor/screens/frameone/frame_one.dart';
import 'package:floor/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

// ALi hader
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
      // home: Recruting(),
      initialRoute: HomeScreen.routeName,

    );
  }


}

