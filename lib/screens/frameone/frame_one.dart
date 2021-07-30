import 'package:floor/constants/constants.dart';
import 'package:floor/screens/frameone/components/frame_one_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FrameOneScreen extends StatefulWidget {
  static String routeName = "/frame_one";
  @override
  _FrameOneScreenState createState() => _FrameOneScreenState();
}
class _FrameOneScreenState extends State<FrameOneScreen> {
  int _selectedPageIndex = 0;


  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      print(_selectedPageIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.KwhiteColor,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 23,
        ),
        title: Text(
          'Messages',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.notifications,
              color: Colors.black,
              size: 23
            ),
          ),
        ],
      ),
      body: FrameOneBody(),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        shape: CircularNotchedRectangle(),
        child: Container(
          decoration: BoxDecoration(),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  Icons.dialpad,
                  color: _selectedPageIndex == 0
                      ? Colors.blueGrey[900]
                      : Colors.black45,
                ),
                onPressed: () => _selectPage(0),
              ),
              Container(
                margin: EdgeInsets.only(right: 80),
                child: IconButton(
                  icon: Icon(
                    Icons.mobile_friendly_rounded,
                    color: _selectedPageIndex == 1
                        ? Colors.blueGrey[900]
                        : Colors.black45,
                  ),
                  onPressed: () => _selectPage(1),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                color: _selectedPageIndex == 2
                    ? Colors.blueGrey[900]
                    : Colors.black45,
                onPressed: null,
              ),
              IconButton(
                icon: Icon(Icons.phone_android_sharp),
                onPressed: null,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.person,
          color: Colors.black,
        ),
        onPressed: null,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // backgroundColor: AppColors.KappBackgroundColor
    );
  }
}
