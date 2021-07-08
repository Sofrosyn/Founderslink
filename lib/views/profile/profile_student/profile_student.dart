import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:founder_link/HelperClass/dart/heplerclass.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:founder_link/views/profile/set_profile.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileStudent extends StatefulWidget {
  @override
  _ProfileStudentState createState() => _ProfileStudentState();
}

class _ProfileStudentState extends State<ProfileStudent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      right: true,
      bottom: false,
      left: true,
      top: false,
      child: Scaffold(
        //  bottomNavigationBar: bottombar(),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                // color: Colors.grey.withOpacity(0.5),
                image: DecorationImage(
                  image: AssetImage(
                    AppImages.bg_student,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                // image: DecorationImage(
                //   image: AssetImage(
                //     AppImages.bg_student,
                //   ),
                //   fit: BoxFit.fill,
                // ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(10, 40, 10, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _logo(),
                    _profile(),
                    _chipBlockVc(),
                    _experience(),
                    _raisedBtn(),
                    _interestText(),
                    _industry(),
                    _officeTxt(),
                    _officeDetails(),
                    _pastevents(),
                    _meetUp()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _logo() {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        AppImages.logo,
        width: 150.w,
      ),
    );
  }

  Widget _profile() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      SizedBox(
        width: 10.w,
      ),
      CircleAvatar(
        radius: 30.r,
        backgroundImage: NetworkImage(defaultAvatar),
      ),
      SizedBox(
        width: 10.w,
      ),
      Expanded(
        child: Container(
          margin: EdgeInsets.only(
            top: 20.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Sarah Liger ",
                    style: GoogleFonts.poppins(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "(She/Her)",
                    style: GoogleFonts.poppins(
                        color:  Color(0xff5EF4FE), fontSize: 12.sp, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Text(
                "CEO / Founder @ Silicon Valley ",
                style: GoogleFonts.poppins(
                  fontSize: 10.sp,
                ),
              ),
              Text(
                "Dener,CO",
                style: GoogleFonts.poppins(
                  fontSize: 10.sp,
                ),
              ),
              buildChip('Student', color: AppColor.chipyellow),
            ],
          ),
        ),
      ),
    ]);
  }

  Widget _chipBlockVc() {
    return Wrap(
      spacing: 5.h,
      runSpacing: 5.h,
      children: [
        buildChip("BlackVC", color: AppColor.grey),
        buildChip("BlackFounder", color: AppColor.grey),
        buildChip("Advisor", color: AppColor.grey),
      ],
    );
  }

  Widget _experience() {
    return FittedBox(
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.all(5.h),
              child: Text("Experience", style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 12.sp))),
          Container(
            // height: 25.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "Less than 1 year",
                style: GoogleFonts.poppins(fontSize: 8.sp),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(5.h),
              child: Text("Connections", style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 12.h))),
          Container(
              child: Wrap(children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 10.r,
                  backgroundImage: NetworkImage(defaultAvatar),
                ),
                CircleAvatar(
                  radius: 10.r,
                  backgroundImage: NetworkImage(defaultAvatar),
                ),
                CircleAvatar(
                  radius: 10.r,
                  backgroundImage: NetworkImage(defaultAvatar),
                ),
              ],
            ),
          ])),
          Container(
              padding: EdgeInsets.all(5.h),
              child: Text("500", style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 12.h))),
        ],
      ),
    );
  }

  Widget _raisedBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,    side: BorderSide(
              color: Colors.green,
            )),
            onPressed: () {},
            child: Text(
              "Edit",
              style: GoogleFonts.poppins(color: Colors.green, fontSize: 10.sp),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          flex: 2,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(
                  color: Colors.red,
                )),
            onPressed: () {},
            child: Text("Request Office Hours ", style: GoogleFonts.poppins(color: Colors.red, fontSize: 10.sp)),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(
                  color: Colors.grey[600],
                )),
            onPressed: () {},
            child: Text(
              "Message",
              style: GoogleFonts.poppins(color: Colors.grey[600], fontSize: 10.sp),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
      ],
    );
  }

  Widget _interestText() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Something Interesting about me...",
            style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          Text(
            "Lorem ispum dolor sit amet, conseteture adipiscing elit. Cros auctor lorem eget finibus pretiurm. Ut conseteture mattis ispum id lacinia",
            style: GoogleFonts.poppins(
              fontSize: 10.sp,
            ),
          )
        ],
      ),
    );
  }

  Widget _industry() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Im...",
                  style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                buildChip("Looking for developers", color: Color(0xff5EF4FE)),
                Text(
                  "Interest...",
                  style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    buildChip("Abgle investing"),
                    buildChip("Co-Founding"),
                    buildChip("Team Building"),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Industries",
                style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              Wrap(
                direction: Axis.vertical,
                children: [
                  buildChip("B2B", color: AppColor.chipyellow),
                  buildChip("Social Networking", color: AppColor.chipyellow),
                  buildChip("Messaging", color: AppColor.chipyellow),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }

  Widget _officeTxt() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Text(
        "Your Office hours/Events",
        style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _officeDetails() {
    return Row(
      children: [
        Expanded(
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      radius: 12.r,
                      backgroundImage: NetworkImage(defaultAvatar),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Sarah Liger",
                        style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "CEO/Founder @ Silicon Velly",
                        style: GoogleFonts.poppins(fontSize: 8.sp, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Mon May 5 - 4:00 pm - 30 min - 10 slots left ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 8.h, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      radius: 12.r,
                      backgroundImage: NetworkImage(defaultAvatar),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Sarah Liger",
                        style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "CEO/Founder @ Silicon Velly",
                        style: GoogleFonts.poppins(fontSize: 8.sp, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Mon May 5 - 4:00 pm - 30 min - 10 slots left ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 8.h, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _pastevents() {
    return Container(
      padding: EdgeInsets.only(top: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Past Events",
            style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Add Office hours",
                style: GoogleFonts.poppins(
                  fontSize: 10.sp,
                ),
              ),
              Icon(Icons.add_circle_outline_sharp)
            ],
          )
        ],
      ),
    );
  }

  Widget _meetUp() {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Jun",
                        style: GoogleFonts.poppins(color: AppColor.blue, fontSize: 12.sp),
                      ),
                      Text(
                        "22",
                        style: GoogleFonts.poppins(color: AppColor.blue, fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "7:00 PM",
                        style: GoogleFonts.poppins(fontSize: 10.sp),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10.h),
                    child: Column(
                      children: [
                        Text(
                          "Colorado Founders and Investors Meet and you",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            color: Colors.redAccent,
                            fontSize: 12.sp,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Wrap(
                              spacing: 5.h,
                              direction: Axis.horizontal,
                              children: [
                                buildChip(
                                  "Saas",
                                ),
                                buildChip(
                                  "B2B",
                                ),
                                buildChip(
                                  "Socail Networking",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(child: Icon(Icons.more_horiz_rounded), onTap: () {})
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    spacing: 5.w,
                    children: [
                      CircleAvatar(
                        radius: 12.r,
                        backgroundImage: NetworkImage(defaultAvatar),
                      ),
                      CircleAvatar(
                        radius: 12.r,
                        backgroundImage: NetworkImage(defaultAvatar),
                      ),
                      CircleAvatar(
                        radius: 12.r,
                        backgroundImage: NetworkImage(defaultAvatar),
                      ),
                      CircleAvatar(
                        radius: 12.r,
                        backgroundImage: NetworkImage(defaultAvatar),
                      ),
                    ],
                  ),
                  Container(
                    width: 50.w,
                    height: 20.h,
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)), color: Colors.green),
                    child: GestureDetector(
                      onTap: null,
                      child: Center(
                          child: Text(
                        "Add",
                        style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Lorem ispum dolor sit amet, conseteture adipiscing elit. conseteture  conseteture adipiscing elit.",
              style: GoogleFonts.poppins(fontSize: 10.sp, color: Colors.grey),
            ),
            Wrap(
              spacing: 5.h,
              direction: Axis.horizontal,
              children: [
                buildChip("🌈📈 LGBTQA+Founders"),
                buildChip("👩🏻‍🤝‍Co-Founder"),
              ],
            ),
          ]),
        ));
  }
}
