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
import 'package:founderslink/ui/authentication/models/interests_response.dart';
import 'package:founderslink/ui/authentication/models/pronouns_response.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  AuthenticationState get initialState => AuthenticationInitial();

  Future<List<Suggestion>> fetchSuggestions(String input) async {
    print('input');
    List<Suggestion> suggestions;
    final placeDetailResult =
        await authenticationRepository.getPlaceSuggestions(input);
    placeDetailResult.fold((l) => null, (r) => suggestions = r);
    return suggestions;
  }

  Future<Place> fetchDetailsFromId(String input) async {
    Place place;
    final placeDetailResult =
        await authenticationRepository.getPlaceDetailFromId(input);
    placeDetailResult.fold((l) => null, (r) => place = r);
    return place;
  }

  final authenticationRepository =
      AuthenticationModuleInjector.resolve<AuthenticationRepository>();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is LoginEvent) {
      yield Loading();

      try {
        print('22');
        final loginResponse = await authenticationRepository.loginUser(
            password: event.password, email: event.email);
        print('333');
        // if(loginResponse.isRight()){
        yield LoginSuccess();
        //}else{
        // var msg; loginResponse.fold((l) => msg, (r) => null);
        //  yield AuthenticationError(message:"error");
        // }
        print('44');
      } catch (e) {
        yield AuthenticationError(
            message: jsonDecode(e.toString())['message'].toString());
      }
    }

    if (event is SignupEvent) {
      yield Loading();

      try {
        await authenticationRepository.signUpUser(
            fName: event.fName,
            lName: event.lName,
            password: event.password,
            email: event.email,
            passwordConfirmation: event.password_confirmation);
        yield SignUpSuccess();
      } catch (e) {
        yield AuthenticationError(
            message: jsonDecode(e.toString())['message'].toString());
      }
    }

    if (event is GetPlaceIdEvent) {
      try {
        final _placeDetailResult =
            await authenticationRepository.getPlaceSuggestions(event.input);
        yield HasPlaceId(_placeDetailResult);
      } catch (error) {
        yield AuthenticationError(
            message: jsonDecode(error.toString())['message'].toString());
      }
    }

    if (event is GetPlaceDetailsEvent) {
      try {
        var _response =
            await authenticationRepository.getPlaceDetailFromId(event.id);
        yield HasPlaceDetails(_response);
      } catch (error) {
        yield AuthenticationError(
            message: jsonDecode(error.toString())['message'].toString());
      }
    }

    if (event is GetNicheAndIndustryEvent) {
      yield Loading();
      try {
        var _response = await authenticationRepository.getNicheAndIndustries();
        yield HasNicheAndIndustry(response: _response);
      } catch (error) {
        yield AuthenticationError(
            message: jsonDecode(error.toString())['message'].toString());
      }
    }

    if (event is GetUniversitiesEvent) {
      try {
        var _response = await authenticationRepository.getUniversities();
        yield HasUniversitiesState(response: _response);
      } catch (error) {
        yield AuthenticationError(
            message: jsonDecode(error.toString())['message'].toString());
      }
    }

    if (event is UpdateFounderProfile) {
      yield Loading();
      try {
        var _response = await authenticationRepository.updateFounderProfile(
            industries: event.industries,
            location: event.location,
            niches: event.niches,
            goal_id: event.goal_id,
            interests: event.interests,
            years_of_experience: event.years_of_experience,
            title: event.title,
            company_name: event.company_name);
        yield UpdateFounderProfileSuccess();
      } catch (error) {
        yield AuthenticationError(
            message: jsonDecode(error.toString())['message'].toString());
      }
    }

    if (event is UpdateInvestorProfileEvent) {
      yield Loading();
      try {
        var _response = await authenticationRepository.updateInvestorProfile(
          industries: event.industries,
          location: event.location,
          niches: event.niches,
        );
        yield UpdateInvestorProfileSuccess();
      } catch (error) {
        yield AuthenticationError(
            message: jsonDecode(error.toString())['message'].toString());
      }
    }

    if (event is UpdateTeamMemberProfile) {
      yield Loading();
      try {
        var _response = await authenticationRepository.updateTeamMemberProfile(
            industries: event.industries,
            location: event.location,
            niches: event.niches,
            user_id: event.user_id,
            id: event.id);
        yield UpdateTeamMemberProfileSuccess();
      } catch (error) {
        yield AuthenticationError(
            message: jsonDecode(error.toString())['message'].toString());
      }
    }

    if (event is UpdateStudentProfile) {
      try {
        yield Loading();
        var _response = await authenticationRepository.updateStudentProfile(
          location: event.location,
          niches: event.niches,
          goal_id: event.goal_id,
          interests: event.interests,
          school: event.school,
          entrepreneurial_experience: event.entrepreneurial_experience,
          course_of_study: event.course_of_study,
        );
        yield UpdateStudentProfileSuccess();
      } catch (error) {
        yield AuthenticationError(
            message: jsonDecode(error.toString())['message'].toString());
      }
    }




    if (event is GetInterestsAndGoalsEvent) {
      yield Loading();
      try {
        var goals = await authenticationRepository.getGoals();
        var interests = await authenticationRepository.getInterests();
        yield HasInterestsAndGoals(goals:goals,interests: interests);
      } catch (error) {
        yield AuthenticationError(
            message: jsonDecode(error.toString())['message'].toString());
      }
    }

    if (event is GetPronounsEvent) {
      yield Loading();
      try {
        var _response = await authenticationRepository.getPronouns();
        yield HasPronouns(response:_response);
      } catch (error) {
        yield AuthenticationError(
            message: jsonDecode(error.toString())['message'].toString());
      }
    }


    // if (event is GetInterestsEvent) {
    //   try {
    //     var _response = await authenticationRepository.getInterests();
    //     yield HasInterests(response:_response);
    //   } catch (error) {
    //     yield AuthenticationError(
    //         message: jsonDecode(error.toString())['message'].toString());
    //   }
    // }

    if (event is UpdateProfilePhotoEvent) {
      yield Loading();
      try {
         await authenticationRepository.setPronoun(pronoun_id:event.pronoun_id);
        var _response = await authenticationRepository.UploadProfilePhoto(event.file);
        yield UpdateProfilePhotoSuccess();
      } catch (error) {
        yield AuthenticationError(
            message: jsonDecode(error.toString())['message'].toString());
      }
    }



  }
}
