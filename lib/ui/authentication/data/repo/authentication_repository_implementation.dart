import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:founderslink/core/data/local/constants.dart';
import 'package:founderslink/core/data/local/sharedpreference.dart';
import 'package:founderslink/core/error/faliure.dart';
import 'package:founderslink/ui/authentication/data/remote/authentication_remote.dart';
import 'package:founderslink/ui/authentication/models/goals_response.dart';
import 'package:founderslink/ui/authentication/models/interests_response.dart';
import 'package:founderslink/ui/authentication/models/location_response.dart';
import 'package:founderslink/ui/authentication/models/login_model.dart';
import 'package:founderslink/ui/authentication/models/niche_and_industry_response.dart';
import 'package:founderslink/ui/authentication/models/pronouns_response.dart';
import 'package:founderslink/ui/authentication/models/signup_response.dart';
import 'package:founderslink/ui/authentication/models/universities_model.dart';
import "package:flutter_session/flutter_session.dart";
import 'authentication_respository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationRemoteDataSource authenticationRemote;
  final SharedPreference _sharedPreference;

  AuthenticationRepositoryImpl(
      this.authenticationRemote, this._sharedPreference);

  Future<String> getToken() async{
    LoginResponse response = LoginResponse.fromJson(await FlutterSession().get(Constant.USER_INFO));
    return response.data.token;//_sharedPreference.getString(Constant.TOKEN_KEY, '');
  }

  @override
  Future<void> loginUser({String email, String password}) async {
    return authenticationRemote
        .login(email: email, password: password)
        .then((value) => saveLoggedInUser(value));
    // if(response.isRight()){
    //   saveLoggedInUser(response);
    // }
    // return response;
  }

  @override
  Future<void> signUpUser(
      {String email,
      String password,
      String passwordConfirmation,
      String fName,
      String lName}) {
    return authenticationRemote
        .signUp(
            email: email,
            password: password,
            passwordConfirmation: passwordConfirmation,
            fName: fName,
            lName: lName)
        .then((value) => saveRegisteredUser(value));
  }

  @override
  Future<Either<Failure, List<Suggestion>>> getPlaceSuggestions(String input) {
    return authenticationRemote.getPlaceSuggestions(input);
  }

  @override
  Future<Either<Failure, Place>> getPlaceDetailFromId(String place_id) {
    return authenticationRemote.getPlaceDetailFromId(place_id);
  }

  @override
  Future<void> logout() async{
    await _sharedPreference.delete(Constant.USER_INFO);
    await _sharedPreference.delete(Constant.USER_ID);
    await _sharedPreference.delete(Constant.EMAIL_KEY);
    await _sharedPreference.delete(Constant.LAST_NAME_KEY);
    await _sharedPreference.delete(Constant.FIRST_NAME_KEY);
    await _sharedPreference.delete(Constant.TOKEN_KEY);
  }
  saveLoggedInUser(Either<Failure, LoginResponse> value) async {
    LoginResponse response;
    if (value.isRight()) {
      print('save user');

      value.fold((l) => null, (r) => response = r);

      await FlutterSession().set(Constant.USER_INFO, response);
      // await FlutterSession().set(Constant.TOKEN_KEY, response.data.token);
      //
      // await FlutterSession().set(Constant.EMAIL_KEY, response.data.email);
      // await FlutterSession().set(Constant.FIRST_NAME_KEY, response.data.firstName);
      // await FlutterSession().set(Constant.LAST_NAME_KEY, response.data.lastName);
      // await FlutterSession().set(Constant.USER_ID, response.data.id);

      // await _sharedPreference.set(Constant.EMAIL_KEY, response.data.email);
      // await _sharedPreference.set(Constant.TOKEN_KEY, response.data.token);
      // await _sharedPreference.set(Constant.FIRST_NAME_KEY, response.data.firstName);
      // await _sharedPreference.set(Constant.LAST_NAME_KEY, response.data.lastName);
      // await _sharedPreference.set(Constant.USER_ID, response.data.id);
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
  Future<Either<Failure, NicheAndIndustriesResponse>> getNicheAndIndustries() {
    return authenticationRemote.getNicheAndIndustries();
  }

  @override
  Future<Either<Failure, UniversitiesResponse>> getUniversities() {
    return authenticationRemote.getUniversities();
  }

  @override
  Future<Either<Failure, void>> updateFounderProfile(
      {List<int> niches,
      String title,
      int goal_id,
      String location,
      List<int> interests,
      List<int> industries,
      String years_of_experience,
      String company_name}) async{
    var token = await getToken();
    return authenticationRemote.updateFounderProfile(
        company_name: company_name,
        goal_id: goal_id,
        industries: industries,
        interests: interests,
        location: location,
        niches: niches,
        title: title,
        years_of_experience: years_of_experience, token: token);
  }

  @override
  Future<Either<Failure, void>> updateInvestorProfile(
      {List<int> niches, String location, List<int> industries})async {
    var token = await getToken();
    return authenticationRemote.updateInvestorProfile(
        niches: niches, location: location, industries: industries, token:token);
  }

  @override
  Future<Either<Failure, void>> updateStudentProfile(
      {List<int> niches,
      String school,
      int goal_id,
      String location,
      List<int> interests,
      String entrepreneurial_experience,
      String course_of_study})async {
     var token = await getToken();
    return authenticationRemote.updateStudentProfile(
        location: location,
        niches: niches,
        interests: interests,
        goal_id: goal_id,
        course_of_study: course_of_study,
        entrepreneurial_experience: entrepreneurial_experience,
        school: school, token: token);
  }

  @override
  Future<Either<Failure, void>> updateTeamMemberProfile(
      {List<int> niches,
      int id,
      int user_id,
      String location,
      List<int> industries}) async{
    var token = await getToken();
    return authenticationRemote.updateTeamMemberProfile(
      niches: niches,
      location: location,
      industries: industries,
      id: id,
      user_id: user_id,token:token
    );
  }

  @override
  Future<Either<Failure, void>> UploadProfilePhoto(File file) async{var token = await getToken();
return authenticationRemote.UploadProfilePhoto(file,token:token);
  }

  @override
  Future<Either<Failure, GoalsResponse>> getGoals() {
 return authenticationRemote.getGoals();
  }

  @override
  Future<Either<Failure, InterestsResponse>> getInterests() {
 return authenticationRemote.getInterests();
  }

  @override
  Future<Either<Failure, PronounsResponse>> getPronouns() {
  return authenticationRemote.getPronouns();
  }

  @override
  Future<Either<Failure, void>> setPronoun({int pronoun_id}) async{
    var token = await getToken();
   return authenticationRemote.setPronoun(pronoun_id: pronoun_id, token:token);
  }

}
