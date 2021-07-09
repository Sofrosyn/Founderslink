import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:founderslink/ui/authentication/views/profile/edit_profile_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker_widget/enum/image_picker_widget_shape.dart';
import 'package:image_picker_widget/image_picker_widget.dart';

import '../../heplerclass.dart';
import 'meeting_frame.dart';

class JoinMeeting extends StatefulWidget {
  @override
  _JoinMeetingState createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {
  String values;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        top: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _logo(),
                  _profile(),
                  _text(),
                  _pronouns(),
                  _pronouns2(),
                  _pronouns3(),
                  _loginbtn(),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _logo() {
    return Container(
      margin: EdgeInsets.only(top: 40.h, bottom: 10.h),
      child: Image.asset(AppImages.logo),
    );
  }

  Widget _profile() {
   return ImagePickerWidget(
      diameter: 160,
      initialImage:  defaultAvatar ,
      shape: ImagePickerWidgetShape.circle,
      isEditable: true,
      onChange: (File file) {
        if (file != null){

        }
      },
    );
  }

  Widget _text() {
    return Container(
      margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
      child: Center(
          child:
              Text("Upload Profile Picture", style: GoogleFonts.poppins(fontSize: 15.h, fontWeight: FontWeight.bold))),
    );
  }

  Widget _pronouns() {
    return Container(
      margin: EdgeInsets.only(top: 10.h, bottom: 0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 5.h,
              left: 30.h,
              right: 20.h,
            ),
            child: Text(
              "First Name",
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
                    hintText: "First Name",
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.grey[100]),
                    border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pronouns2() {
    return Container(
      margin: EdgeInsets.only(top: 10.h, bottom: 0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 5.h,
              left: 30.h,
              right: 20.h,
            ),
            child: Text(
              "Last Name",
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
                    hintText: "Last Name",
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.grey[100]),
                    border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pronouns3() {
    return Container(
      margin: EdgeInsets.only(top: 10.h, bottom: 0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 5.h,
              left: 30.h,
              right: 20.h,
            ),
            child: Text(
              "Meeting ID/URL",
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
                    hintText: "Meetong ID/URL",
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.grey[100]),
                    border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginbtn() {
    return Container(
      margin: EdgeInsets.only(
        top: 10.h,
        left: 30.h,
        right: 30.h,
      ),
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.h)), color: Colors.black),
      child: GestureDetector(
        onTap: () {
          Get.to(() => MeetingFrame());
        },
        child: Center(
          child: (Text(
            "join Meeting",
            style: GoogleFonts.poppins(fontSize: 12.h, color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
