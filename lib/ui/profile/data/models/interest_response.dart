class InterestsResponse {
  List<Interests> data;

  InterestsResponse({this.data});

  InterestsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Interests>();
      json['data'].forEach((v) {
        data.add(new Interests.fromJson(v));
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

class Interests {
  int id;
  String name;

  Interests({this.id, this.name});

  Interests.fromJson(Map<String, dynamic> json) {
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