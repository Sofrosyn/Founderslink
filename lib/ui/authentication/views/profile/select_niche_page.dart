import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:founderslink/core/ui/widgets/custom_address.dart';
import 'package:founderslink/core/ui/widgets/progress_dialog.dart';
import 'package:founderslink/core/ui/widgets/toast.dart';
import 'package:founderslink/ui/authentication/bloc/authentication_bloc.dart';
import 'package:founderslink/ui/authentication/models/location_response.dart';
import 'package:founderslink/ui/authentication/models/niche_and_industry_response.dart';
import 'package:founderslink/ui/authentication/views/login/login_student/login_student2.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../heplerclass.dart';
import 'address_search.dart';
import 'company_details_page.dart';
import 'package:founderslink/ui/authentication/models/universities_model.dart';

import 'edit_profile_page.dart';

class SelectNichePage extends StatefulWidget {
  @override
  _SelectNichePageState createState() => _SelectNichePageState();
}

class _SelectNichePageState extends State<SelectNichePage> {
  Industries selectedIndustry;
  String selectedLocation;

  NicheAndIndustriesResponse nicheAndIndustry = NicheAndIndustriesResponse();

  final _bloc = AuthenticationBloc();

  final _selectedAddress = TextEditingController();
  FocusNode node;

  List<UserModel> student = <UserModel>[];
  List<UserModel> teamMember = <UserModel>[];
  List<UserModel> founder = <UserModel>[];
  List<UserModel> investor = <UserModel>[];
  List<UserModel> emptyArray = <UserModel>[];

  UniversitiesResponse universityResponse = UniversitiesResponse();

  Universities selectedUniversity = Universities();
  String selectedCourse = '';

  @override
  void initState() {
    super.initState();
    _bloc.add(GetNicheAndIndustryEvent());
    node = FocusNode();
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

                if (state is HasNicheAndIndustry) {
                  Navigator.pop(context);
                  state.response.fold((l) => null, (r) => nicheAndIndustry = r);
                  populateModels(nicheAndIndustry);
                  setState(() {});
                }

                if (state is HasUniversitiesState) {
                  state.response
                      .fold((l) => null, (r) => universityResponse = r);
                  setState(() {});
                }

                if(state is UpdateTeamMemberProfileSuccess){
                  Navigator.pop(context);Get.to(() => EditProfilePage());
                }


                if(state is UpdateInvestorProfileSuccess){
                  Navigator.pop(context);Get.to(() => EditProfilePage());
                }
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppImages.logoWidget,
                    _userText(),
                    _userType(),
                    _nicheText(),
                    Padding(child:chipList(),padding:EdgeInsets.symmetric(horizontal: 10)),
                    _selectedUserTypeIndex != 1
                        ? _industryDropdown()
                        : SizedBox.shrink(),
                    _selectedUserTypeIndex == 1
                        ? _UniversityDropdown()
                        : SizedBox.shrink(),
                    _selectedUserTypeIndex ==1?
                    _courseDropdown():
                        SizedBox.shrink(),
                    _locationDropdown(),
                    _continueBtn()
                  ],
                ),
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

  Widget _userText() {
    return Container(
      margin: EdgeInsets.only(top: 10.h, bottom: 10.h, right: 20.h, left: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Who are You ?",
              style: GoogleFonts.poppins(
                  fontSize: 15.h, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  int _selectedUserTypeIndex = 0;

  Widget userType({int index, String image, String user}) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            resetSection();
            _selectedUserTypeIndex = index;
            if(index==1){_bloc.add(GetUniversitiesEvent());}
            setState(() {});
          },
          child: Container(
              width: 50.r,
              height: 50.r,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: (_selectedUserTypeIndex == index)
                          ? Colors.blueAccent
                          : Colors.white,
                      width: 2),
                  image: DecorationImage(
                      image: AssetImage(
                    image,
                  ))),
              child: (_selectedUserTypeIndex == index)
                  ? Icon(Icons.check, color: Colors.white, size: 30)
                  : SizedBox.shrink()),
        ),
        Container(
            margin: EdgeInsets.only(top: 5.h),
            child: Text(user,
                style: GoogleFonts.poppins(
                  fontSize: 10.h,
                )))
      ],
    );
  }

  Widget _userType() {
    return Container(
      margin: EdgeInsets.only(top: 10.h, bottom: 10.h, right: 20.h, left: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          userType(image: AppImages.graduate, index: 1, user: "Student"),
          userType(image: AppImages.team, index: 2, user: "Team Member"),
          userType(image: AppImages.founder, index: 3, user: "Founder"),
          userType(image: AppImages.profile, index: 4, user: "Investor"),
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
          Text("What is your Niche ? (max 3)",
              style: GoogleFonts.poppins(
                  fontSize: 15.h, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  List<UserModel> indexOfSelectedItems = <UserModel>[];

  List<UserModel> getSelectedArray() {
    switch (_selectedUserTypeIndex) {
      case 0:
        return emptyArray;
        break;
      case 1:
        return student;
        break;
      case 2:
        return teamMember;
        break;
      case 3:
        return founder;
        break;
      case 4:
        return investor;
        break;
    }
  }

  populateModels(NicheAndIndustriesResponse niche) {
    nicheAndIndustry.data.industries.forEach((element) {
      industriesList.add(element);
    });
    niche.data.niches.founder.forEach((element) {
      print('test 22');
      founder.add(UserModel(id: element.id, name: element.name));
    });

    niche.data.niches.investor.forEach((element) {
      investor.add(UserModel(id: element.id, name: element.name));
    });

    niche.data.niches.student.forEach((element) {
      student.add(UserModel(id: element.id, name: element.name));
    });

    niche.data.niches.teamMember.forEach((element) {
      teamMember.add(UserModel(id: element.id, name: element.name));
    });
  }

  chipList() {
    return Wrap(
        spacing: 5.0,
        runSpacing: 5.0,
        children: getSelectedArray()
            .map((e) => InkWell(
                onTap: () {
                  indexOfSelectedItems.contains(e)
                      ? indexOfSelectedItems.remove(e)
                      : indexOfSelectedItems.add(e);
                  if (indexOfSelectedItems.length > 3) {
                    indexOfSelectedItems.removeAt(0);
                  }

                  e.isSelected = !e.isSelected;
                  setState(() {});
                },
                child: _buildChip(e.name, AppImages.founder,
                    isSelected: indexOfSelectedItems.contains(e))))
            .toList());
  }

  Widget _buildChip(String label, var img, {bool isSelected}) {
    return Chip(
      labelPadding: EdgeInsets.all(2.0),
      avatar: Image.asset(
        img,
        width: 30,
        height: 30,
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: isSelected ? Colors.blue : Colors.grey[200],
      elevation: 1.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(5.0),
    );
  }

  resetSection() {
    student.forEach((element) {
      element.isSelected = false;
    });
    founder.forEach((e) {
      e.isSelected = false;
    });
    investor.forEach((element) {
      element.isSelected = false;
    });
    teamMember.forEach((element) {
      element.isSelected = false;
    });

    indexOfSelectedItems = [];
  }

  List<Industries> industriesList = <Industries>[];

  Widget _industryDropdown() {
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
              "What is your Industry ?",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 12.h),
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
            child: DropdownSearch<Industries>(
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
                hintText: "Search Indusry",
              ),
              mode: Mode.DIALOG,
              // showSelectedItem: true,
              items: industriesList,
              // label: "Indusry",
              itemAsString: (Industries u) => u.name,
              hint: "Choose Indusry",
              // popupItemDisabled: (String s) => s.startsWith('I'),
              onChanged: (value) {
                selectedIndustry = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _UniversityDropdown() {
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
              "What School do you go to ?",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 12.h),
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
            child: DropdownSearch<Universities>(
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
                hintText: "Search School",
              ),
              mode: Mode.DIALOG,
              // showSelectedItem: true,
              items: universityResponse?.results,
              // label: "Indusry",
              itemAsString: (Universities u) => u.name,
              hint: "Choose School",
              // popupItemDisabled: (String s) => s.startsWith('I'),
              onChanged: (value) {
                selectedUniversity = value;
              },
            ),
          ),
        ],
      ),
    );
  }





  Widget _courseDropdown() {
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
              "What Course did you Study ?",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 12.h),
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
                hintText: "Search Course",
              ),
              mode: Mode.DIALOG,
              // showSelectedItem: true,
              items: courseList,
              // label: "Indusry",
              itemAsString: (item) => item,
              hint: "Choose Course",
              // popupItemDisabled: (String s) => s.startsWith('I'),
              onChanged: (value) {
                selectedCourse = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _locationDropdown() {
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
              "Where are You Located ?",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 12.h),
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
            child: InkWell(
              onTap: () async {
                final Suggestion result = await showSearch(
                  context: context,
                  delegate: AddressSearch(),
                );
                if (result != null) {
                  final searchDetail =
                      await _bloc.fetchDetailsFromId(result.placeId);
                  setState(() {
                    _selectedAddress.text = result.description;
                    selectedLocation = result.description;
                  });
                }
              },
              child: IgnorePointer(
                child: CustomAddressField(
                  controller: _selectedAddress,
                  node: node,
                  hint: "Enter Address",
                ),
              ),
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
          if (_selectedUserTypeIndex == 0) {
            flutterToast("Please select a user type", true);
          } else if (indexOfSelectedItems.length == 0) {
            flutterToast("Please select a Niche", true);
          } else if (_selectedAddress.text.isEmpty) {
            flutterToast("Please select a Location", true);
          } else {
            switch (_selectedUserTypeIndex) {
              case 1:
                if (selectedUniversity == null) {
                  flutterToast("Please select a University", true);
                } else if(selectedCourse.isEmpty){
                  flutterToast("Please select a Course", true);
                }else {
                  print(selectedLocation);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LoginStudent2(course: selectedCourse,
                          location: selectedLocation,niches: indexOfSelectedItems.map((e) => e.id).toList(),
                          school: selectedUniversity.name?? "Cambridge University",)));
                }
                break;

                //if the selected user type is investor
              case 4:
                if (selectedIndustry == null) {
                  flutterToast("Please select an Industry", true);
                } else {
                 _bloc.add(UpdateInvestorProfileEvent(niches: indexOfSelectedItems.map((e) => e.id).toList(),
                 location: selectedLocation,industries:<int>[selectedIndustry.id],));
                }
                break;


            //if the selected user type is investor
              case 2:
                if (selectedIndustry == null) {
                  flutterToast("Please select an Industry", true);
                } else {
                  _bloc.add(UpdateTeamMemberProfile(location: selectedLocation,niches: indexOfSelectedItems.map((e) => e.id).toList(),
                  industries:<int>[selectedIndustry.id] ));
                }

                break;
              case 3:
                if (selectedIndustry == null) {
                  flutterToast("Please select an Industry", true);
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CompanyDetailsPage(industries: [selectedIndustry.id],
                      location: selectedLocation,niches: indexOfSelectedItems.map((e) => e.id).toList(),)));
                }

                break;
            }
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

class UserModel {
  int id;
  String name;
  bool isSelected = false;

  UserModel({this.id, this.name, this.isSelected});
}
