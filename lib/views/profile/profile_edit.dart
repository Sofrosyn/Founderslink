import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:founder_link/HelperClass/dart/heplerclass.dart';
import 'package:founder_link/views/login/login_investor/login_investor.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker_widget/enum/image_picker_widget_shape.dart';
import 'package:image_picker_widget/image_picker_widget.dart';

enum LockPref {
  yes,
  no,
}

const String defaultAvatar =
    "https://img.pngio.com/fileblank-avatarpng-georgian-civil-code-commentary-avatarpng-400_400.png";

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  var lockPref = LockPref.yes;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        bottom: false,
        top: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Container(
                height: size.height / 6,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.ellipse),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                margin: EdgeInsets.only(bottom: 30),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _logo(),
                      _profile(),
                      _name(),
                      _title(),
                      _tag(),
                      _bio(),
                      _rqst(),
                      _editInterests(),
                      _editNiches(),
                      _actionBtn(
                        child: Text(
                          "Back to Profile",
                          style: GoogleFonts.poppins(fontSize: 12.h, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _logo() {
    return Container(
      child: Image.asset(
        AppImages.logo,
        width: 150.w,
        height: 110.h,
      ),
    );
  }

  Widget _profile() {
    return ImagePickerWidget(
      diameter: 100.r,
      initialImage: defaultAvatar,
      shape: ImagePickerWidgetShape.circle,
      isEditable: true,
    );
  }

  Widget _rowActions() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 20),
      height: 40.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: AppColor.grey, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Expanded(
              child: TextButton.icon(
                  onPressed: () {},
                  label: Text(
                    "Social",
                    style: TextStyle(fontSize: 12.sp, color: Colors.black),
                  ),
                  icon: Image.asset(
                    AppImages.social_1,
                    width: 20.w,
                    height: 20.h,
                  ))),
          Container(
            width: 1,
            height: 40.h,
            color: Colors.black,
          ),
          Expanded(
              child: TextButton.icon(
                  style: TextButton.styleFrom(),
                  onPressed: () {},
                  label: Text(
                    "Profile",
                    style: TextStyle(fontSize: 12.sp, color: Colors.black),
                  ),
                  icon: Image.asset(
                    AppImages.user_1,
                    width: 20.w,
                    height: 20.h,
                  ))),
          Container(
            width: 1,
            height: 40.h,
            color: Colors.black,
          ),
          Expanded(
              child: TextButton.icon(
                  onPressed: () {},
                  label: Text(
                    "Subcriptions",
                    style: TextStyle(fontSize: 12.sp, color: Colors.black),
                  ),
                  icon: Image.asset(
                    AppImages.subscription_1,
                    width: 20.w,
                    height: 20.h,
                  ))),
        ],
      ),
    );
  }

  Widget _password() {
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
                    hintText: "Change Name", hintStyle: TextStyle(color: Colors.grey[200]), border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _title() {
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
              "Edit Title",
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
                    hintText: "Edit Title", hintStyle: TextStyle(color: Colors.grey[200]), border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tag() {
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
              "Edit Here To",
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
                    hintText: "Edit Tags", hintStyle: TextStyle(color: Colors.grey[200]), border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bio() {
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
              "Edit Bio",
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
                    hintText: "Edit Bio", hintStyle: TextStyle(color: Colors.grey[200]), border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rqst() {
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
              "Recieve Office hour Request ?",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12.h),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20.h,
              right: 20.h,
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
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

  Widget _editInterests() {
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Edit Interests",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12.h),
                ),
                TextButton(
                  onPressed: (){},
                  child: Text(
                  "Edit",
                  style: GoogleFonts.poppins(color: Colors.grey, fontSize: 10.h),
                ),
                )
                 
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20.h,
              right: 20.h,
            ),
            child: Wrap(
              children: <Widget>[
                buildChip('womenfounder',img:AppImages.founder),
                buildChip('Founder', img:AppImages.founder),
                buildChip('LatinxFounder', img:AppImages.founder),
                buildChip('Founder',img: AppImages.founder),
                buildChip('Founder',img: AppImages.founder),
                buildChip('womenfounder',img: AppImages.founder),
              ],
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _editNiches() {
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Edit Niches",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12.h),
                ),
                TextButton(
                  onPressed: (){},
                  child: Text(
                  "Edit",
                  style: GoogleFonts.poppins(color: Colors.grey, fontSize: 10.h),
                ),
                )
                 
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20.h,
              right: 20.h,
            ),
            child: Wrap(
              children: <Widget>[
                buildChip('womenfounder',img: AppImages.founder),
                buildChip('Founder', img:AppImages.founder),
                buildChip('LatinxFounder',img: AppImages.founder),
                buildChip('Founder',img: AppImages.founder),
                buildChip('Founder', img:AppImages.founder),
                buildChip('womenfounder', img:AppImages.founder),
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
