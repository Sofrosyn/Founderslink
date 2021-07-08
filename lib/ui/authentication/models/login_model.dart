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
  int id;
  String firstName;
  String lastName;
  String email;
  String type;
  String pronounId;
  String createdAt;
  String updatedAt;
  String token;

  LoginPayload(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.type,
        this.pronounId,
        this.createdAt,
        this.updatedAt,
        this.token});

  LoginPayload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    if(json['type']!=null){type = json['type'];}
    //if(json['pronoun_id']!=null){pronounId = json['pronoun_id'];}
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['type'] = this.type;
    data['pronoun_id'] = this.pronounId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['token'] = this.token;
    return data;
  }
}
