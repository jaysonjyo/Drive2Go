class FeedBackModel {
  FeedBackModel({
      this.message, 
      this.data,});

  FeedBackModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.user, 
      this.comments, 
      this.id, 
      this.createdAt, 
      this.v,});

  Data.fromJson(dynamic json) {
    user = json['user'];
    comments = json['comments'];
    id = json['_id'];
    createdAt = json['createdAt'];
    v = json['__v'];
  }
  String? user;
  String? comments;
  String? id;
  String? createdAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user'] = user;
    map['comments'] = comments;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['__v'] = v;
    return map;
  }

}