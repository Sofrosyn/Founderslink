import 'package:flutter_session/flutter_session.dart';
import 'package:founderslink/core/data/local/constants.dart';
import 'package:founderslink/ui/authentication/models/login_model.dart';
import 'package:founderslink/ui/profile/data/models/profile_response.dart';
import 'package:get/state_manager.dart';

class UserDataController extends GetxController{

Rx<LoginResponse> loginPayload = LoginResponse().obs;


Rx<ProfileResponse> userPayload = ProfileResponse().obs;


getLoginPayload()async{
  LoginResponse response = LoginResponse.fromJson(await FlutterSession().get(Constant.USER_INFO));
  loginPayload = response.obs;
}

@override
  void onInit() {
super.onInit();
getLoginPayload();
  }
}