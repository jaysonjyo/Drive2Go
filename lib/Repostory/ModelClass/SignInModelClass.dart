class SignInModelClass {
  SignInModelClass({
      this.token, 
      this.id, 
      this.fullName, 
      this.email, 
      this.phone, 
      this.v,});

  SignInModelClass.fromJson(dynamic json) {
    token = json['token'];
    id = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    phone = json['phone'];
    v = json['__v'];
  }
  String? token;
  String? id;
  String? fullName;
  String? email;
  String? phone;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['_id'] = id;
    map['fullName'] = fullName;
    map['email'] = email;
    map['phone'] = phone;
    map['__v'] = v;
    return map;
  }

}