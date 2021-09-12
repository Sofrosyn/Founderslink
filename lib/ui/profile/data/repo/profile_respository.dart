import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:founderslink/core/error/faliure.dart';
import 'package:founderslink/ui/profile/data/models/interest_response.dart';
import 'package:founderslink/ui/profile/data/models/niches_response.dart';
import 'package:founderslink/ui/profile/data/models/profile_response.dart';
import 'package:founderslink/ui/profile/data/models/user_connections_response.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileResponse>> getUserProfile();
  Future<Either<Failure, ConnectionsSuggestionsResponse>>
      getConnectionSuggestionsProfile();
  Future<Either<Failure, ConnectionsSuggestionsResponse>> createUserConnection(
      {String userId});
  Future<Either<Failure, ConnectionsSuggestionsResponse>> revokeUserConnection(
      {String userId});
  Future<Either<Failure, ConnectionsSuggestionsResponse>> getUserConnections();
  Future<Either<Failure, ConnectionsSuggestionsResponse>> searchUserConnections(
      {String query});
  Future<Either<Failure, InterestsResponse>> getInterests();
  Future<Either<Failure, NichesResponse>> getNiches();
  Future<void> logout();
  Future<Either<Failure, void>> updatePassword(
      {String newPassword, String newPasswordConfirmation});
  Future<Either<Failure, void>> updateUserProfileData({
    String bio,
    String title,
    String fName,
    String lName,
  });
  Future<Either<Failure, void>> updateInterests({
    List<int> interests,
  });
  Future<Either<Failure, void>> updateNiches({
    List<int> niches,
  });
}
