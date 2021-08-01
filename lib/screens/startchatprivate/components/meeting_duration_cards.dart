import 'package:floor/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class MeetingDurationCard extends StatelessWidget {
  final icon;
  final Color iconColor;
  final String textMeeting;
  final String textMin;
  MeetingDurationCard({@required this.icon,
    this.iconColor,
    this.textMeeting,this.textMin});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.1,
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black26, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 50,
              color: iconColor,
            ),
            SizedBox(
              width: width * 0.1,
            ),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  // Private Meeting 15 minutes
                  textMeeting,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: height * 0.009,
                ),
                Text(
                  textMin,
                  // '15 Minutes',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 13
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

