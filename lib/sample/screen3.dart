import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                    ),
                    SizedBox(),
                    // Image.asset('assets/images/floor_icon.png'),
                    Text(
                      'Chat Menu',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 24),
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.calendar_today,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Icon(
                            CupertinoIcons.ellipsis_vertical,
                            color: Colors.grey[10],
                          ),
                        ),
                        Icon(
                          Icons.ac_unit,
                        ),
                      ],
                    ),
                  ],
                ),
                // Container(
                // height: 30,
                // width: double.infinity,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(15.0),
                //   border: Border.all(color: Colors.black,width: ),
                // ),
                // child:
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Search Chat Lobbies',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow,width: 10),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                //       focusedBorder: OutlineInputBorder(
                //   borderSide: BorderSide(width: 3, color: Colors.red),
                //   borderRadius: BorderRadius.circular(15),
                // )
                  ),
                ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
