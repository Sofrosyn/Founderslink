part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class Loading extends AuthenticationState {}

class HasUniversitiesState extends AuthenticationState {
  final Either<Failure, UniversitiesResponse> response;

  HasUniversitiesState({this.response});
}

class AuthenticationError extends AuthenticationState {
  final String message;

  AuthenticationError({this.message});
}




class FetchingUniversitiesState extends AuthenticationState {}


class LoginSuccess extends AuthenticationState {
  final Either<Failure, LoginResponse> loginObject;

  LoginSuccess({this.loginObject});
}

class HasPlaceId extends AuthenticationState {
  final Either<Failure, List<Suggestion>> response;

  HasPlaceId(this.response);
}

class HasPlaceDetails extends AuthenticationState {
  final Either<Failure, Place> placeDetails;

  HasPlaceDetails(this.placeDetails);
}

class SignUpSuccess extends AuthenticationState {
  final Either<Failure, SignUpResponse> signUpObject;

  SignUpSuccess({this.signUpObject});
}

class HasNicheAndIndustry extends AuthenticationState {
  final Either<Failure, NicheAndIndustriesResponse> response;

  HasNicheAndIndustry({this.response});
}

class UpdateFounderProfileSuccess extends AuthenticationState {}

class UpdateInvestorProfileSuccess extends AuthenticationState {}

class UpdateStudentProfileSuccess extends AuthenticationState {}

class UpdateTeamMemberProfileSuccess extends AuthenticationState {}

class HasGoals extends AuthenticationState {
  final Either<Failure, GoalsResponse> response;

  HasGoals({this.response});
}

class HasPronouns extends AuthenticationState {
  final Either<Failure, PronounsResponse> response;

  HasPronouns({this.response});
}

class HasInterests extends AuthenticationState {
  final Either<Failure, InterestsResponse> response;

  HasInterests({this.response});
}

class HasInterestsAndGoals extends AuthenticationState {
  final Either<Failure, InterestsResponse> interests;
  final Either<Failure, GoalsResponse> goals;
  HasInterestsAndGoals({this.interests,this.goals});
}

class UpdateProfilePhotoSuccess extends AuthenticationState {}
