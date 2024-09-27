
class HelpCenterpostModel {
  String? message;
  Data? data;

  HelpCenterpostModel({this.message, this.data});

  HelpCenterpostModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? user;
  String? queryDescription;
  String? status;
  dynamic response;
  String? id;
  String? createdAt;
  int? v;

  Data({this.user, this.queryDescription, this.status, this.response, this.id, this.createdAt, this.v});

  Data.fromJson(Map<String, dynamic> json) {
    user = json["user"];
    queryDescription = json["queryDescription"];
    status = json["status"];
    response = json["response"];
    id = json["_id"];
    createdAt = json["createdAt"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["user"] = user;
    _data["queryDescription"] = queryDescription;
    _data["status"] = status;
    _data["response"] = response;
    _data["_id"] = id;
    _data["createdAt"] = createdAt;
    _data["__v"] = v;
    return _data;
  }
}