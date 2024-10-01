class UserModelclass {
  UserModelclass({
      this.id, 
      this.fullName, 
      this.email, 
      this.phone, 
      this.v, 
      this.profilePhoto, 
      this.resetPasswordExpires, 
      this.resetPasswordToken, 
      this.fcmToken, 
      this.profilePhotoUrl,});

  UserModelclass.fromJson(dynamic json) {
    id = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    phone = json['phone'];
    v = json['__v'];
    profilePhoto = json['profilePhoto'];
    resetPasswordExpires = json['resetPasswordExpires'];
    resetPasswordToken = json['resetPasswordToken'];
    fcmToken = json['fcmToken'];
    profilePhotoUrl = json['profilePhotoUrl'];
  }
  String? id;
  String? fullName;
  String? email;
  String? phone;
  int? v;
  String? profilePhoto;
  String? resetPasswordExpires;
  String? resetPasswordToken;
  String? fcmToken;
  String? profilePhotoUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['fullName'] = fullName;
    map['email'] = email;
    map['phone'] = phone;
    map['__v'] = v;
    map['profilePhoto'] = profilePhoto;
    map['resetPasswordExpires'] = resetPasswordExpires;
    map['resetPasswordToken'] = resetPasswordToken;
    map['fcmToken'] = fcmToken;
    map['profilePhotoUrl'] = profilePhotoUrl;
    return map;
  }

}