import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:founder_link/views/connection_list/connection_list.dart';
import 'package:founder_link/views/homepage/homepage.dart';
import 'package:founder_link/views/profile/profile_edit.dart';
import 'package:founder_link/views/profile/profile_settings.dart';
import 'package:founder_link/views/profile/profile_student/profile_student.dart';
import 'package:founder_link/views/profile/user_profile.dart';
import 'package:get/get.dart';
import 'views/login/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //device preview
      designSize: Size(360, 690),
      builder: () => GetMaterialApp(
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.black,
        ),
        home: ProfileStudent(),
      ),
    );
  }
}
