import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class NfcError extends StatelessWidget {
  const NfcError({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          SvgPicture.asset('assets/images/warning.svg'),
      SizedBox(height: 10.h),
      Text("Oops, Your Device does not support NFC",
          style: TextStyle(color: Colors.grey, fontSize: 20.sp))

      ],
    ),);
  }
}
