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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.KappGradientColorOne,
          leading:  Icon(
            Icons.message_outlined,
            size: 30,
            color: AppColors.KblackColor,
          ),
          title: Center(child: Image.asset('assets/images/floor_logo.png')),
          actions: [
            Icon(
              CupertinoIcons.calendar_today,
              color: AppColors.KblackColor,
              size: 30,
            ),
            SizedBox(
              width: width * 0.03,
            ),
            Icon(
              Icons.notifications_none_outlined,
              size: 30,
              color: AppColors.KblackColor,
            ),
            SizedBox(
              width: width * 0.03,
            ),
          ],
        ),
        body: HomeBody(),
        // backgroundColor: AppColors.KappBackgroundColor
    );
  }
}
