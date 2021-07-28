import 'package:floor/constants/constants.dart';
import 'package:floor/screens/home/components/home_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: HomeBody(),
        backgroundColor: AppColors.KappBackgroundColor
    );
  }
}
