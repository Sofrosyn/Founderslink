import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:founderslink/core/ui/widgets/progress_dialog.dart';
import 'package:founderslink/core/ui/widgets/toast.dart';
import 'package:founderslink/ui/authentication/bloc/authentication_bloc.dart';
import 'package:founderslink/ui/authentication/views/login/login_member/login_member.dart';
import 'package:founderslink/ui/authentication/views/profile/edit_profile_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:founderslink/ui/authentication/models/goals_response.dart';
import 'package:founderslink/ui/authentication/models/interests_response.dart';

import '../../../heplerclass.dart';

class LoginStudent2 extends StatefulWidget {
  final String location;
  final String course;
  final String school;
  final List<int> niches;

  const LoginStudent2(
      {Key key, this.location, this.course, this.school, this.niches})
      : super(key: key);

  @override
  _LoginStudent2State createState() => _LoginStudent2State();
}

class _LoginStudent2State extends State<LoginStudent2> {
  String selectedGoal, selectedExperience;

  GoalsResponse _goalsResponse = GoalsResponse();
  Goals _selectedGoal = Goals();
  InterestsResponse _interestsResponse = InterestsResponse();
  List<Interests> _selectedInterest = <Interests>[];

  List<Interests> interestArray = <Interests>[];

  final _bloc = AuthenticationBloc();

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }


  @override
  void initState() {
    super.initState();
    _bloc.add(GetInterestsAndGoalsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        top: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: BlocListener(
              bloc: _bloc,
              listener: (context, state) {
                if (state is Loading) {
                  return progressDialog(context);
                }

                if (state is AuthenticationError) {
                  Navigator.pop(context);
                  flutterToast(state.message, true);
                }

                if (state is HasInterestsAndGoals) {
                  Navigator.pop(context);
                  state.interests
                      .fold((l) => null, (r) => _interestsResponse = r);
                  state.goals.fold((l) => null, (r) => _goalsResponse = r);
                  _interestsResponse.data.forEach((element) {
                    interestArray.add(element);
                  });
                  setState(() {});
                }

                if (state is UpdateStudentProfileSuccess) {
                  Navigator.pop(context);
                  //Get.to(()=>LoginMember());
                  Get.to(() => EditProfilePage());
                }
              },
              child: Column(
                children: [
                  AppImages.logoWidget,
                  _nicheText(),
                  Padding(child:chipList(),
                  padding:EdgeInsets.symmetric(horizontal: 10.0)),
                  _goalsDropdown(),
                  _expDropdown(),
                  Spacer(),
                  _continueBtn(),
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

  Widget _companyname() {
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
              "Name of Your Company",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 16.h),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 5.h,
              left: 20.h,
              right: 20.h,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.h)),
                border: Border.all(color: Colors.grey[400])),
            child: Container(
              margin: EdgeInsets.all(5.h),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Founders Link",
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _title() {
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
              "Your Title",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 16.h),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: 5.h, left: 20.h, right: 20.h, bottom: 2.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.h)),
                border: Border.all(color: Colors.grey[400])),
            child: Container(
              margin: EdgeInsets.all(5.h),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "CMO",
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _nicheText() {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h, right: 20.h, left: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Your Interests",
              style: GoogleFonts.poppins(
                  fontSize: 16.h, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  chipList() {
    return Wrap(
        spacing: 5.0,
        runSpacing: 5.0,
        children: interestArray?.map((e) => _buildChip(e)).toList());
  }

  Widget _buildChip(Interests value) {
    return InkWell(
      onTap: () {
        _selectedInterest.contains(value)
            ? _selectedInterest.remove(value)
            : _selectedInterest.add(value);
        setState(() {});
      },
      child: Chip(
        labelPadding: EdgeInsets.all(2.0),
        label: Text(
          value.name,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor:
            _selectedInterest.contains(value) ? Colors.blue : Colors.grey[200],
        elevation: 1.0,
        shadowColor: Colors.grey[60],
        padding: EdgeInsets.all(8.0),
      ),
    );
  }

  Widget _goalsDropdown() {
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
              "Whar is Your Goal ?",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 16.h),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 5.h,
              left: 20.h,
              right: 20.h,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.h)),
                border: Border.all(color: Colors.grey[400])),
            child: DropdownSearch<Goals>(
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
                hintText: "Search Goal",
              ),
              mode: Mode.DIALOG,
              // showSelectedItem: true,
              items: _goalsResponse?.data,
              // label: "Indusry",
              itemAsString: (item) => item.name,
              hint: "Choose Goal",
              // popupItemDisabled: (String s) => s.startsWith('I'),
              onChanged: (value) {
                _selectedGoal = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _expDropdown() {
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
              "How much enterpenurship experinece do you have ?",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 14.h),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 5.h,
              left: 20.h,
              right: 20.h,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.h)),
                border: Border.all(color: Colors.grey[400])),
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
                hintText: "Search experinece",
              ),
              mode: Mode.DIALOG,
              // showSelectedItem: true,
              items: experineceList,
              // label: "Indusry",
              itemAsString: (item) => item,
              hint: "Choose experinece",
              // popupItemDisabled: (String s) => s.startsWith('I'),
              onChanged: (value) {
                selectedExperience = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _continueBtn() {
    return Container(
      margin: EdgeInsets.only(
        top: 10.h,
        left: 30.h,
        right: 30.h,
      ),
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.h)),
          color: Colors.black),
      child: GestureDetector(
        onTap: () {
          if (_selectedInterest.length == 0) {
            flutterToast("Please Select an Interest", true);
          } else if (_selectedGoal == null) {
            flutterToast("Please Select a Goal", true);
          } else if (selectedExperience.isEmpty) {
            flutterToast("Please Tell us your experience level", true);
          } else {
            _bloc.add(UpdateStudentProfile(
              location: widget.location,
              interests: _selectedInterest.map((e) => e.id).toList(),
              niches: widget.niches,
              goal_id: _selectedGoal.id,
              course_of_study: widget.course,
              entrepreneurial_experience: selectedExperience,
              school: widget.school,
            ));
          }
        },
        child: Center(
            child: Text(
          "Continue",
          style: GoogleFonts.poppins(
              fontSize: 12.h, color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
