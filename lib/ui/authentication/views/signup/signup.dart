import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:founderslink/core/ui/widgets/progress_dialog.dart';
import 'package:founderslink/core/ui/widgets/toast.dart';
import 'package:founderslink/ui/authentication/bloc/authentication_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:founderslink/utils/extensions.dart';

import '../../heplerclass.dart';
import 'confirmation.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String _emailText = '';
  String _passwordText = '';
  String _confirmPasswordText = '';
  String _fName ='';
  String _lName = '';

  final _bloc= AuthenticationBloc();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      maintainBottomViewPadding: true,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocListener(
          bloc:_bloc,
          listener:(context, state){
            if(state is Loading){
              return progressDialog(context);
            }
            if(state is AuthenticationError){
              Navigator.pop(context);
              flutterToast(state.message, true);
            }
            if(state is SignUpSuccess){
              Navigator.pop(context);
              Get.to(() => Confirmation());
            }


          },
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _logo(),
                  _fname(),
                  _lastname(),
                  _workemail(),
                  _password(),
                  _cpassword(),
                  _continueBtn(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return Container(
      child: Image.asset(AppImages.logo),
    );
  }

  Widget _fname() {
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
                onChanged: (value){
                  _fName = value;
                },
                decoration: InputDecoration(
                    hintText: "First Name", hintStyle: TextStyle(color: Colors.grey[200]), border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _lastname() {
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
                onChanged: (value){
                  _lName = value;

                },
                decoration: InputDecoration(
                    hintText: "Last Name",
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

  Widget _workemail() {
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
              "Work or School Email Address",
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
                onChanged: (value){
                  _emailText = value;
                },
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
              "Password",
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
                onChanged: (value){
                  _passwordText = value;

                },
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
                onChanged: (value){
                  _confirmPasswordText = value;

                },
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

  bool get hasText{
    return (_emailText.isNotEmpty && _passwordText.isStrongPassword && _fName.isNotEmpty && _lName.isNotEmpty && _passwordText ==_confirmPasswordText)? true:false;
  }

  Widget _continueBtn() {
    return GestureDetector(
      onTap: () {
        // if(hasText){
          _bloc.add(SignupEvent(lName: _lName, fName: _fName, password: _passwordText, email: _emailText, password_confirmation: _confirmPasswordText));
        // }else{
        //   if(_emailText.isEmpty){
        //     flutterToast('Please Enter a valid Email', true);
        //   }else if(!_passwordText.isStrongPassword){
        //     flutterToast('Password should contain one uppercase, lowercase and number', true);
        //   } else if(_passwordText!=_confirmPasswordText){
        //     flutterToast('Passwords do not match', true);
        //   }else if(_fName.isEmpty || _lName.isEmpty){
        //     flutterToast('Please Enter a valid name', true);
        //   }
        // }

      },
      child: Container(
        margin: EdgeInsets.only(top: 40.h, left: 30.h, right: 30.h),
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.h)), color: Colors.black),
        child: Center(
            child: Text(
          "Continue",
          style: GoogleFonts.poppins(fontSize: 12.h, color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
