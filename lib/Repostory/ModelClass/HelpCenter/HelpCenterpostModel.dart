class HelpCenterpostModel {
  HelpCenterpostModel({
      this.message, 
      this.data,});

  HelpCenterpostModel.fromJson(dynamic json) {
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
      this.queryDescription, 
      this.status, 
      this.response, 
      this.id, 
      this.createdAt, 
      this.v,});

  Data.fromJson(dynamic json) {
    user = json['user'];
    queryDescription = json['queryDescription'];
    status = json['status'];
    response = json['response'];
    id = json['_id'];
    createdAt = json['createdAt'];
    v = json['__v'];
  }
  String? user;
  String? queryDescription;
  String? status;
  dynamic response;
  String? id;
  String? createdAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user'] = user;
    map['queryDescription'] = queryDescription;
    map['status'] = status;
    map['response'] = response;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['__v'] = v;
    return map;
  }

}