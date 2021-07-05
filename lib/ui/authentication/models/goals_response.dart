class GoalsResponse {
  List<Goals> data;

  GoalsResponse({this.data});

  GoalsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Goals>();
      json['data'].forEach((v) {
        data.add(new Goals.fromJson(v));
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

class Goals {
  int id;
  String name;

  Goals({this.id, this.name});

  Goals.fromJson(Map<String, dynamic> json) {
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
