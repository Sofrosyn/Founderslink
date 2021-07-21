import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:founderslink/core/error/faliure.dart';
import 'package:founderslink/ui/authentication/models/location_response.dart';
import 'package:founderslink/ui/authentication/models/login_model.dart';
import 'package:founderslink/ui/authentication/models/niche_and_industry_response.dart';
import 'package:founderslink/ui/authentication/models/universities_model.dart';
import 'package:founderslink/ui/authentication/models/interests_response.dart';
import 'package:founderslink/ui/authentication/models/goals_response.dart';
import 'package:founderslink/ui/authentication/models/pronouns_response.dart';

abstract class AuthenticationRepository {
  Future<void> loginUser({String email, String password});

  Future<void> signUpUser({String email, String password, String passwordConfirmation,
  String fName, String lName});

  Future<Either<Failure, List<Suggestion>>>getPlaceSuggestions(String input);

  Future<Either<Failure, Place>> getPlaceDetailFromId(String place_id);

  Future<Either<Failure, UniversitiesResponse>> getUniversities();
  Future<Either<Failure, NicheAndIndustriesResponse>> getNicheAndIndustries();
  Future<Either<Failure, GoalsResponse>> getGoals();
  Future<void>logout();
  Future<Either<Failure, InterestsResponse>> getInterests();
  Future<Either<Failure, PronounsResponse>> getPronouns();
  Future<Either<Failure, void>> UploadProfilePhoto(File file);
  Future<Either<Failure, void>> setPronoun({int pronoun_id});



  Future<Either<Failure, void>> updateStudentProfile({List<int>niches, String school, int goal_id,String location, List<int>interests,  String entrepreneurial_experience, String course_of_study});
  Future<Either<Failure, void>> updateTeamMemberProfile({List<int>niches, int id, int user_id,String location, List<int> industries});
  Future<Either<Failure, void>> updateInvestorProfile({List<int>niches,String location, List<int>industries});
  Future<Either<Failure, void>> updateFounderProfile({List<int>niches, String title, int goal_id,String location, List<int>interests, List<int> industries,  String years_of_experience, String company_name});


}

