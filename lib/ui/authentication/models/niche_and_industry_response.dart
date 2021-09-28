class NicheAndIndustriesResponse {
  NicheAndIndustries data;

  NicheAndIndustriesResponse({this.data});

  NicheAndIndustriesResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new NicheAndIndustries.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class NicheAndIndustries {
  List<Industries> industries;
  Niches niches;


  NicheAndIndustries({this.industries, this.niches});

  NicheAndIndustries.fromJson(Map<String, dynamic> json) {
    if (json['industries'] != null) {
      industries = <Industries>[];
      json['industries'].forEach((v) {
        industries.add(new Industries.fromJson(v));
      });
    }
    niches =
    json['niches'] != null ? new Niches.fromJson(json['niches']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.industries != null) {
      data['industries'] = this.industries.map((v) => v.toJson()).toList();
    }
    if (this.niches != null) {
      data['niches'] = this.niches.toJson();
    }
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

class Niches {
  List<Founder> founder;
  List<Investor> investor;
  List<Student> student;
  List<TeamMember> teamMember;

  Niches({this.founder, this.investor, this.student, this.teamMember});

  Niches.fromJson(Map<String, dynamic> json) {
    if (json['founder'] != null) {
      founder = <Founder>[];
      json['founder'].forEach((v) {
        founder.add(new Founder.fromJson(v));
      });
    }
    if (json['investor'] != null) {
      investor = <Investor>[];
      json['investor'].forEach((v) {
        investor.add(new Investor.fromJson(v));
      });
    }
    if (json['student'] != null) {
      student = <Student>[];
      json['student'].forEach((v) {
        student.add(new Student.fromJson(v));
      });
    }
    if (json['team member'] != null) {
      teamMember = <TeamMember>[];
      json['team member'].forEach((v) {
        teamMember.add(new TeamMember.fromJson(v));
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

class Founder {
  int id;
  String name;
  Null emoji;

  Founder({this.id, this.name, this.emoji});

  Founder.fromJson(Map<String, dynamic> json) {
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



class Investor {
  int id;
  String name;
  Null emoji;

  Investor({this.id, this.name, this.emoji});

  Investor.fromJson(Map<String, dynamic> json) {
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





class Student {
  int id;
  String name;
  Null emoji;

  Student({this.id, this.name, this.emoji});

  Student.fromJson(Map<String, dynamic> json) {
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





class TeamMember {
  int id;
  String name;
  Null emoji;

  TeamMember({this.id, this.name, this.emoji});

  TeamMember.fromJson(Map<String, dynamic> json) {
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

