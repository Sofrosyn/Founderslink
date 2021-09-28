import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:founderslink/HelperClass/dart/heplerclass.dart';
import 'package:founderslink/views/login/login_investor/login_investor.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker_widget/enum/image_picker_widget_shape.dart';
import 'package:image_picker_widget/image_picker_widget.dart';



const String defaultAvatar =
    "https://img.pngio.com/fileblank-avatarpng-georgian-civil-code-commentary-avatarpng-400_400.png";


class SetProfile extends StatefulWidget {
  @override
  _SetProfileState createState() => _SetProfileState();
}

class _SetProfileState extends State<SetProfile> {
  var selectedPronoun;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        top: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppImages.logoWidget,
                _profile(),
                _text(),
                _pronouns(),
                _loginbtn(),
              ],
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
      margin: EdgeInsets.only(
        top: 5.h,
        left: 20.h,
        right: 20.h,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.h)), border: Border.all(color: Colors.grey[400])),
      child: DropdownSearch<String>(
        showSearchBox: true,
        dropdownSearchDecoration: InputDecoration(
          // hintText: null,
          // labelText: "Whar is Your Indusry?",
          contentPadding: EdgeInsets.only(
            left: 10,
          ),
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        searchBoxDecoration: InputDecoration(
          hintText: "Search Pronoun",
        ),
        mode: Mode.DIALOG,
        // showSelectedItem: true,
        items: pronounsList,
        // label: "Indusry",
        itemAsString: (item) => item,
        hint: "Choose Pronoun",
        // popupItemDisabled: (String s) => s.startsWith('I'),
        onChanged: (value) {
          selectedPronoun = value;
        },
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
          Get.to(() => LoginInvestor());
        },
        child: Center(
          child: (Text(
            "Continue",
            style: GoogleFonts.poppins(fontSize: 12.h, color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
