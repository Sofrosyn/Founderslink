part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;

  LoginEvent({this.email, this.password});
}

class GetPlaceIdEvent extends AuthenticationEvent {
  final String input;

  GetPlaceIdEvent(this.input);
}

class GetGoalsEvent extends AuthenticationEvent{}
class GetInterestsAndGoalsEvent extends AuthenticationEvent{}
class GetPronounsEvent extends AuthenticationEvent{}

class UpdateProfilePhotoEvent extends AuthenticationEvent{
  final int pronoun_id;
final File file;

  UpdateProfilePhotoEvent({this.file, this.pronoun_id});
}


class GetPlaceDetailsEvent extends AuthenticationEvent {
  final String id;

  GetPlaceDetailsEvent(this.id);
}

class GetUniversitiesEvent extends AuthenticationEvent {}

class UpdateStudentProfile extends AuthenticationEvent {
  final String location;
  final List<int> interests;
  final String school;
  final int goal_id;
  final String course_of_study;
  final String entrepreneurial_experience;
  final List<int> niches;

  UpdateStudentProfile(
      {this.location,
      this.interests,
      this.school,
      this.goal_id,
      this.course_of_study,
      this.entrepreneurial_experience,
      this.niches});
}

class UpdateFounderProfile extends AuthenticationEvent {
  final List<int> niches;
  final List<int> industries;
  final String location;
  final String title;
  final int goal_id;
  final List<int> interests;
  final String years_of_experience;
  final String company_name;

  UpdateFounderProfile(
      {this.niches,
      this.industries,
      this.location,
      this.title,
      this.goal_id,
      this.interests,
      this.years_of_experience,
      this.company_name});
}

class UpdateTeamMemberProfile extends AuthenticationEvent {
  final int id;
  final List<int> niches;
  final String location;
  final int user_id;
  final List<int> industries;

  UpdateTeamMemberProfile(
      {this.id, this.niches, this.location, this.user_id, this.industries});
}

class UpdateInvestorProfileEvent extends AuthenticationEvent {
  final List<int> niches;
  final String location;
  final List<int> industries;

  UpdateInvestorProfileEvent({this.niches, this.location, this.industries});
}

class SignupEvent extends AuthenticationEvent {
  final String email;
  final String password;
  final String password_confirmation;
  final String fName;
  final String lName;

  SignupEvent(
      {this.email,
      this.password,
      this.password_confirmation,
      this.fName,
      this.lName});
}

class GetNicheAndIndustryEvent extends AuthenticationEvent {}

class SetNicheAndIndustryEvent extends AuthenticationEvent {}
