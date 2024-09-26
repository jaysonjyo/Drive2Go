
class SignInModelClass {
  String? token;
  dynamic profilePhoto;
  dynamic resetPasswordToken;
  dynamic resetPasswordExpires;
  String? id;
  String? fullName;
  String? email;
  String? phone;
  int? v;

  SignInModelClass({this.token, this.profilePhoto, this.resetPasswordToken, this.resetPasswordExpires, this.id, this.fullName, this.email, this.phone, this.v});

  SignInModelClass.fromJson(Map<String, dynamic> json) {
    token = json["token"];
    profilePhoto = json["profilePhoto"];
    resetPasswordToken = json["resetPasswordToken"];
    resetPasswordExpires = json["resetPasswordExpires"];
    id = json["_id"];
    fullName = json["fullName"];
    email = json["email"];
    phone = json["phone"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["token"] = token;
    _data["profilePhoto"] = profilePhoto;
    _data["resetPasswordToken"] = resetPasswordToken;
    _data["resetPasswordExpires"] = resetPasswordExpires;
    _data["_id"] = id;
    _data["fullName"] = fullName;
    _data["email"] = email;
    _data["phone"] = phone;
    _data["__v"] = v;
    return _data;
  }
}