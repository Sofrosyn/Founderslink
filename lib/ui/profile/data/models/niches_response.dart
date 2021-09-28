

class NichesResponse {
  Data data;

  NichesResponse({this.data});

  NichesResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Niches> founder;
  List<Niches> investor;
  List<Niches> student;
  List<Niches> teamMember;

  Data({this.founder, this.investor, this.student, this.teamMember});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['founder'] != null) {
      founder = new List<Niches>();
      json['founder'].forEach((v) {
        founder.add(new Niches.fromJson(v));
      });
    }
    if (json['investor'] != null) {
      investor = new List<Niches>();
      json['investor'].forEach((v) {
        investor.add(new Niches.fromJson(v));
      });
    }
    if (json['student'] != null) {
      student = new List<Niches>();
      json['student'].forEach((v) {
        student.add(new Niches.fromJson(v));
      });
    }
    if (json['team member'] != null) {
      teamMember = new List<Niches>();
      json['team member'].forEach((v) {
        teamMember.add(new Niches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.founder != null) {
      data['founder'] = this.founder.map((v) => v.toJson()).toList();
    }
    if (this.investor != null) {
      data['investor'] = this.investor.map((v) => v.toJson()).toList();
    }
    if (this.student != null) {
      data['student'] = this.student.map((v) => v.toJson()).toList();
    }
    if (this.teamMember != null) {
      data['team member'] = this.teamMember.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Niches {
  int id;
  String name;
  Null emoji;

  Niches({this.id, this.name, this.emoji});

  Niches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    emoji = json['emoji'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['emoji'] = this.emoji;
    return data;
  }
}





