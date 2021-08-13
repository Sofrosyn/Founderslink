import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:founderslink/core/data/local/constants.dart';
import 'package:founderslink/core/di/injector.dart' as di;
import 'package:founderslink/ui/authentication/models/login_model.dart';
import 'package:founderslink/ui/authentication/provider/login_provider_validation.dart';
import 'package:founderslink/ui/authentication/provider/registration_provider_validation.dart';
import 'package:founderslink/ui/authentication/views/login/login.dart';
import 'package:founderslink/ui/controller/user_data_provider.dart';
import 'package:founderslink/ui/pages/chat.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //initialize dependencies
  await di.initDependencies();


  runApp(

    //declare and initialize providers to be available throughout the project
      MultiProvider(providers: [
        ChangeNotifierProvider<LoginFormProvider>(create: (_) => LoginFormProvider()),
        ChangeNotifierProvider<SignUpFormProvider>(create: (_) => SignUpFormProvider()),
      ],
          child: MyApp())

  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => GetMaterialApp(
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.black,
        ),
       debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'founders Link'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var isLoggedIn = false;
var hasCompletedProfileSetup= false;


@override
  void initState(){
  super.initState();
  checkLoggedInStatus();
}
final requestController = Get.put(UserDataController());

  Future<void> checkLoggedInStatus()async {
    var token = await FlutterSession().get(Constant.USER_INFO);
    print("user token: ${token}");
    if(token !=null){
      isLoggedIn = true;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Chat()));
    }else {
      isLoggedIn = false;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Login()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: isLoggedIn ? Chat():Login()),
    );
  }


}
