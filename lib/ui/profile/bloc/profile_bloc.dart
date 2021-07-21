
import 'dart:async';
import 'dart:convert';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:founderslink/core/di/authentication_module/authentication_module_injector.dart';
import 'package:founderslink/core/error/faliure.dart';
import 'package:founderslink/ui/authentication/data/repo/authentication_respository.dart';
import 'package:founderslink/ui/authentication/models/location_response.dart';
import 'package:founderslink/ui/authentication/models/login_model.dart';
import 'package:founderslink/ui/authentication/models/universities_model.dart';
import 'package:founderslink/ui/authentication/models/niche_and_industry_response.dart';
import 'package:founderslink/ui/authentication/models/signup_response.dart';
import 'package:founderslink/ui/authentication/models/goals_response.dart';
import 'package:founderslink/ui/authentication/models/pronouns_response.dart';
import 'package:founderslink/ui/profile/data/models/niches_response.dart';
import 'package:founderslink/ui/profile/data/models/profile_response.dart';
import 'package:founderslink/ui/profile/data/models/interest_response.dart';
import 'package:founderslink/ui/profile/data/repo/profile_respository.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc
    extends Bloc<ProfileEvent, ProfileState> {
  @override
  ProfileState get initialState => ProfileInitial();



  final profileRepository =
      AuthenticationModuleInjector.resolve<ProfileRepository>();

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {

    if (event is GetUserProfileEvent) {
      yield Loading();

      try {
        final result = await profileRepository.getUserProfile();
        yield HasProfileState(response: result);

      } catch (e) {
        yield ProfileError(
            message: jsonDecode(e.toString())['message'].toString());
      }
    }




    if (event is GetNichesAndInterestEvent) {
      yield Loading();

      try {
        final niches = await profileRepository.getNiches();
        final interests = await profileRepository.getInterests();
        yield HasNichesAndInterestState(niches: niches, interests: interests);
      } catch (e) {
        yield ProfileError(
            message: jsonDecode(e.toString())['message'].toString());
      }
    }


    if(event is LogoutEvent){
       profileRepository.logout();
    }



    if (event is UpdatePasswordEvent) {
      yield Loading();

      try {
         await profileRepository.updatePassword(newPassword: event.newPassword,
            newPasswordConfirmation: event.newConfirmPassword);
        yield UpdatePasswordSuccess();
      } catch (e) {
        yield ProfileError(
            message: jsonDecode(e.toString())['message'].toString());
      }
    }




    if (event is UpdateProfileEvent) {
      yield Loading();

      try {
         await profileRepository.updateUserProfileData(bio: event.bio,title: event.title,
             fName: event.fName, lName: event.lName);
         await profileRepository.updateNiches(niches: event.niches);
         await profileRepository.updateInterests(interests: event.interests);
        yield UpdateUserProfileSuccess();
      } catch (e) {
        yield ProfileError(
            message: jsonDecode(e.toString())['message'].toString());
      }
    }







  }
}
