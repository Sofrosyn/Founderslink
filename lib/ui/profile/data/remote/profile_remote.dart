import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:founderslink/core/data/local/constants.dart';
import 'package:founderslink/core/error/faliure.dart';
import 'package:founderslink/core/network/network_service.dart';
import 'package:founderslink/ui/profile/data/models/interest_response.dart';
import 'package:founderslink/ui/profile/data/models/niches_response.dart';
import 'package:founderslink/ui/profile/data/models/profile_response.dart';

abstract class ProfileRemoteDataSource extends NetworkService {
  ProfileRemoteDataSource(Dio dioClient) : super(dioClient);

  Future<Either<Failure, ProfileResponse>> getUserProfile({String token});

  Future<Either<Failure, InterestsResponse>> getInterests();

  Future<Either<Failure, NichesResponse>> getNiches();

  Future<Either<Failure, void>> updateUserProfileData(
      {String bio, String title, String fName, String lName, String token});

  Future<Either<Failure, void>> updateInterests(
      {List<int> interests, String token});

  Future<Either<Failure, void>> updatePassword(
      {String newPassword, String newPasswordConfirmation, String token});

  Future<Either<Failure, void>> updateNiches({List<int> niches, String token});
}

class ProfileRemoteDatasourceImpl extends ProfileRemoteDataSource {
  ProfileRemoteDatasourceImpl(Dio dioClient) : super(dioClient);

  @override
  Future<Either<Failure, ProfileResponse>> getUserProfile(
      {String token}) async {
    dioClient.options.headers["Authorization"] = "Bearer $token";
    try {
      var response = await dioClient.get("${Constant.STAGING_BASE_URL}profile");
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(ProfileResponse.fromJson(response.data));
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
      var response =
          await dioClient.get("${Constant.STAGING_BASE_URL}interests");
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
  Future<Either<Failure, NichesResponse>> getNiches() async {
    try {
      var response = await dioClient.get("${Constant.STAGING_BASE_URL}niches");
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(NichesResponse.fromJson(response.data));
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
  Future<Either<Failure, void>> updateInterests(
      {List<int> interests, String token}) async {
    try {
      var _data = {"interests": interests};
      dioClient.options.headers["Authorization"] = "Bearer $token";

      var response = await dioClient
          .put("${Constant.STAGING_BASE_URL}profile/interests", data: _data);
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        //return Right(NichesResponse.fromJson(response.data));
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
  Future<Either<Failure, void>> updateNiches(
      {List<int> niches, String token}) async {
    var _data = {
      'niches': niches,
    };

    dioClient.options.headers["Authorization"] = "Bearer $token";
    try {
      var response = await dioClient
          .put("${Constant.STAGING_BASE_URL}profile/niches", data: _data);
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // return Right(NichesResponse.fromJson(response.data));
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
  Future<Either<Failure, void>> updateUserProfileData(
      {String bio,
      String title,
      String fName,
      String lName,
      String token}) async {
    var _data = {
      'bio': bio,
      "title": title,
      "first_name": fName,
      "last_name": lName,
    };
    try {
      dioClient.options.headers["Authorization"] = "Bearer $token";
      var response = await dioClient.put("${Constant.STAGING_BASE_URL}profile",
          data: _data);
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        //  return Right(NichesResponse.fromJson(response.data));
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
  Future<Either<Failure, void>> updatePassword(
      {String newPassword,
      String newPasswordConfirmation,
      String token}) async {
    var _data = {
      'new_password': newPassword,
      "new_password_confirmation": newPasswordConfirmation,
    };

    try {
      dioClient.options.headers["Authorization"] = "Bearer $token";
      var response = await dioClient
          .put("${Constant.STAGING_BASE_URL}profile/password", data: _data);
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        //  return Right(NichesResponse.fromJson(response.data));
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
