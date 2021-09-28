import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:founderslink/core/di/injector.dart';
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

    List<Suggestion> suggestions;
    final placeDetailResult =
        await sl.get<AuthenticationRepository>().getPlaceSuggestions(input);
    placeDetailResult.fold((l) => null, (r) => suggestions = r);
    return suggestions;
  }

  Future<Place> fetchDetailsFromId(String input) async {
    Place place;
    final placeDetailResult =
        await sl.get<AuthenticationRepository>().getPlaceDetailFromId(input);
    placeDetailResult.fold((l) => null, (r) => place = r);
    return place;
  }



  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is LoginEvent) {
      yield Loading();

      try {
     await sl.get<AuthenticationRepository>().loginUser(
            password: event.password, email: event.email);

        yield LoginSuccess();

      } catch (e) {
        yield AuthenticationError(
            message: jsonDecode(e.toString())['message'].toString());
      }
    }

    if (event is SignupEvent) {
      yield Loading();

      try {
        await sl.get<AuthenticationRepository>().signUpUser(
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
            await sl.get<AuthenticationRepository>().getPlaceSuggestions(event.input);
        yield HasPlaceId(_placeDetailResult);
      } catch (error) {
        yield AuthenticationError(
            message: jsonDecode(error.toString())['message'].toString());
      }
    }

    if (event is GetPlaceDetailsEvent) {
      try {
        var _response =
            await sl.get<AuthenticationRepository>().getPlaceDetailFromId(event.id);
        yield HasPlaceDetails(_response);
      } catch (error) {
        yield AuthenticationError(
            message: jsonDecode(error.toString())['message'].toString());
      }
    }

    if (event is GetNicheAndIndustryEvent) {
      yield Loading();
      try {
        var _response = await sl.get<AuthenticationRepository>().getNicheAndIndustries();
        yield HasNicheAndIndustry(response: _response);
      } catch (error) {
        yield AuthenticationError(
            message: jsonDecode(error.toString())['message'].toString());
      }
    }

    if (event is GetUniversitiesEvent) {
      yield FetchingUniversitiesState();
      try {
        var _response = await sl.get<AuthenticationRepository>().getUniversities();
        yield HasUniversitiesState(response: _response);
      } catch (error) {
        yield AuthenticationError(
            message: jsonDecode(error.toString())['message'].toString());
      }
    }

    if (event is UpdateFounderProfile) {
      yield Loading();

      try {
        await sl.get<AuthenticationRepository>().updateFounderProfile(
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
        await sl.get<AuthenticationRepository>().updateInvestorProfile(
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
        await sl.get<AuthenticationRepository>().updateTeamMemberProfile(
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
        await sl.get<AuthenticationRepository>().updateStudentProfile(
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
        var goals = await sl.get<AuthenticationRepository>().getGoals();
        var interests = await sl.get<AuthenticationRepository>().getInterests();
        yield HasInterestsAndGoals(goals:goals,interests: interests);
      } catch (error) {
        yield AuthenticationError(
            message: jsonDecode(error.toString())['message'].toString());
      }
    }

    if (event is GetPronounsEvent) {
      yield Loading();
      try {
        var _response = await sl.get<AuthenticationRepository>().getPronouns();
        yield HasPronouns(response:_response);
      } catch (error) {
        yield AuthenticationError(
            message: jsonDecode(error.toString())['message'].toString());
      }
    }




    if (event is UpdateProfilePhotoEvent) {
      yield Loading();
      try {
         await sl.get<AuthenticationRepository>().setPronoun(pronoun_id:event.pronoun_id);
        await sl.get<AuthenticationRepository>().UploadProfilePhoto(event.file);
        yield UpdateProfilePhotoSuccess();
      } catch (error) {
        yield AuthenticationError(
            message: jsonDecode(error.toString())['message'].toString());
      }
    }



  }
}
