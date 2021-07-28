import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MuteImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 1,
      bottom: 1,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(2),
          child: Image.asset('assets/images/girl_pic.jpeg')),
    );
  }
}