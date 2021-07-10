import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:founderslink/HelperClass/dart/heplerclass.dart';
import 'package:google_fonts/google_fonts.dart';

enum LockPref {
  yes,
  no,
}

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key key}) : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
    var lockPref = LockPref.yes;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        
          _password(),
          _cpassword(),
          _name(),
          _preferences(),
          _actionBtn(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Logout",
                  style:
                      GoogleFonts.poppins(fontSize: 12.h, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Image.asset(
                  AppImages.emoj_waving,
                  width: 20.w,
                  height: 20.h,
                ),
              ],
            ),
            color: AppColor.blue,
          ),
          _actionBtn(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Deactive Account",
                  style:
                      GoogleFonts.poppins(fontSize: 12.h, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Image.asset(
                  AppImages.emoji_crying,
                  width: 20.w,
                  height: 20.h,
                ),
              ],
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

  Widget _name() {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
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
              "Change Name",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12.h),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 5.h,
              left: 20.h,
              right: 20.h,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.h)), border: Border.all(color: Colors.grey[400])),
            child: Container(
              margin: EdgeInsets.all(5.h),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "", hintStyle: TextStyle(color: Colors.grey[200]), border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _preferences() {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
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
              "Lock Preferences",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12.h),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 5.h,
              left: 20.h,
              right: 20.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                    onPressed: () {
                      setState(() {
                        lockPref = LockPref.yes;
                      });
                    },
                    label: Text(
                      "Yes",
                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                    ),
                    icon: Icon(Icons.check_circle, color: lockPref == LockPref.yes ? Colors.black : Colors.grey)),
                SizedBox(
                  width: 10.w,
                ),
                TextButton.icon(
                    onPressed: () {
                      setState(() {
                        lockPref = LockPref.no;
                      });
                    },
                    label: Text(
                      "No",
                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                    ),
                    icon: Icon(Icons.check_circle, color: lockPref == LockPref.no ? Colors.black : Colors.grey)),
              ],
            ),
          ),
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
