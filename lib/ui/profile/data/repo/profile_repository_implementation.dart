import 'package:dartz/dartz.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:founderslink/core/data/local/constants.dart';
import 'package:founderslink/core/data/local/sharedpreference.dart';
import 'package:founderslink/core/error/faliure.dart';
import 'package:founderslink/ui/authentication/models/login_model.dart';
import 'package:founderslink/ui/authentication/models/signup_response.dart';
import 'package:founderslink/ui/profile/data/models/interest_response.dart';
import 'package:founderslink/ui/profile/data/models/niches_response.dart';
import 'package:founderslink/ui/profile/data/models/profile_response.dart';
import 'package:founderslink/ui/profile/data/remote/profile_remote.dart';
import 'profile_respository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource profileRemote;
  final SharedPreference _sharedPreference;

  ProfileRepositoryImpl(this.profileRemote, this._sharedPreference);

  Future<String> getToken() async {
    LoginResponse response =
        LoginResponse.fromJson(await FlutterSession().get(Constant.USER_INFO));
    return response
        .data.token; //_sharedPreference.getString(Constant.TOKEN_KEY, '');
  }

  saveLoggedInUser(Either<Failure, LoginResponse> value) async {
    LoginResponse response;
    if (value.isRight()) {
      print('save user');
      value.fold((l) => null, (r) => response = r);
      await _sharedPreference.set(Constant.EMAIL_KEY, response.data.email);
      await _sharedPreference.set(Constant.TOKEN_KEY, response.data.token);
      await _sharedPreference.set(
          Constant.FIRST_NAME_KEY, response.data.firstName);
      await _sharedPreference.set(
          Constant.LAST_NAME_KEY, response.data.lastName);
      await _sharedPreference.set(Constant.USER_ID, response.data.id);
    }
  }

  saveRegisteredUser(Either<Failure, SignUpResponse> value) async {
    SignUpResponse response;
    if (value.isRight()) {
      print('saving registered user');
      value.fold((l) => null, (r) => response = r);
      await _sharedPreference.set(Constant.TOKEN_KEY, response.data.token);
      await _sharedPreference.set(
          Constant.FIRST_NAME_KEY, response.data.firstName);
      await _sharedPreference.set(
          Constant.LAST_NAME_KEY, response.data.lastName);
      await _sharedPreference.set(Constant.EMAIL_KEY, response.data.email);
      await _sharedPreference.set(Constant.USER_ID, response.data.id);
    }
  }

  @override
  Future<Either<Failure, ProfileResponse>> getUserProfile() async {
    var token = await getToken();
    return profileRemote.getUserProfile(token: token);
  }

  @override
  Future<Either<Failure, InterestsResponse>> getInterests() {
    return profileRemote.getInterests();
  }

  @override
  Future<Either<Failure, NichesResponse>> getNiches() {
    return profileRemote.getNiches();
  }

  @override
  Future<void> logout() async {
    await _sharedPreference.delete(Constant.USER_INFO);
    await _sharedPreference.delete(Constant.USER_ID);
    await _sharedPreference.delete(Constant.EMAIL_KEY);
    await _sharedPreference.delete(Constant.LAST_NAME_KEY);
    await _sharedPreference.delete(Constant.FIRST_NAME_KEY);
    await _sharedPreference.delete(Constant.TOKEN_KEY);
  }

  @override
  Future<Either<Failure, void>> updateInterests({List<int> interests}) async {
    var token = await getToken();
    return profileRemote.updateInterests(interests: interests, token: token);
  }

  @override
  Future<Either<Failure, void>> updateNiches({List<int> niches}) async {
    var token = await getToken();
    return profileRemote.updateNiches(token: token, niches: niches);
  }

  @override
  Future<Either<Failure, void>> updateUserProfileData(
      {String bio, String title, String fName, String lName}) async {
    var token = await getToken();
    return profileRemote.updateUserProfileData(
        token: token, lName: lName, fName: fName, title: title, bio: bio);
  }

  @override
  Future<Either<Failure, void>> updatePassword(
      {String newPassword, String newPasswordConfirmation}) async {
    var token = await getToken();
    return profileRemote.updatePassword(
        token: token,
        newPassword: newPassword,
        newPasswordConfirmation: newPasswordConfirmation);
  }
}
