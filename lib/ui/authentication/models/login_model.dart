import 'package:founderslink/ui/profile/data/models/niches_response.dart';
import 'package:founderslink/ui/profile/data/models/interest_response.dart';

class LoginResponse {
  LoginPayload data;

  LoginResponse({this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new LoginPayload.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class LoginPayload {
  String token;
  int id;
  String firstName;
  String lastName;
  String email;
  String type;
  int pronounId;
  Pronoun pronoun;
  String avatarUrl;
  String createdAt;
  String updatedAt;
  Founder founder;
  Investor investor;
  TeamMember teamMember;
  Student student;
  List<Interests> interests;
  List<Niches> niches;
  List<Industries> industries;

  LoginPayload(
      {this.token,
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.type,
        this.pronounId,
        this.pronoun,
        this.avatarUrl,
        this.createdAt,
        this.updatedAt,
        this.investor,
        this.founder,
        this.teamMember,
        this.student,
        this.interests,
        this.niches,
        this.industries});

  LoginPayload.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    if(json['type']!=null){type = json['type'];}
    pronounId = json['pronoun_id'];
    pronoun =
    json['pronoun'] != null ? new Pronoun.fromJson(json['pronoun']) : null;
    if(json['avatar_url']!=null){avatarUrl = json['avatar_url'];}
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    investor = json['investor'] != null
        ? new Investor.fromJson(json['investor'])
        : null;
    teamMember = json['team_member'] != null
        ? new TeamMember.fromJson(json['team_member'])
        : null;
    student = json['student'] != null
        ? new Student.fromJson(json['student'])
        : null;
    founder = json['founder'] != null
        ? new Founder.fromJson(json['founder'])
        : null;
    if (json['interests'] != null) {
      interests = new List<Interests>();
      json['interests'].forEach((v) {
        interests.add(new Interests.fromJson(v));
      });
    }
    if (json['niches'] != null) {
      niches = new List<Niches>();
      json['niches'].forEach((v) {
        niches.add(new Niches.fromJson(v));
      });
    }
    if (json['industries'] != null) {
      industries = new List<Industries>();
      json['industries'].forEach((v) {
        industries.add(new Industries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['type'] = this.type;
    data['pronoun_id'] = this.pronounId;
    if (this.pronoun != null) {
      data['pronoun'] = this.pronoun.toJson();
    }
    data['avatar_url'] = this.avatarUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.investor != null) {
      data['investor'] = this.investor.toJson();
    }

    if (this.teamMember != null) {
      data['team_member'] = this.teamMember.toJson();
    }

    if (this.student != null) {
      data['student'] = this.student.toJson();
    }
    if (this.founder != null) {
      data['founder'] = this.founder.toJson();
    }
    if (this.interests != null) {
      data['interests'] = this.interests.map((v) => v.toJson()).toList();
    }
    if (this.niches != null) {
      data['niches'] = this.niches.map((v) => v.toJson()).toList();
    }
    if (this.industries != null) {
      data['industries'] = this.industries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pronoun {
  String name;

  Pronoun({this.name});

  Pronoun.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Investor {
  int id;
  int userId;
  String location;
  String createdAt;
  String updatedAt;

  Investor(
      {this.id, this.userId, this.location, this.createdAt, this.updatedAt});

  Investor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['location'] = this.location;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

// class Interests {
//   int id;
//   String name;
//
//   Interests({this.id, this.name});
//
//   Interests.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }

// class Niches {
//   int id;
//   String name;
//   Null emoji;
//
//   Niches({this.id, this.name, this.emoji});
//
//   Niches.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     emoji = json['emoji'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['emoji'] = this.emoji;
//     return data;
//   }
// }


class TeamMember {
  int id;
  int userId;
  String location;
  String createdAt;
  String updatedAt;

  TeamMember(
      {this.id, this.userId, this.location, this.createdAt, this.updatedAt});

  TeamMember.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['location'] = this.location;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
class Student {
  int id;
  int userId;
  int goalId;
  String school;
  String courseOfStudy;
  String location;
  String entrepreneurialExperience;
  String createdAt;
  String updatedAt;

  Student(
      {this.id,
        this.userId,
        this.goalId,
        this.school,
        this.courseOfStudy,
        this.location,
        this.entrepreneurialExperience,
        this.createdAt,
        this.updatedAt});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    goalId = json['goal_id'];
    school = json['school'];
    courseOfStudy = json['course_of_study'];
    location = json['location'];
    entrepreneurialExperience = json['entrepreneurial_experience'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['goal_id'] = this.goalId;
    data['school'] = this.school;
    data['course_of_study'] = this.courseOfStudy;
    data['location'] = this.location;
    data['entrepreneurial_experience'] = this.entrepreneurialExperience;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
class Founder {
  int id;
  int userId;
  int goalId;
  String companyName;
  String title;
  String location;
  String yearsOfExperience;
  String createdAt;
  String updatedAt;

  Founder(
      {this.id,
        this.userId,
        this.goalId,
        this.companyName,
        this.title,
        this.location,
        this.yearsOfExperience,
        this.createdAt,
        this.updatedAt});

  Founder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    goalId = json['goal_id'];
    companyName = json['company_name'];
    title = json['title'];
    location = json['location'];
    yearsOfExperience = json['years_of_experience'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['goal_id'] = this.goalId;
    data['company_name'] = this.companyName;
    data['title'] = this.title;
    data['location'] = this.location;
    data['years_of_experience'] = this.yearsOfExperience;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
class Industries {
  int id;
  String name;

  Industries({this.id, this.name});

  Industries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}