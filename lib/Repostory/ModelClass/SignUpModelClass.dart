class SignUpModelClass {
  SignUpModelClass({
      this.fullName, 
      this.email, 
      this.phone, 
      this.password, 
      this.id, 
      this.v,});

  SignUpModelClass.fromJson(dynamic json) {
    fullName = json['fullName'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    id = json['_id'];
    v = json['__v'];
  }
  String? fullName;
  String? email;
  String? phone;
  String? password;
  String? id;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullName'] = fullName;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;
    map['_id'] = id;
    map['__v'] = v;
    return map;
  }

}