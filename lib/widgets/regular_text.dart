import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RegularText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  RegularText({Key key, this.color,this.text,this.fontWeight, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: size,
      ),
    );
  }
}
