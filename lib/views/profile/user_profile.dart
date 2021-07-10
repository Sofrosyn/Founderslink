import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:founderslink/HelperClass/dart/heplerclass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cart_stepper/cart_stepper.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  int _counterNum = 0, _counterMin=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black), onPressed: () => Navigator.of(context).pop()),
          ],
        ),
        title: Text(
          "Edit office hours/ Events",
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        actions: [
          GestureDetector(child: Icon(Icons.more_vert, color: Colors.grey), onTap: () {}),
          SizedBox(
            width: 5.w,
          ),
          GestureDetector(child: Icon(Icons.notifications_none, color: Colors.black), onTap: () {}),
          SizedBox(
            width: 10.w,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.grey,
              ),
              child: ListTile(
                  title: Text(
                    "Start Time",
                    style: GoogleFonts.poppins(color: Colors.black, fontSize: 16.sp),
                  ),
                  subtitle: Text(
                    "(Select Time and Date)",
                    style: GoogleFonts.poppins(color: Colors.grey, fontSize: 16.sp),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                  )),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.grey,
              ),
              child: ListTile(
                  title: Text(
                    "Repeat",
                    style: GoogleFonts.poppins(color: Colors.black, fontSize: 16.sp),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Never",
                        style: GoogleFonts.poppins(color: Colors.grey, fontSize: 16.sp),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 20,
                      ),
                    ],
                  )),
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.grey,
                ),
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Number of slots",
                          style: GoogleFonts.poppins(color: Colors.black, fontSize: 16.sp),
                        ),
                        CartStepper(
                          activeBackgroundColor: Colors.grey,
                          count: _counterNum,
                          didChangeCount: (count) {
                            setState(() {
                              _counterNum = count;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Min per slot",
                          style: GoogleFonts.poppins(color: Colors.black, fontSize: 16.sp),
                        ),

                                                CartStepper(
                          activeBackgroundColor: Colors.grey,
                          count: _counterMin,
                          didChangeCount: (count) {
                            setState(() {
                              _counterMin = count;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                )),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.grey,
                ),
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Privacy",
                      style: GoogleFonts.poppins(color: Colors.black, fontSize: 16.sp),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                AppImages.private,
                                width: 40.r,
                                height: 40.r,
                              ),
                              Text(
                                "Private",
                                style: GoogleFonts.poppins(color: Colors.black, fontSize: 16.sp),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                AppImages.public,
                                width: 40.r,
                                height: 40.r,
                              ),
                              Text(
                                "Public",
                                style: GoogleFonts.poppins(color: Colors.black, fontSize: 16.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.grey,
                ),
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Agenda",
                      style: GoogleFonts.poppins(color: Colors.black, fontSize: 16.sp),
                    ),
                    Text(
                      "lorem ipsum lorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsum",
                      style: GoogleFonts.poppins(color: Colors.grey, fontSize: 10.sp),
                    ),
                  ],
                )),
            Container(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _actionBtn(
                  child: Text(
                    "Save Changes",
                    style: GoogleFonts.poppins(fontSize: 12.h, color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  color: AppColor.blueLight,
                ),
                SizedBox(
                  height: 10.h,
                ),
                _actionBtn(
                  child: Text(
                    "Delete Event ",
                    style: GoogleFonts.poppins(fontSize: 12.h, color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  color: Colors.red,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget _actionBtn({child, onTap, color}) {
    return Container(
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
