import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:founder_link/HelperClass/dart/heplerclass.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:founder_link/views/profile/profile_settings.dart';

class Homepage extends StatefulWidget {
  static String route = "/homepage";

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex = 0;

  List<Widget> _pages = [
    Container(
      child: Center(child: Text("Home")),
    ),
    Container(
      child: Center(child: Text("Chat")),
    ),
    Container(
      child: Center(child: Text("People")),
    ),
    ProfileSettings(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Widget bottomNavigationBar = Container(
        decoration: BoxDecoration(
          //Here goes the same radius, u can put into a var or function
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            topRight: const Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x54000000),
              spreadRadius: 2,
              blurRadius: 15,
            ),
          ],
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20.0),
              topRight: const Radius.circular(20.0),
            ),
            child: BottomAppBar(
                // elevation: 20.0,
                shape: CircularNotchedRectangle(),
                child: Container(
                  height: 70,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: IconButton(
                          iconSize: 20.0,
                          icon: Image.asset(
                            AppImages.ic_home,
                            color: currentIndex == 0 ? Colors.black : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              currentIndex = 0;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: IconButton(
                          iconSize: 20.0,
                          icon: Image.asset(
                            AppImages.ic_chat,
                            color: currentIndex == 1 ? Colors.black : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              currentIndex = 1;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: IconButton(
                          iconSize: 40.0,
                          icon: Image.asset(
                            AppImages.ic_group,
                            color: currentIndex == 2 ? Colors.black : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              currentIndex = 2;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: IconButton(
                          iconSize: 20.0,
                          icon: Image.asset(
                            AppImages.ic_profile,
                            color: currentIndex == 3 ? Colors.black : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              currentIndex = 3;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ))));

    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 50.r,
        width: 50.r,
        margin: EdgeInsets.all(2),
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            child: Image.asset(
              AppImages.ic_floor,
              color: Colors.white,
              width: 25.r,
              height: 25.4,
            ),
            // elevation: 5.0,
          ),
        ),
      ),
    );
  }
}
