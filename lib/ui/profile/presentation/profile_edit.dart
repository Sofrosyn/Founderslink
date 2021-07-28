
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:founderslink/HelperClass/dart/heplerclass.dart';
import 'package:founderslink/core/ui/widgets/progress_dialog.dart';
import 'package:founderslink/core/ui/widgets/toast.dart';
import 'package:founderslink/ui/profile/bloc/profile_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker_widget/enum/image_picker_widget_shape.dart';
import 'package:image_picker_widget/image_picker_widget.dart';
import 'package:founderslink/ui/profile/data/models/niches_response.dart';
import 'package:founderslink/ui/profile/data/models/interest_response.dart';
import 'package:founderslink/ui/controller/user_data_provider.dart';
import 'package:get/get.dart';

enum LockPref {
  yes,
  no,
}

const String defaultAvatar =
    "https://img.pngio.com/fileblank-avatarpng-georgian-civil-code-commentary-avatarpng-400_400.png";

class EditUserProfile extends StatefulWidget {
  @override
  _EditUserProfileState createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  var lockPref = LockPref.yes;

  UserDataController _userDataController = Get.find<UserDataController>();
  List<Niches> userNiches = <Niches>[];
  List<Interests> userInterests = <Interests>[];
  List<Niches> niches = <Niches>[];
  List<Interests> interests = <Interests>[];




  File selectedImage;

  final _bloc = ProfileBloc();


  String _userName = '';
  String get _fName =>  _userName.split(" ")[0];
  String get _lName =>  _userName.split(" ")[1];
  String _userTitle = '';
  String _userBio = '';


  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  void initState() {
    super.initState();
    userNiches.addAll(_userDataController.userPayload.value.data.niches);

    print("${userNiches[0].name} ${userNiches[1].name}  ${userNiches[2].name}");
    userInterests.addAll(_userDataController.userPayload.value.data.interests);
    print(userInterests.length);
    print("${userInterests[0].name} ${userInterests[1].name}  ${userInterests[2].name}");
    _bloc.add(GetNichesAndInterestEvent());
  }


  void setNicheAndInterestFromAPi({String type, NichesResponse nicheResponse,
    InterestsResponse interestResponse}){
    interests.addAll(interestResponse.data);
    switch (type){
      case "founder":niches.addAll(nicheResponse.data.founder);
      interests.addAll(interestResponse.data);
      break;
      case "student":niches.addAll(nicheResponse.data.student);
      break;
      case "investor":niches.addAll(nicheResponse.data.investor);
      break;
      case "team member":niches.addAll(nicheResponse.data.teamMember);
      break;
    }
  }

  void updateProfile(){
    // if(_fName.isEmpty && _lName.isEmpty && _userBio.isEmpty && _userTitle.isEmpty&&
    // userNiches==_userDataController.loginPayload.value.data.niches &&
    // userInterests==_userDataController.loginPayload.value.data.interests) {
    //   flutterToast("No New Input", true);
    // }else {
      _bloc.add(UpdateProfileEvent(bio:_userBio, title: _userTitle,niches: userNiches.map((e) => e.id).toList(), lName: _lName, fName: _fName,
          interests: userInterests.map((e) => e.id).toList(),));
  //  }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        bottom: false,
        //top: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocListener(
            bloc:_bloc,
            listener:(context,state){
              if(state is Loading){
                progressDialog(context);
              }

              if(state is UpdateUserProfileSuccess){
                Navigator.pop(context); flutterToast("Request Success", false);
              }
              if(state is HasNichesAndInterestState){
                Navigator.pop(context);
                setNicheAndInterestFromAPi(interestResponse: state.interests.getOrElse(() => null),
                nicheResponse: state.niches.getOrElse(() => null),
                    type: _userDataController.userPayload.value.data.type);
                setState(() {

                });
              }


              if(state is ProfileError){
                Navigator.pop(context);
                flutterToast(state.message, true);
              }
            },
            child: Stack(
              children: [

                Container(
                  height: size.height / 7,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.ellipse),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                // Align(alignment:Alignment.topRight,
                //     child: Padding(
                //       padding:EdgeInsets.all(10),
                //       child: TextButton(onPressed: (){
                //         updateProfile();
                //       },child:
                //           Text("Save",style:TextStyle(color:Colors.white, fontSize: 20.sp)),
                //       ),
                //     )),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  margin: EdgeInsets.only(bottom: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppImages.logoWidget,
                        _profile(),
                        _name(),
                        _title(),
                        _tag(),
                        _bio(),
                        _rqst(),
                        _editInterests(),
                        _editNiches(),
                        _actionBtn(onTap: (){
                          updateProfile();
                        },
                          child: Text(
                            "Save",
                            style: GoogleFonts.poppins(fontSize: 12.h, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          color: Colors.blue,
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
                  ),
                ),
              ],
            ),
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
      initialImage: _userDataController.userPayload.value.data.avatarUrl?? defaultAvatar,
      shape: ImagePickerWidgetShape.circle,
      isEditable: true,
      onChange: (File file) {
        if (file != null){
          selectedImage = file;
        }
      },
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
                onChanged: (input){
                  _userName = input;
                },
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
              children: interests.map((e) => InkWell(
                onTap: (){
                  userInterests.contains(e)
                      ? userInterests.remove(e)
                      : userInterests.add(e);
                  if (userInterests.length > 3) {
                    userInterests.removeAt(0);
                  }
              print(userInterests.length);
                  //e.isSelected = !e.isSelected;
                  setState(() {});
                },
                child:buildChip(e.name,img:AppImages.founder, isSelected: userInterests.map((e) => e.name).contains(e.name))
              )).toList()
              // <Widget>[
              //   buildChip('womenfounder',img:AppImages.founder),
              //   buildChip('Founder', img:AppImages.founder),
              //   buildChip('LatinxFounder', img:AppImages.founder),
              //   buildChip('Founder',img: AppImages.founder),
              //   buildChip('Founder',img: AppImages.founder),
              //   buildChip('womenfounder',img: AppImages.founder),
              // ],
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
              children:niches.map((e) => InkWell(
                  onTap: (){
                    userNiches.contains(e)
                        ? userNiches.remove(e)
                        : userNiches.add(e);
                    if (userNiches.length > 3) {
                      userNiches.removeAt(0);
                    }

                    //e.isSelected = !e.isSelected;
                    setState(() {});
                  },
                  child:buildChip(e.name,img:AppImages.founder,
                      isSelected: userNiches.map((e) => e.name).contains(e.name))
              )).toList()
              // <Widget>[
              //   buildChip('womenfounder',img: AppImages.founder),
              //   buildChip('Founder', img:AppImages.founder),
              //   buildChip('LatinxFounder',img: AppImages.founder),
              //   buildChip('Founder',img: AppImages.founder),
              //   buildChip('Founder', img:AppImages.founder),
              //   buildChip('womenfounder', img:AppImages.founder),
              // ],
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
