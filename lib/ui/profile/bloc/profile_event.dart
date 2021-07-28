part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetUserProfileEvent extends ProfileEvent {}

class GetGoalsEvent extends ProfileEvent {}
class GetNichesAndInterestEvent extends ProfileEvent {
}

class GetInterestsAndGoalsEvent extends ProfileEvent {}

class GetPronounsEvent extends ProfileEvent {}

class GetUniversitiesEvent extends ProfileEvent {}

class LogoutEvent extends ProfileEvent {}

class UpdatePasswordEvent extends ProfileEvent {
  final String newPassword;
  final String newConfirmPassword;
  UpdatePasswordEvent({this.newPassword, this.newConfirmPassword});

}

class UpdateProfileEvent extends ProfileEvent {
  final List<int> niches;
  final List<int>interests;
  final String bio;
  final String fName;
  final String lName;
  final String title;

  UpdateProfileEvent(
      {this.niches,
      this.interests,
      this.bio,
      this.fName,
      this.lName,
      this.title});

}