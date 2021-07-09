import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:founderslink/core/data/local/constants.dart';
import 'package:founderslink/core/error/faliure.dart';
import 'package:founderslink/core/network/network_service.dart';
import 'package:image_picker/image_picker.dart';

import 'package:founderslink/ui/authentication/models/location_response.dart';
import 'package:founderslink/ui/authentication/models/login_model.dart';
import 'package:founderslink/ui/authentication/models/niche_and_industry_response.dart';
import 'package:founderslink/ui/authentication/models/signup_response.dart';
import 'package:founderslink/ui/authentication/models/universities_model.dart';
import 'package:path/path.dart';
import 'package:founderslink/ui/authentication/models/goals_response.dart';
import 'package:founderslink/ui/authentication/models/pronouns_response.dart';
import 'package:founderslink/ui/authentication/models/interests_response.dart';

abstract class AuthenticationRemoteDataSource extends NetworkService {
  AuthenticationRemoteDataSource(Dio dioClient) : super(dioClient);

  Future<Either<Failure, LoginResponse>> login({String email, String password});

  Future<Either<Failure, SignUpResponse>> signUp(
      {String email,
      String password,
      String passwordConfirmation,
      String fName,
      String lName});

  Future<Either<Failure, List<Suggestion>>> getPlaceSuggestions(String input);

  Future<Either<Failure, Place>> getPlaceDetailFromId(String place_id);

  Future<Either<Failure, void>> UploadProfilePhoto(File file,{String token});

  Future<Either<Failure, void>> updateStudentProfile(
      {List<int> niches,
      String school,
      int goal_id,
      String location,
      List<int> interests,
      String entrepreneurial_experience,
      String course_of_study, String token});

  Future<Either<Failure, void>> updateTeamMemberProfile(
      {List<int> niches,
      int id,
      int user_id,
      String location,
      List<int> industries, String token});

  Future<Either<Failure, void>> updateInvestorProfile(
      {List<int> niches, String location, List<int> industries, String token});

  Future<Either<Failure, void>> updateFounderProfile(
      {List<int> niches,
      String title,
      int goal_id,
      String location,
      List<int> interests,
      List<int> industries,
        String years_of_experience,
      String company_name, String token});

  Future<Either<Failure, NicheAndIndustriesResponse>> getNicheAndIndustries();

  Future<Either<Failure, UniversitiesResponse>> getUniversities();

  Future<Either<Failure, GoalsResponse>> getGoals();
  Future<Either<Failure, void>> setPronoun({int pronoun_id, String token});

  Future<Either<Failure, InterestsResponse>> getInterests();

  Future<Either<Failure, PronounsResponse>> getPronouns();
}

class AuthenticationRemoteDatasourceImpl
    extends AuthenticationRemoteDataSource {
  AuthenticationRemoteDatasourceImpl(Dio dioClient) : super(dioClient);
  static final String apiKey1 = 'AIzaSyCJu2eQBIfx15St_qgpczt_QRhOtHcWhLE';//'AIzaSyBeduVL1B14Vb7gCyU6UDrnwrvhc0ki_7Y';
  static const String apiKey = "AIzaSyAv_1SgIPkKVdzQJ21qFQx6W2hSzzgeKG8";

  @override
  Future<Either<Failure, List<Suggestion>>> getPlaceSuggestions(
      String input) async {
    print('input is $input');
    try {
      var response = await dioClient.get(
          'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$apiKey1'); //&types=address0
      print(response.data);
      print(response.data);
      if (response.data['status'] == 'OK') {
        return Right(response.data['predictions']
            .map<Suggestion>((p) => Suggestion(p['place_id'], p['description']))
            .toList());
      }
      if (response.data['status'] == 'ZERO_RESULTS') {
        return Right([]);
      }
      //result['error_message']
      return Left(ServerFailure());
    } catch (error) {
      print('error in getting suggested input');
      print(error.response.toString());
      throw error.response;
    }
  }

  @override
  Future<Either<Failure, Place>> getPlaceDetailFromId(String place_id) async {
    try {
      var response = await dioClient.get(
          'https://maps.googleapis.com/maps/api/place/details/json?place_id=$place_id&fields=address_component&key=$apiKey1');
      print(response.data);
      if (response.statusCode == 200) {
        print(response.data);
        if (response.data['status'] == 'OK') {
          final components =
              response.data['result']['address_components'] as List<dynamic>;

          // build result
          final place = Place();
          components.forEach((c) {
            final List type = c['types'];
            if (type.contains('street_number')) {
              place.streetNumber = c['long_name'];
            }
            if (type.contains('route')) {
              place.street = c['long_name'];
            }
            if (type.contains('locality')) {
              place.city = c['long_name'];
            }
            if (type.contains('postal_code')) {
              place.zipCode = c['long_name'];
            }
          });
          return Right(place);
        }
        return Left(ServerFailure());
      } else {
        return Left(ServerFailure());
      }
    } catch (error) {
      print('left');
      print(error.response.toString());
      throw error.response;
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> login(
      {String email, String password}) async {
    print('1');
    try {
      var _data = {
        'email': email,
        'password': password.trim(),
      };

      print('2');
      var response = await dioClient.post("${Constant.STAGING_BASE_URL}login",
          data: _data);

      print('3');
      print(response.data);
      print(response.statusCode);

      print('5');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(LoginResponse.fromJson(response.data));
      } else if (response.statusCode == 400) {
        throw "Invalid Login Details";
      } else {
        print('left');
        return Left(ServerFailure());
      }
    } catch (error) {
      print("error message is " + error);
      print(error.response.toString());
      throw error.response;
    }
  }

  @override
  Future<Either<Failure, SignUpResponse>> signUp(
      {String email,
      String password,
      String passwordConfirmation,
      String fName,
      String lName}) async {
    try {
      var _data = {
        'email': email,
        'password': password.trim(),
        'password_confirmation': passwordConfirmation.trim(),
        'first_name': fName,
        'last_name': lName
      };
      var response = await dioClient
          .post("${Constant.STAGING_BASE_URL}register", data: _data);
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(SignUpResponse.fromJson(response.data));
      } else {
        print('left');
        return Left(ServerFailure());
      }
    } catch (error) {
      print('left catch');
      print(error.response.toString());
      throw error.response;
    }
  }

  @override
  Future<Either<Failure, NicheAndIndustriesResponse>>
      getNicheAndIndustries() async {
    try {
      var response = await dioClient.get(
        "${Constant.STAGING_BASE_URL}niches-and-industries",
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(NicheAndIndustriesResponse.fromJson(response.data));
      } else {
        print('left');
        return Left(ServerFailure());
      }
    } catch (error) {
      print('left catch');
      print(error.response.toString());
      throw error.response;
    }
  }

  @override
  Future<Either<Failure, UniversitiesResponse>> getUniversities() async {
    try {
      dioClient.options.headers["X-Parse-Application-Id"] =
          "0Rouv8Ud5Vzs0VWZigViTAYdDGLpKhiPIB0nKOCi";
      dioClient.options.headers["X-Parse-REST-API-Key"] =
          "sM2tiigpZvGd9VRC6iSMJBJ8GHdEeUXh6J613tn4";
      var response = await dioClient.get(
        "https://parseapi.back4app.com/classes/Usuniversitieslist_University",
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(UniversitiesResponse.fromJson(response.data));
      } else {
        print('left');
        return Left(ServerFailure());
      }
    } catch (error) {
      print('left catch');
      print(error.response.toString());
      throw error.response;
    }
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
      String company_name, String token}) async {
    try {
      var _data = {
        'niches': niches,
        'title': title,
        'goal_id': goal_id,
        'location': location,
        'interests': interests,
        'industries': industries,
        'years_of_experience': years_of_experience,
        'company_name': company_name
      };print("token: $token");
      dioClient.options.headers["Authorization"] = "Bearer ${token}";
      var response = await dioClient
          .put("${Constant.STAGING_BASE_URL}profile/founder", data: _data);
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        //return Right(SignUpResponse.fromJson(response.data));
      } else {
        print('left');
        return Left(ServerFailure());
      }
    } catch (error) {
      print('left catch');
      print(error.response.toString());
      throw error.response;
    }
  }

  @override
  Future<Either<Failure, void>> updateInvestorProfile(
      {List<int> niches, String location, List<int> industries,String token}) async {
    try {
      var _data = {
        'niches': niches,
        'industries': industries,
        'location': location,
      };

      print("token: $token");
      dioClient.options.headers["Authorization"] = "Bearer ${token}";
      var response = await dioClient
          .put("${Constant.STAGING_BASE_URL}profile/investor", data: _data);
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        //return Right(SignUpResponse.fromJson(response.data));
      } else {
        print('left');
        return Left(ServerFailure());
      }
    } catch (error) {
      print('left catch');
      print(error.response.toString());
      throw error.response;
    }
  }

  @override
  Future<Either<Failure, void>> updateStudentProfile(
      {List<int> niches,
      String school,
      int goal_id,
      String location,
      List<int> interests,
      String entrepreneurial_experience,
      String course_of_study, String token}) async {
    try {
      print("token: $token");
      dioClient.options.headers["Authorization"] = "Bearer ${token}";
      var _data = {
        'niches': niches,
        'school': school,
        'goal_id': goal_id,
        'location': location,
        'interests': interests,
        'entrepreneurial_experience': entrepreneurial_experience,
        'course_of_study': course_of_study,
      };
      var response = await dioClient
          .put("${Constant.STAGING_BASE_URL}profile/student", data: _data);
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        //return Right(SignUpResponse.fromJson(response.data));
      } else {
        print('left');
        return Left(ServerFailure());
      }
    } catch (error) {
      print('left catch');
      print(error.response.toString());
      throw error.response;
    }
  }

  @override
  Future<Either<Failure, void>> updateTeamMemberProfile(
      {List<int> niches,
      int id,
      int user_id,
      String location,
      List<int> industries, String token}) async {
    try {
      var _data = {
        'niches': niches,
        'id': id,
        'user_id': user_id,
        'location': location,
        'location': location,
        'industries': industries,
      };

      print("token: $token");
      dioClient.options.headers["Authorization"] = "Bearer ${token}";

      var response = await dioClient
          .put("${Constant.STAGING_BASE_URL}profile/team-member", data: _data);
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        //return Right(SignUpResponse.fromJson(response.data));
      } else {
        print('left');
        return Left(ServerFailure());
      }
    } catch (error) {
      print('left catch');
      print(error.response.toString());
      throw error.response;
    }
  }

  @override
  Future<Either<Failure, void>> UploadProfilePhoto(File file, {String token}) async {
    try {
      FormData formData = new FormData.fromMap({
        "picture": await MultipartFile.fromFile(file.path,
            filename: basename(file.path))
      });print("token: $token");
      dioClient.options.headers["Authorization"] = "Bearer ${token}";
      var response = await dioClient.post(
          "${Constant.STAGING_BASE_URL}profile/profile-picture",
          data: formData);
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        //return Right(SignUpResponse.fromJson(response.data));
      } else {
        print('left');
        return Left(ServerFailure());
      }
    } catch (error) {
      print('left catch');
      print(error.response.toString());
      throw error.response;
    }
  }

  @override
  Future<Either<Failure, GoalsResponse>> getGoals() async {
    try {
      var response = await dioClient.get(
        "${Constant.STAGING_BASE_URL}goals",
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(GoalsResponse.fromJson(response.data));
      } else {
        print('left');
        return Left(ServerFailure());
      }
    } catch (error) {
      print('left catch');
      print(error.response.toString());
      throw error.response;
    }
  }

  @override
  Future<Either<Failure, InterestsResponse>> getInterests() async {
    try {
      var response = await dioClient.get(
        "${Constant.STAGING_BASE_URL}interests",
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(InterestsResponse.fromJson(response.data));
      } else {
        print('left');
        return Left(ServerFailure());
      }
    } catch (error) {
      print('left catch');
      print(error.response.toString());
      throw error.response;
    }
  }

  @override
  Future<Either<Failure, PronounsResponse>> getPronouns() async {
    try {
      var response = await dioClient.get(
        "${Constant.STAGING_BASE_URL}pronouns",
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(PronounsResponse.fromJson(response.data));
      } else {
        print('left');
        return Left(ServerFailure());
      }
    } catch (error) {
      print('left catch');
      print(error.response.toString());
      throw error.response;
    }
  }

  @override
  Future<Either<Failure, void>> setPronoun({int pronoun_id, String token}) async{
    try {
      var _data = {
        'pronoun_id':pronoun_id
      };
      print("token: $token");
      dioClient.options.headers["Authorization"] = "Bearer ${token}";
      var response = await dioClient
          .put("${Constant.STAGING_BASE_URL}profile/pronoun", data: _data);
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        //return Right(SignUpResponse.fromJson(response.data));
      } else {
        print('left');
        return Left(ServerFailure());
      }
    } catch (error) {
      print('left catch');
      print(error.response.toString());
      throw error.response;
    }
  }
}
