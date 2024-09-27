class HelpcenterChatModel {
  HelpcenterChatModel({
      this.id, 
      this.user, 
      this.queryDescription, 
      this.status, 
      this.response, 
      this.createdAt, 
      this.v,});

  HelpcenterChatModel.fromJson(dynamic json) {
    id = json['_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    queryDescription = json['queryDescription'];
    status = json['status'];
    response = json['response'];
    createdAt = json['createdAt'];
    v = json['__v'];
  }
  String? id;
  User? user;
  String? queryDescription;
  String? status;
  dynamic response;
  String? createdAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['queryDescription'] = queryDescription;
    map['status'] = status;
    map['response'] = response;
    map['createdAt'] = createdAt;
    map['__v'] = v;
    return map;
  }
  //convert in to list code
  static List<HelpcenterChatModel> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => HelpcenterChatModel.fromJson(value)).toList();
  }
//convert in to list code

}

class User {
  User({
      this.id, 
      this.fullName, 
      this.email,});

  User.fromJson(dynamic json) {
    id = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
  }
  String? id;
  String? fullName;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['fullName'] = fullName;
    map['email'] = email;
    return map;
  }

}