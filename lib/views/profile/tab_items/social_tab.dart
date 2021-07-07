import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:founder_link/HelperClass/dart/heplerclass.dart';
import 'package:google_fonts/google_fonts.dart';

enum RecDocuments {
  yes,
  no,
}

class SocialTab extends StatefulWidget {
  const SocialTab({Key key}) : super(key: key);

  @override
  _SocialTabState createState() => _SocialTabState();
}

class _SocialTabState extends State<SocialTab> {
  var recDocuments = RecDocuments.yes;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _blockedUsersDropdown(),
          _msgSettingsDropdown(),
          _chatSettingsDropdown(),
          _followRqsts(),
          _chatRqsts(),
          _documents(),
          _actionBtn(
            child: Text(
              "Back to Profile",
              style: GoogleFonts.poppins(fontSize: 12.h, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _blockedUsersDropdown() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          Container(
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
                hintText: "Search Users",
              ),
              mode: Mode.DIALOG,
              // showSelectedItem: true,
              items: industryList,
              // label: "Indusry",
              itemAsString: (item) => item,
              hint: "Blocked Users",
              // popupItemDisabled: (String s) => s.startsWith('I'),
              onChanged: (value) {
                // selectedIndustry = value;
              },
            ),
          ),
        ],
      ),
    );
  }

Widget _msgSettingsDropdown() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          Container(
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
                hintText: "Search Settings",
              ),
              mode: Mode.DIALOG,
              // showSelectedItem: true,
              items: industryList,
              // label: "Indusry",
              itemAsString: (item) => item,
              hint: "Message Settings",
              // popupItemDisabled: (String s) => s.startsWith('I'),
              onChanged: (value) {
                // selectedIndustry = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _chatSettingsDropdown() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       
          Container(
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
                hintText: "Search Settings",
              ),
              mode: Mode.DIALOG,
              // showSelectedItem: true,
              items: industryList,
              // label: "Indusry",
              itemAsString: (item) => item,
              hint: "Chat Setting",
              // popupItemDisabled: (String s) => s.startsWith('I'),
              onChanged: (value) {
                // selectedIndustry = value;
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget _followRqsts() {
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
              "Limit Follow Requests (Resets every Month)",
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
                    hintText: "0", hintStyle: TextStyle(color: Colors.grey[200]), border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _chatRqsts() {
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
              "Limit Chat Requests (Resets every Month)",
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
                    hintText: "0", hintStyle: TextStyle(color: Colors.grey[200]), border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _documents() {
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
              "Recieve Documents",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12.h),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 5.h,
              left: 20.h,
              right: 20.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                    onPressed: () {
                      setState(() {
                        recDocuments = RecDocuments.yes;
                      });
                    },
                    label: Text(
                      "Yes",
                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                    ),
                    icon:
                        Icon(Icons.check_circle, color: recDocuments == RecDocuments.yes ? Colors.black : Colors.grey)),
                SizedBox(
                  width: 10.w,
                ),
                TextButton.icon(
                    onPressed: () {
                      setState(() {
                        recDocuments = RecDocuments.no;
                      });
                    },
                    label: Text(
                      "No",
                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                    ),
                    icon:
                        Icon(Icons.check_circle, color: recDocuments == RecDocuments.no ? Colors.black : Colors.grey)),
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
