
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatMenuBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          height: height * 1,
          width: width * 1,
          child:  Padding(
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
      ),
    );
  }
}
