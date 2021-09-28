class PronounsResponse {
  List<Pronouns> data;

  PronounsResponse({this.data});

  PronounsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Pronouns>();
      json['data'].forEach((v) {
        data.add(new Pronouns.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pronouns {
  int id;
  String name;

  Pronouns({this.id, this.name});

  Pronouns.fromJson(Map<String, dynamic> json) {
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
