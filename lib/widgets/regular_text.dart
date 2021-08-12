import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RegularText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final textOverFlow;
  final maximumLine;
  final FontWeight fontWeight;
  RegularText({Key key, this.color,this.maximumLine,this.textOverFlow,this.text,this.fontWeight, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverFlow,
      maxLines: maximumLine,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: size,
      ),
    );
  }
}
