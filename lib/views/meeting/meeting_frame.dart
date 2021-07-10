import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:founderslink/HelperClass/dart/heplerclass.dart';
import 'package:founderslink/views/profile/set_profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MeetingFrame extends StatefulWidget {
  @override
  _MeetingFrameState createState() => _MeetingFrameState();
}

class _MeetingFrameState extends State<MeetingFrame> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            children: [
              _text(),
              _hostText(),
              _hostItemList(),
              _stageText(),
              _stageItemList(),
              _audianceText(),
              _audianceItemGrid(),
              _addBtn(),
              _bottomActions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _text() {
    return Container(
      margin: EdgeInsets.only(top: 20.h, left: 20.h, right: 20.h),
      child: Center(
          child: Text(
        "Raising Pre-Seed round for Saas Company",
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(fontSize: 16.h, fontWeight: FontWeight.bold),
      )),
    );
  }

  Widget _hostText() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 20.h,
                  left: 10.h,
                  right: 20.h,
                ),
                child: Text(
                  "Hosts",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 15.h),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 30.h,
                  right: 20.h,
                ),
                child: Text(
                  "59:30",
                  style: GoogleFonts.poppins(fontSize: 12.h),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _hostItemList() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        height: 80.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25.r,
                        backgroundImage: NetworkImage(defaultAvatar),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(height: 10),
                      Text("Aliece")
                    ],
                  ));
            }));
  }

  Widget _stageText() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 10.h,
                  right: 20.h,
                ),
                child: Text(
                  "Stage",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 15.h),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _stageItemList() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        height: 60.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25.r,
                        backgroundImage: NetworkImage(defaultAvatar),
                        backgroundColor: Colors.transparent,
                      ),
                    ],
                  ));
            }));
  }

  Widget _audianceText() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 10.h,
                  right: 20.h,
                ),
                child: Text(
                  "Audiance",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 15.h),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _audianceItemGrid() {
    return Container(
        child: Expanded(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            // crossAxisSpacing: 10,
            // mainAxisSpacing: 10,
            // childAspectRatio: 5/3,
          ),
          itemCount: 12,
          itemBuilder: (context, index) {
            return Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundImage: NetworkImage(defaultAvatar),
                  backgroundColor: Colors.transparent,
                ),
              ],
            ));
          }),
    ));
  }
}

Widget _addBtn() {
  return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {},
        tooltip: 'Add',
        child: Icon(
          Icons.add,
          size: 30.h,
        ),
      ),
    ),
  ]);
}

Widget _bottomActions() {
  return Container(
    // margin: EdgeInsets.only(top: 30.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: BorderSide(
              color: Colors.red,
            )),
            onPressed: () {},
            child: Text(
              "Leave",
              style: GoogleFonts.poppins(color: Colors.red),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.black,
                side: BorderSide(
                  color: Colors.black,
                )),
            onPressed: () {},
            child: Text("Lobby Info", style: GoogleFonts.poppins(color: Colors.white)),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: BorderSide(
              color: Colors.teal,
            )),
            onPressed: () {},
            child: Text(
              "Raised Hand",
              style: GoogleFonts.poppins(color: Colors.teal),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
      ],
    ),
  );
}
