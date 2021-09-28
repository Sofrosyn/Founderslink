
import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:founderslink/core/di/injector.dart';
import 'package:founderslink/core/error/faliure.dart';
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



  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {

    if (event is GetUserProfileEvent) {
      yield Loading();

      try {
        final result = await sl.get<ProfileRepository>().getUserProfile();
        yield HasProfileState(response: result);

      } catch (e) {
        yield ProfileError(
            message: jsonDecode(e.toString())['message'].toString());
      }
    }




    if (event is GetNichesAndInterestEvent) {
      yield Loading();

      try {
        final niches = await sl.get<ProfileRepository>().getNiches();
        final interests = await sl.get<ProfileRepository>().getInterests();
        yield HasNichesAndInterestState(niches: niches, interests: interests);
      } catch (e) {
        yield ProfileError(
            message: jsonDecode(e.toString())['message'].toString());
      }
    }


    if(event is LogoutEvent){
      sl.get<ProfileRepository>().logout();
    }



    if (event is UpdatePasswordEvent) {
      yield Loading();

      try {
         await sl.get<ProfileRepository>().updatePassword(newPassword: event.newPassword,
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
         await sl.get<ProfileRepository>().updateUserProfileData(bio: event.bio,title: event.title,
             fName: event.fName, lName: event.lName);
         await sl.get<ProfileRepository>().updateNiches(niches: event.niches);
         await sl.get<ProfileRepository>().updateInterests(interests: event.interests);
        yield UpdateUserProfileSuccess();
      } catch (e) {
        yield ProfileError(
            message: jsonDecode(e.toString())['message'].toString());
      }
    }







  }
}
