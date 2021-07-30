
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
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
