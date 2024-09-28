
class ProfileUpdateModelClass {
  dynamic fcmToken;
  String? id;
  String? fullName;
  String? email;
  String? phone;
  int? v;
  String? profilePhoto;
  String? resetPasswordExpires;
  String? resetPasswordToken;
  String? profilePhotoUrl;

  ProfileUpdateModelClass({this.fcmToken, this.id, this.fullName, this.email, this.phone, this.v, this.profilePhoto, this.resetPasswordExpires, this.resetPasswordToken, this.profilePhotoUrl});

  ProfileUpdateModelClass.fromJson(Map<String, dynamic> json) {
    fcmToken = json["fcmToken"];
    id = json["_id"];
    fullName = json["fullName"];
    email = json["email"];
    phone = json["phone"];
    v = json["__v"];
    profilePhoto = json["profilePhoto"];
    resetPasswordExpires = json["resetPasswordExpires"];
    resetPasswordToken = json["resetPasswordToken"];
    profilePhotoUrl = json["profilePhotoUrl"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["fcmToken"] = fcmToken;
    _data["_id"] = id;
    _data["fullName"] = fullName;
    _data["email"] = email;
    _data["phone"] = phone;
    _data["__v"] = v;
    _data["profilePhoto"] = profilePhoto;
    _data["resetPasswordExpires"] = resetPasswordExpires;
    _data["resetPasswordToken"] = resetPasswordToken;
    _data["profilePhotoUrl"] = profilePhotoUrl;
    return _data;
  }
}