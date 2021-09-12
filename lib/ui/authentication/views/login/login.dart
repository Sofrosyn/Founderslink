import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:founderslink/core/ui/widgets/progress_dialog.dart';
import 'package:founderslink/core/ui/widgets/toast.dart';
import 'package:founderslink/ui/authentication/bloc/authentication_bloc.dart';
import 'package:founderslink/ui/authentication/provider/login_provider_validation.dart';
import 'package:founderslink/ui/authentication/views/signup/signup.dart';
import 'package:founderslink/ui/controller/user_data_provider.dart';
import 'package:founderslink/ui/pages/chat.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../heplerclass.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _emailText = '';
  String _passwordText = '';

  final _bloc = AuthenticationBloc();

  final FocusNode myFocusNodePasswordLogin = FocusNode();
  bool _obscureText = true;

  void _toggleLogin() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  UserDataController userController = Get.find<UserDataController>();

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final _formProvider = Provider.of<LoginFormProvider>(context);
    return SafeArea(
        bottom: false,
        top: false,
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

              if (state is LoginSuccess) {
                Navigator.pop(context);
                userController.getLoginPayload();
                //  Get.to(() => Confirmation());
                //Get.to(() => Chat());//Get.to(() => Confirmation());
                // userController.loginPayload.value.data.type!=null ?
                Get.to(() => Chat()); //:Get.to(() => Confirmation());
              }
            },
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppImages.logoWidget,
                    _text(),
                    _email(),
                    _password(),
                    _loginbtn(),
                    _signuptn(),
                    //_meetingbtn(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget _logo() {
    return SizedBox(
      width: 100.w,
      height: 10.h,
      child: Image.asset(AppImages.logo),
    );
  }

  Widget _text() {
    return Container(
      margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
      child: Center(
          child: Text("Login",
              style: GoogleFonts.poppins(
                  fontSize: 35.h, fontWeight: FontWeight.bold))),
    );
  }

  Widget _email() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
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
              "Email",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 12.h),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal:20.w, vertical:5.h),
            //height: 40.h,
            // margin: EdgeInsets.only(
            //   top: 5.h,
            //   left: 20.h,
            //   right: 20.h,
            // ),
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(5.h)),
            //     border: Border.all(color: Colors.grey[400])),
            child: Consumer<LoginFormProvider>(
              builder: (context, provider, child) => TextFormField(
                onChanged: (value) {
                  _emailText = value;
                  provider.validateEmail(value);
                },
    keyboardType: TextInputType.emailAddress,
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
                    hintText: "johnadeo@gmail.com",
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
            margin: EdgeInsets.symmetric(horizontal:20.w, vertical:5.h),
            // height: 40.h,
            // margin:
            //     EdgeInsets.only(top: 5.h, left: 20.h, right: 20.h, bottom: 2.h),
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(5.h)),
            //     border: Border.all(color: Colors.grey[400])),
            child: Consumer<LoginFormProvider>(
              builder: (context, provider, child) => TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: _obscureText,
                onChanged: (value) {
                  _passwordText = value;
                  provider.validatePassword(value);
                },
                keyboardType: TextInputType.visiblePassword,
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
                    errorText: provider.password.error,
                    suffixIcon: InkWell(
                        onTap: () {
                          _toggleLogin();
                        },
                        child: _obscureText
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

  Widget _loginbtn() {
    return Consumer<LoginFormProvider>(
      builder: (context, provider, child) => GestureDetector(
        onTap: (provider.validate)
            ? () {
                _bloc.add(
                    LoginEvent(email: _emailText, password: _passwordText));
              }
            : null,
        child: Container(
          margin: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.h)),
              color: Colors.black),
          child: Center(
              child: Text(
            "Login",
            style: GoogleFonts.poppins(
                fontSize: 12.h,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }

  Widget _signuptn() {
    return GestureDetector(
      onTap: () {
        Get.to(() => Signup());
      },
      child: Container(
        margin: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.h)),
            color: AppColor.nblue),
        child: Center(
            child: Text(
          "Sign Up",
          style: GoogleFonts.poppins(
              fontSize: 12.h, color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  bool get hasText {
    return (_emailText.isNotEmpty && _passwordText.isNotEmpty) ? true : false;
  }

  Widget _meetingbtn() {
    return Container(
      margin: EdgeInsets.only(top: 10.h, left: 30.h, right: 30.h),
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.h)),
          color: AppColor.purple),
      child: GestureDetector(
        onTap: () {},
        child: Center(
            child: Text(
          "Just here for a meeting",
          style: GoogleFonts.poppins(
              fontSize: 12.h, color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}