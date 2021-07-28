class UniversitiesResponse {
  List<Universities> results;

  UniversitiesResponse({this.results});

  UniversitiesResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<Universities>();
      json['results'].forEach((v) {
        results.add(new Universities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Universities {
  String objectId;
  String name;
  States state;
  String createdAt;
  String updatedAt;

  Universities(
      {this.objectId, this.name, this.state, this.createdAt, this.updatedAt});

  Universities.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    name = json['name'];
    state = json['state'] != null ? new States.fromJson(json['state']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    data['name'] = this.name;
    if (this.state != null) {
      data['state'] = this.state.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class States {
  String sType;
  String className;
  String objectId;

  States({this.sType, this.className, this.objectId});

  States.fromJson(Map<String, dynamic> json) {
    sType = json['__type'];
    className = json['className'];
    objectId = json['objectId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__type'] = this.sType;
    data['className'] = this.className;
    data['objectId'] = this.objectId;
    return data;
  }
}
