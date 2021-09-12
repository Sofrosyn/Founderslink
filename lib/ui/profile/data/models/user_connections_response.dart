class ConnectionsSuggestionsResponse {
  List<Connection> data;
  Links links;
  Meta meta;

  ConnectionsSuggestionsResponse({this.data, this.links, this.meta});

  ConnectionsSuggestionsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Connection>();
      json['data'].forEach((v) {
        data.add(new Connection.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}

class Connection {
  int id;
  String firstName;
  String lastName;
  String type;
  Null pronounId;
  String pronoun;
  String avatarUrl;
  String createdAt;
  String updatedAt;
  bool blocked;

  Connection(
      {this.id,
      this.firstName,
      this.lastName,
      this.type,
      this.pronounId,
      this.pronoun,
      this.avatarUrl,
      this.createdAt,
      this.updatedAt,
      this.blocked});

  Connection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    type = json['type'];
    pronounId = json['pronoun_id'];
    pronoun = json['pronoun'];
    avatarUrl = json['avatar_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    blocked = json['blocked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['type'] = this.type;
    data['pronoun_id'] = this.pronounId;
    data['pronoun'] = this.pronoun;
    data['avatar_url'] = this.avatarUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['blocked'] = this.blocked;
    return data;
  }
}

class Links {
  Null first;
  Null last;
  Null prev;
  String next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  String path;
  int perPage;

  Meta({this.path, this.perPage});

  Meta.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    perPage = json['per_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    return data;
  }
}