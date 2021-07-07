import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:founder_link/HelperClass/dart/heplerclass.dart';
import 'package:founder_link/views/profile/profile_edit.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnectionList extends StatefulWidget {
  const ConnectionList({Key key}) : super(key: key);

  @override
  _ConnectionListState createState() => _ConnectionListState();
}

class _ConnectionListState extends State<ConnectionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
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
          "Your Connections",
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        actions: [
          GestureDetector(child: Icon(Icons.message_outlined, color: Colors.black), onTap: () {}),
          SizedBox(
            width: 10.w,
          ),
          GestureDetector(child: Icon(Icons.date_range_rounded, color: Colors.black), onTap: () {}),
          SizedBox(
            width: 5.w,
          ),
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
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 30.0),
        child: Column(
          children: [
            _search(),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Card(
                          elevation: 0.1,
                          child: ListTile(
                              leading: Transform.translate(
                                offset: Offset(-10, 0),
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 25.r,
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(defaultAvatar),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        height: 8.r,
                                        width: 8.r,
                                        decoration: BoxDecoration(
                                          color: AppColor.blueLight,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              title: Text(
                                "Name of user",
                                style: GoogleFonts.poppins(color: Colors.black),
                              ),
                              subtitle: Text(
                                "Investor in lorem ipsum medai startup",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(),
                              ),
                              trailing: Transform.translate(
                                  offset: Offset(20, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          // mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 32.r,
                                              height: 32.r,
                                              decoration: BoxDecoration(
                                                color: AppColor.greenLight,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child:
                                                  Center(child: Image.asset(AppImages.ping, width: 15.r, height: 15.r)),
                                            ),
                                            Text(
                                              "Ping",
                                              style: GoogleFonts.poppins(fontSize: 8.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          // mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 32.r,
                                              height: 32.r,
                                              decoration: BoxDecoration(
                                                color: AppColor.grey,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child:
                                                  Center(child: Image.asset(AppImages.msg, width: 15.r, height: 15.r)),
                                            ),
                                            Text(
                                              "Message",
                                              style: GoogleFonts.poppins(fontSize: 8.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      GestureDetector(onTap: null, child: Icon(Icons.more_vert))
                                    ],
                                  ))));
                    }))
          ],
        ),
      ),
    );
  }

  Widget _search() {
    return Container(
      margin: EdgeInsets.only(top: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 5.h,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.h)), border: Border.all(color: Colors.grey[300])),
            child: Container(
              margin: EdgeInsets.all(5),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey[400]),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search someone...",
                          fillColor: Colors.white,
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          border: InputBorder.none),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 40.r,
                      height: 40.r,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Image.asset(AppImages.filter, width: 20.r, height: 20.r)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
