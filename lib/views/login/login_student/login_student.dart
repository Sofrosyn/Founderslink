import 'package:flutter/material.dart';
import 'package:founder_link/HelperClass/dart/heplerclass.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_student2.dart';

class LoginStudent extends StatefulWidget {
  @override
  _LoginStudentState createState() => _LoginStudentState();
}

class _LoginStudentState extends State<LoginStudent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
        top: false,

        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical :30.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _logo(), _text(), _userType(),   _nicheText(), _chipList(), _fieldSchool(),_fieldSubject(),_fieldLocated(), _loginbtn()
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
  Widget _text(){
    return Container(
      margin: EdgeInsets.only(top: 10.h,bottom: 10.h, right: 20.h, left: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Who are You ?", style:GoogleFonts.poppins(fontSize: 15.h, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
  Widget _userType() {
    return Container(
      margin: EdgeInsets.only(top: 10.h, bottom: 10.h, right: 20.h, left: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Image.asset(
                AppImages.graduate,
                width: 50.r,
                height: 50.r,
              ),
              Container(
                  margin: EdgeInsets.only(top: 5.h),
                  child: Text("Student",
                      style: GoogleFonts.poppins(
                        fontSize: 10.h,
                      )))
            ],
          ),
          Column(
            children: [
              Image.asset(
                AppImages.team,
                width: 50.r,
                height: 50.r,
              ),
              Container(
                  margin: EdgeInsets.only(top: 5.h),
                  child: Text("Team Member",
                      style: GoogleFonts.poppins(
                        fontSize: 10.h,
                      )))
            ],
          ),
          Column(
            children: [
              Image.asset(
                AppImages.founder,
                width: 50.r,
                height: 50.r,
              ),
              Container(
                  margin: EdgeInsets.only(top: 5.h),
                  child: Text("Founder",
                      style: GoogleFonts.poppins(
                        fontSize: 10.h,
                      )))
            ],
          ),
          Column(
            children: [
              Image.asset(
                AppImages.profile,
                width: 50.r,
                height: 50.r,
              ),
              Container(
                  margin: EdgeInsets.only(top: 5.h),
                  child: Text("Investor",
                      style: GoogleFonts.poppins(
                        fontSize: 10.h,
                      )))
            ],
          ),
        ],
      ),
    );
  }


  Widget _nicheText() {
    return Container(
      margin: EdgeInsets.only(top: 10.h, bottom: 5.h, right: 20.h, left: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("What is your Niche ? (max 3)", style: GoogleFonts.poppins(fontSize: 15.h, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
  
  Widget _chipList(){
    return Wrap(
      spacing: 5.h,
      runSpacing: 5.h,
      children: [
        _buildChip('LatinoVc', AppImages.graduate),
        _buildChip('LatinoVc', AppImages.graduate),
        _buildChip('LatinoVc', AppImages.graduate),
        _buildChip('LatinoVc', AppImages.graduate),
        _buildChip('LatinoVc', AppImages.graduate),
        _buildChip('LatinoVc', AppImages.graduate),
        _buildChip('LatinoVc', AppImages.graduate),
        _buildChip('LatinoVc', AppImages.graduate),
        _buildChip('LatinoVc', AppImages.graduate)
      ],
    );
  }
  Widget _buildChip(String label, var img) {
    return Chip(
      labelPadding: EdgeInsets.all(2.0),
      avatar: Image.asset(
        img,
        width: 30.h,
        height: 30.h,
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.grey[200],
      elevation: 1.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(5.0),
    );
  }


  Widget _fieldSchool(){
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[ Container(
          margin: EdgeInsets.only(top: 5.h, left: 30.h,right: 20.h, ),
          child: Text("What School Do You Go To ?", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12.h),),
        ),Container(
          margin: EdgeInsets.only(top: 5.h, left: 20.h,right: 20.h, ),
          decoration: BoxDecoration(

              borderRadius: BorderRadius.all(Radius.circular(5.h)),
              border: Border.all(color: Colors.grey[400])
          ),
          child:
          Container(
            margin: EdgeInsets.all(5.h),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "University of Colorado Boulder",fillColor: Colors.white,
                  hintStyle:  TextStyle(color: Colors.grey[100]),
                  border: InputBorder.none
              ),

            ),
          ),

        ),


        ],
      ),
    );
  }


  Widget _fieldSubject(){
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[ Container(
          margin: EdgeInsets.only(top: 5.h, left: 30.h,right: 20.h, ),
          child: Text("What Subject Do You Study ?", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12.h),),
        ),Container(
          margin: EdgeInsets.only(top: 5.h, left: 20.h,right: 20.h, ),
          decoration: BoxDecoration(

              borderRadius: BorderRadius.all(Radius.circular(5.h)),
              border: Border.all(color: Colors.grey[400])
          ),
          child:
          Container(
            margin: EdgeInsets.all(5.h),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Business Managemant",fillColor: Colors.white,
                  hintStyle:  TextStyle(color: Colors.grey[100]),
                  border: InputBorder.none
              ),

            ),
          ),

        ),


        ],
      ),
    );
  }
  Widget _fieldLocated(){
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[ Container(
          margin: EdgeInsets.only(top: 5.h, left: 30.h,right: 20.h, ),
          child: Text("Where are You Located ?", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12.h),),
        ),Container(
          margin: EdgeInsets.only(top: 5.h, left: 20.h,right: 20.h, ),
          decoration: BoxDecoration(

              borderRadius: BorderRadius.all(Radius.circular(5.h)),
              border: Border.all(color: Colors.grey[400])
          ),
          child:
          Container(
            margin: EdgeInsets.all(5.h),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Boulder,CO",fillColor: Colors.white,
                  hintStyle:  TextStyle(color: Colors.grey[100]),
                  border: InputBorder.none
              ),

            ),
          ),

        ),


        ],
      ),
    );
  }
  Widget _loginbtn(){

    return Container(
      margin: EdgeInsets.only(top:10.h, left: 30.h, right: 30.h,),
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(

          borderRadius: BorderRadius.all(Radius.circular(10.h)),
          color: Colors.black

      ),
      child: GestureDetector(
        onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => LoginStudent2())); 
        },
        child: Center(child: Text("Continue", style: GoogleFonts.poppins(fontSize: 12.h,color: Colors.white, fontWeight: FontWeight.bold  ),)),
      ),
    );
  }
}
