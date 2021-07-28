import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:founderslink/HelperClass/dart/heplerclass.dart';
import 'package:google_fonts/google_fonts.dart';

enum LockPref {
  yes,
  no,
}

class SubcriptionsTab extends StatefulWidget {
  const SubcriptionsTab({Key key}) : super(key: key);

  @override
  _SubcriptionsTabState createState() => _SubcriptionsTabState();
}

class _SubcriptionsTabState extends State<SubcriptionsTab> {
  var lockPref = LockPref.yes;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Your Subcriptions",
            style: GoogleFonts.poppins(fontSize: 20.sp, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          _plan(),
          _paymentMethods(),
          _actionBtn(
            child: Text(
              "Cancel Subcription",
              style: GoogleFonts.poppins(fontSize: 12.h, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            color: Colors.red,
          ),
          _actionBtn(
            child: Text(
              "Back to Profile",
              style: GoogleFonts.poppins(fontSize: 12.h, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _password() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 5.h,
              left: 25.h,
              right: 20.h,
            ),
            child: Text(
              "New Password",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12.h),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.h, left: 20.h, right: 20.h, bottom: 2.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.h)), border: Border.all(color: Colors.grey[400])),
            child: Container(
              margin: EdgeInsets.all(5.h),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "**********",
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.grey[200]),
                    border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cpassword() {
    return Container(
      margin: EdgeInsets.only(top: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 5.h,
              left: 25.h,
              right: 20.h,
            ),
            child: Text(
              "Confirm Password",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12.h),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.h, left: 20.h, right: 20.h, bottom: 2.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.h)), border: Border.all(color: Colors.grey[400])),
            child: Container(
              margin: EdgeInsets.all(5.h),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "**********",
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.grey[200]),
                    border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _plan() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                width: 100.r,
                height: 80.r,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "\$0",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 40.sp),
                  ),
                ),
              ),
              Text(
                "Student",
                style: GoogleFonts.poppins(fontSize: 10.sp),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                width: 100.r,
                height: 80.r,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "\$29",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 40.sp),
                  ),
                ),
              ),
              Text(
                "Proffesional",
                style: GoogleFonts.poppins(fontSize: 10.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _paymentMethods() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        left: 5.h,
        right: 5.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Payment Methods", style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.grey)),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.grey,
                )),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Radio(value: 0, groupValue: "groupValue", onChanged: (value) {}),
                          Expanded(
                              child: Text("Test Gateway",
                                  style: GoogleFonts.poppins(fontSize: 10.sp, color: Colors.grey))),
                        ],
                      ),
                      if (index <2  )
                        Divider(
                          color: Colors.grey,
                        )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget _actionBtn({child, onTap, color}) {
    return Container(
      margin: EdgeInsets.only(
        top: 10.h,
        left: 20.h,
        right: 20.h,
      ),
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.h)), color: color),
      child: GestureDetector(
        onTap: onTap,
        child: Center(child: child),
      ),
    );
  }
}
