import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:founderslink/HelperClass/dart/heplerclass.dart';
import 'package:founderslink/ui/authentication/views/login/login.dart';
import 'package:founderslink/ui/profile/bloc/profile_bloc.dart';
import 'package:founderslink/ui/profile/presentation/tab_items/profile_tab.dart';
import 'package:founderslink/ui/profile/presentation/tab_items/social_tab.dart';
import 'package:founderslink/ui/profile/presentation/tab_items/subcriptions_tab.dart';
import 'package:get/get.dart';
import 'package:image_picker_widget/enum/image_picker_widget_shape.dart';
import 'package:image_picker_widget/image_picker_widget.dart';

const String defaultAvatar =
    "https://img.pngio.com/fileblank-avatarpng-georgian-civil-code-commentary-avatarpng-400_400.png";

class UserAccountSettings extends StatefulWidget {
  @override
  _UserAccountSettingsState createState() => _UserAccountSettingsState();
}

class _UserAccountSettingsState extends State<UserAccountSettings> with SingleTickerProviderStateMixin {
  TabController _controller;
  int _selectedIndex = 1;

  final _bloc = ProfileBloc();


  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  List<Widget> list = [
    Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.social_1,
            width: 15.w,
            height: 20.h,
          ),
          SizedBox(width: 5.w),
          Text(
            "Social",
            style: TextStyle(fontSize: 12.sp, color: Colors.black),
          ),
        ],
      ),
    ),
    Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.user_1,
            width: 15.w,
            height: 20.h,
          ),
          SizedBox(width: 5.w),
          Text(
            "Profile",
            style: TextStyle(fontSize: 12.sp, color: Colors.black),
          ),
        ],
      ),
    ),
    Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset(
          //   AppImages.subscription_1,
          //   width: 15.w,
          //   height: 20.h,
          // ),
          //SizedBox(width: 5.w),
          Text(
            "Subcriptions",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12.sp, color: Colors.black),
          ),
        ],
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Stack(
          children: [
            Container(
              height: size.height / 6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.ellipse),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              margin: EdgeInsets.only(bottom: 30),
              child: Column(mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppImages.logoWidget,
                  _profile(),
                  _tabBar(),
                  _tabBarView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
      diameter: 80.r,
      initialImage: defaultAvatar,
      shape: ImagePickerWidgetShape.circle,
      isEditable: false,
    );
  }

  Widget _tabBar() {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 20, 0, 10),
      height: 40.h,
      width:double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: AppColor.grey, borderRadius: BorderRadius.circular(5)),
      child: TabBar(
        indicatorColor: Colors.black,
        onTap: (index) {
          // Should not used it as it only called when tab options are clicked,
          // not when user swapped
        },
        controller: _controller,
        tabs: list,
      ),
    );
  }

  Widget _tabBarView() {
    return Expanded(
      child: TabBarView(
        controller: _controller,
        children: [
          SocialTab(),
          ProfileTab(logoutFunction:(){
            Get.to(Login());
            _bloc.add(LogoutEvent());
          } ,),
          SubcriptionsTab(),
        ],
      ),
    );
  }
}
