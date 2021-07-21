part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class Loading extends ProfileState {}

class HasNichesAndInterestState extends ProfileState{
  final Either<Failure, NichesResponse> niches;
  final Either<Failure, InterestsResponse> interests;

  HasNichesAndInterestState({this.niches, this.interests});
}

class HasProfileState extends ProfileState {
  final Either<Failure, ProfileResponse> response;

  HasProfileState({this.response});
}



class ProfileError extends ProfileState {
  final String message;

  ProfileError({this.message});
}


class UpdatePasswordSuccess extends ProfileState {}

class UpdateUserProfileSuccess extends ProfileState {}