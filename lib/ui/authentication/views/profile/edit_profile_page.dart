import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:founderslink/core/ui/widgets/progress_dialog.dart';
import 'package:founderslink/core/ui/widgets/toast.dart';
import 'package:founderslink/ui/authentication/bloc/authentication_bloc.dart';
import 'package:founderslink/ui/authentication/views/login/login_investor/login_investor.dart';
import 'package:founderslink/ui/pages/chat.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker_widget/enum/image_picker_widget_shape.dart';
import 'package:image_picker_widget/image_picker_widget.dart';
import 'package:founderslink/ui/authentication/models/pronouns_response.dart';

import '../../heplerclass.dart';



const String defaultAvatar =
    "https://img.pngio.com/fileblank-avatarpng-georgian-civil-code-commentary-avatarpng-400_400.png";


class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  File selectedImage;

  PronounsResponse _pronounsResponse =PronounsResponse();
  Pronouns _selectedPronoun = Pronouns();


  final _bloc = AuthenticationBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(GetPronounsEvent());
  }
  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        top: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
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

                  if(state is HasPronouns){
                    Navigator.pop(context);
                    state.response.fold((l) => null, (r) => _pronounsResponse=r);
                    setState(() {});
                  }


                  if(state is UpdateProfilePhotoSuccess){
                    Navigator.pop(context);
                    Get.to(() => Chat());
                  }

                  },
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
          selectedImage = file;
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
      child: DropdownSearch<Pronouns>(
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
        items: _pronounsResponse?.data,
        // label: "Indusry",
        itemAsString: (item) => item.name,
        hint: "Choose Pronoun",
        // popupItemDisabled: (String s) => s.startsWith('I'),
        onChanged: (value) {
          _selectedPronoun = value;
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
          if(_selectedPronoun==null){
            flutterToast("Please Select a Pronoun", true);
          }else if(selectedImage==null){
            flutterToast("Please Select an image", true);
          }else {
            _bloc.add(UpdateProfilePhotoEvent(
              pronoun_id: _selectedPronoun.id,
              file: selectedImage
            ));
          }
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
