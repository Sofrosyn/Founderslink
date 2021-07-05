class SignUpResponse {
  SignupPayload data;

  SignUpResponse({this.data});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new SignupPayload.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class SignupPayload {
  String email;
  String firstName;
  String lastName;
  String updatedAt;
  String createdAt;
  int id;
  String token;

  SignupPayload(
      {this.email,
        this.firstName,
        this.lastName,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.token});

  SignupPayload.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['token'] = this.token;
    return data;
  }
}
