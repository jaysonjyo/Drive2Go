class PrivacyPolicyModelClass {
  PrivacyPolicyModelClass({
      this.informationWeCollect, 
      this.howWeUseInfo, 
      this.howWeShareInfo, 
      this.userRights, 
      this.contactInfo, 
      this.id, 
      this.title, 
      this.content, 
      this.effectiveDate, 
      this.dataSecurity, 
      this.retentionPolicy, 
      this.cookiesPolicy, 
      this.childrenPrivacy, 
      this.changesToPolicy, 
      this.version, 
      this.lastUpdated, 
      this.v,});

  PrivacyPolicyModelClass.fromJson(dynamic json) {
    informationWeCollect = json['informationWeCollect'] != null ? InformationWeCollect.fromJson(json['informationWeCollect']) : null;
    howWeUseInfo = json['howWeUseInfo'] != null ? HowWeUseInfo.fromJson(json['howWeUseInfo']) : null;
    howWeShareInfo = json['howWeShareInfo'] != null ? HowWeShareInfo.fromJson(json['howWeShareInfo']) : null;
    userRights = json['userRights'] != null ? UserRights.fromJson(json['userRights']) : null;
    contactInfo = json['contactInfo'] != null ? ContactInfo.fromJson(json['contactInfo']) : null;
    id = json['_id'];
    title = json['title'];
    content = json['content'];
    effectiveDate = json['effectiveDate'];
    dataSecurity = json['dataSecurity'];
    retentionPolicy = json['retentionPolicy'];
    cookiesPolicy = json['cookiesPolicy'];
    childrenPrivacy = json['childrenPrivacy'];
    changesToPolicy = json['changesToPolicy'];
    version = json['version'];
    lastUpdated = json['lastUpdated'];
    v = json['__v'];
  }
  InformationWeCollect? informationWeCollect;
  HowWeUseInfo? howWeUseInfo;
  HowWeShareInfo? howWeShareInfo;
  UserRights? userRights;
  ContactInfo? contactInfo;
  String? id;
  String? title;
  String? content;
  String? effectiveDate;
  String? dataSecurity;
  String? retentionPolicy;
  String? cookiesPolicy;
  String? childrenPrivacy;
  String? changesToPolicy;
  String? version;
  String? lastUpdated;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (informationWeCollect != null) {
      map['informationWeCollect'] = informationWeCollect?.toJson();
    }
    if (howWeUseInfo != null) {
      map['howWeUseInfo'] = howWeUseInfo?.toJson();
    }
    if (howWeShareInfo != null) {
      map['howWeShareInfo'] = howWeShareInfo?.toJson();
    }
    if (userRights != null) {
      map['userRights'] = userRights?.toJson();
    }
    if (contactInfo != null) {
      map['contactInfo'] = contactInfo?.toJson();
    }
    map['_id'] = id;
    map['title'] = title;
    map['content'] = content;
    map['effectiveDate'] = effectiveDate;
    map['dataSecurity'] = dataSecurity;
    map['retentionPolicy'] = retentionPolicy;
    map['cookiesPolicy'] = cookiesPolicy;
    map['childrenPrivacy'] = childrenPrivacy;
    map['changesToPolicy'] = changesToPolicy;
    map['version'] = version;
    map['lastUpdated'] = lastUpdated;
    map['__v'] = v;
    return map;
  }

}

class ContactInfo {
  ContactInfo({
      this.email, 
      this.phone, 
      this.address,});

  ContactInfo.fromJson(dynamic json) {
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
  }
  String? email;
  String? phone;
  String? address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['phone'] = phone;
    map['address'] = address;
    return map;
  }

}

class UserRights {
  UserRights({
      this.accessAndCorrection, 
      this.deletion, 
      this.marketingOptOut, 
      this.dataPortability,});

  UserRights.fromJson(dynamic json) {
    accessAndCorrection = json['accessAndCorrection'];
    deletion = json['deletion'];
    marketingOptOut = json['marketingOptOut'];
    dataPortability = json['dataPortability'];
  }
  String? accessAndCorrection;
  String? deletion;
  String? marketingOptOut;
  String? dataPortability;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessAndCorrection'] = accessAndCorrection;
    map['deletion'] = deletion;
    map['marketingOptOut'] = marketingOptOut;
    map['dataPortability'] = dataPortability;
    return map;
  }

}

class HowWeShareInfo {
  HowWeShareInfo({
      this.serviceProviders, 
      this.legalCompliance, 
      this.businessTransfers,});

  HowWeShareInfo.fromJson(dynamic json) {
    serviceProviders = json['serviceProviders'];
    legalCompliance = json['legalCompliance'];
    businessTransfers = json['businessTransfers'];
  }
  String? serviceProviders;
  String? legalCompliance;
  String? businessTransfers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceProviders'] = serviceProviders;
    map['legalCompliance'] = legalCompliance;
    map['businessTransfers'] = businessTransfers;
    return map;
  }

}

class HowWeUseInfo {
  HowWeUseInfo({
      this.serviceDelivery, 
      this.personalization, 
      this.communication, 
      this.legalObligations,});

  HowWeUseInfo.fromJson(dynamic json) {
    serviceDelivery = json['serviceDelivery'];
    personalization = json['personalization'];
    communication = json['communication'];
    legalObligations = json['legalObligations'];
  }
  String? serviceDelivery;
  String? personalization;
  String? communication;
  String? legalObligations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceDelivery'] = serviceDelivery;
    map['personalization'] = personalization;
    map['communication'] = communication;
    map['legalObligations'] = legalObligations;
    return map;
  }

}

class InformationWeCollect {
  InformationWeCollect({
      this.personalInfo, 
      this.vehicleInfo, 
      this.technicalInfo, 
      this.usageData,});

  InformationWeCollect.fromJson(dynamic json) {
    personalInfo = json['personalInfo'];
    vehicleInfo = json['vehicleInfo'];
    technicalInfo = json['technicalInfo'];
    usageData = json['usageData'];
  }
  String? personalInfo;
  String? vehicleInfo;
  String? technicalInfo;
  String? usageData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['personalInfo'] = personalInfo;
    map['vehicleInfo'] = vehicleInfo;
    map['technicalInfo'] = technicalInfo;
    map['usageData'] = usageData;
    return map;
  }

}