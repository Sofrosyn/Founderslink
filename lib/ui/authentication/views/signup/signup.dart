import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:founderslink/core/ui/widgets/progress_dialog.dart';
import 'package:founderslink/core/ui/widgets/toast.dart';
import 'package:founderslink/ui/authentication/bloc/authentication_bloc.dart';
import 'package:founderslink/ui/authentication/provider/registration_provider_validation.dart';
import 'package:founderslink/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  String _fName = '';
  String _lName = '';

  final _bloc = AuthenticationBloc();
  final _formKey = GlobalKey<FormState>();
  final FocusNode myFocusNodePasswordLogin = FocusNode();
  bool _obscurePasswordText = true;
  bool _obscureConfirmPasswordText = true;

  void _togglePassword() {
    setState(() {
      _obscurePasswordText = !_obscurePasswordText;
    });
  }

  void _toggleConfirmPassword() {
    setState(() {
      _obscureConfirmPasswordText = !_obscureConfirmPasswordText;
    });
  }

  @override
  void dispose() {
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final _formProvider = Provider.of<SignUpFormProvider>(context);
    return SafeArea(
      bottom: false,
      top: false,
      maintainBottomViewPadding: true,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocListener(
          bloc: _bloc,
          listener: (context, state) {
            if (state is Loading) {
              return progressDialog(context);
            }
            if (state is AuthenticationError) {
              Navigator.pop(context);
              flutterToast(state.message, true);
            }
            if (state is SignUpSuccess) {
              Navigator.pop(context);
              Get.to(() => Confirmation());
            }
          },
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppImages.logoWidget, //_logo(),
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
      margin: EdgeInsets.only(top: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 5.h,
              left: 25.h,
              right: 20.h,
            ),
            child: Text(
              "First Name",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 12.h),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal:20.w, vertical:5.h),
            // height: 40.h,
            // margin: EdgeInsets.only(
            //   top: 5.h,
            //   left: 20.h,
            //   right: 20.h,
            // ),
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(5.h)),
            //     border: Border.all(color: Colors.grey[400])),
            child: Consumer<SignUpFormProvider>(
              builder: (context, provider, child) => TextFormField(
                keyboardType: TextInputType.name,
                onChanged: (String val) {
                  provider.validateFName(val);
                  _fName = val;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  contentPadding:EdgeInsets.all(10),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(width: 1,color: Colors.grey[400]),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(width: 1,color: Colors.grey[400]),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(width: 1,color: Colors.grey[400]),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(width: 1,color:Colors.grey[400])
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(width: 1,color: Colors.grey[400])
                    ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(width: 1,color: Colors.red)
                  ),
                    errorText: provider.fName.error,
                    hintText: "First Name",
                    hintStyle: TextStyle(color: Colors.grey[200]),
                    ),
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
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 12.h),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal:20.w, vertical:5.h),
            // height: 40.h,
            // margin: EdgeInsets.only(
            //   top: 5.h,
            //   left: 20.h,
            //   right: 20.h,
            // ),
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(5.h)),
            //     border: Border.all(color: Colors.grey[400])),
            child: Consumer<SignUpFormProvider>(
              builder: (context, provider, child) => TextFormField(
                onChanged: (value) {
                  _lName = value;
                  provider.validateLName(value);
                },
                keyboardType: TextInputType.name,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    contentPadding:EdgeInsets.all(10),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(width: 1,color: Colors.grey[400]),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(width: 1,color: Colors.grey[400]),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(width: 1,color: Colors.grey[400]),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(width: 1,color:Colors.grey[400])
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(width: 1,color: Colors.grey[400])
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(width: 1,color: Colors.red)
                    ),
                  errorText:provider.lName.error,
                    hintText: "Last Name",
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.grey[200]),

              ),
            ),
          ),
          )]
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
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 12.h),
            ),
          ),
          Container(
            // height: 40.h,
            // margin:
            //     EdgeInsets.only(top: 5.h, left: 20.h, right: 20.h, bottom: 2.h),
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(5.h)),
            //     border: Border.all(color: Colors.grey[400])),
            margin: EdgeInsets.symmetric(horizontal:20.w, vertical:5.h),
            child: Consumer<SignUpFormProvider>(
              builder: (context, provider, child) => TextFormField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  _emailText = value;
                  provider.validateEmail(value);
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    contentPadding:EdgeInsets.all(10),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(width: 1,color: Colors.grey[400]),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(width: 1,color: Colors.grey[400]),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(width: 1,color: Colors.grey[400]),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(width: 1,color:Colors.grey[400])
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(width: 1,color: Colors.grey[400])
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(width: 1,color: Colors.red)
                    ),
                  errorText:provider.email.error,
                    hintText: "**********",
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.grey[200]),
                    ),
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
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 12.h),
            ),
          ),
          Container(
            // height: 40.h,
            // margin:
            //     EdgeInsets.only(top: 5.h, left: 20.h, right: 20.h, bottom: 2.h),
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(5.h)),
            //     border: Border.all(color: Colors.grey[400])),
            margin: EdgeInsets.symmetric(horizontal:20.w, vertical:5.h),
            child: Consumer<SignUpFormProvider>(
              builder: (context, provider, child) => TextFormField(
                obscureText: _obscurePasswordText,
                onChanged: (value) {
                  _passwordText = value;
                  provider.validatePassword(value);
                },
                keyboardType: TextInputType.visiblePassword,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    contentPadding:EdgeInsets.all(10),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(width: 1,color: Colors.grey[400]),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(width: 1,color: Colors.grey[400]),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(width: 1,color: Colors.grey[400]),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(width: 1,color:Colors.grey[400])
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(width: 1,color: Colors.grey[400])
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(width: 1,color: Colors.red)
                    ),
                  errorText:provider.password.error,
                    suffixIcon: InkWell(
                        onTap: () {
                          _togglePassword();
                        },
                        child: _obscurePasswordText
                            ? Icon(Icons.remove_red_eye)
                            : Icon(Icons.remove_red_eye_outlined)),
                    hintText: "**********",
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.grey[200]),
                    ),
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
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 12.h),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal:20.w, vertical:5.h),
            // height: 40.h,
            // margin:
            //     EdgeInsets.only(top: 5.h, left: 20.h, right: 20.h, bottom: 2.h),
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(5.h)),
            //     border: Border.all(color: Colors.grey[400])),
            child: Consumer<SignUpFormProvider>(
              builder: (context, provider, child) => TextFormField(
                keyboardType: TextInputType.visiblePassword,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: _obscureConfirmPasswordText,
                onChanged: (value) {
                  _confirmPasswordText = value;
                  provider.validateConfirmPassword(value);
                },
                decoration: InputDecoration(
                    contentPadding:EdgeInsets.all(10),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(width: 1,color: Colors.grey[400]),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(width: 1,color: Colors.grey[400]),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(width: 1,color: Colors.grey[400]),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(width: 1,color:Colors.grey[400])
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(width: 1,color: Colors.grey[400])
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(width: 1,color: Colors.red)
                    ),
                  errorText:provider.confirmPassword.error,
                    suffixIcon: InkWell(
                        onTap: () {
                          _toggleConfirmPassword();
                        },
                        child: _obscureConfirmPasswordText
                            ? Icon(Icons.remove_red_eye)
                            : Icon(Icons.remove_red_eye_outlined)),
                    hintText: "**********",
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.grey[200]),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool get hasText {
    return (_emailText.isNotEmpty &&
            _passwordText.isStrongPassword &&
            _fName.isNotEmpty &&
            _lName.isNotEmpty &&
            _passwordText == _confirmPasswordText)
        ? true
        : false;
  }

  Widget _continueBtn() {
    return Consumer<SignUpFormProvider>(
      builder: (context, provider, child) => GestureDetector(
        onTap: (provider.validate)? () {
          _bloc.add(SignupEvent(
              lName: _lName,
              fName: _fName,
              password: _passwordText,
              email: _emailText,
              password_confirmation: _confirmPasswordText));
        }:null,
        child: Container(
          margin: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.h)),
              color: Colors.black),
          child: Center(
              child: Text(
            "Continue",
            style: GoogleFonts.poppins(
                fontSize: 12.h,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
