import 'package:floor/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class AddNichesTags extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.045,
      width: width * 0.27,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.KlightgrayColor,
        // border: Border.all(
        //     color: Colors.pink[800], // Set border color
        //     width: 3.0),   // Set border width
        borderRadius: BorderRadius.all(
            Radius.circular(10.0)), // Set rounded corner radius
        // boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))] // Make rounded corner of border
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.add),

            Text("My demo ",),
          ],
        ),
      ),
    );
  }
}

