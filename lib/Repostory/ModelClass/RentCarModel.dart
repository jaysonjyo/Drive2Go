class RentCarModel {
  RentCarModel({
      this.id, 
      this.vehicle, 
      this.user, 
      this.pickupDate, 
      this.returnDate, 
      this.pickupLocation, 
      this.returnLocation, 
      this.amount, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  RentCarModel.fromJson(dynamic json) {
    id = json['_id'];
    vehicle = json['vehicle'];
    user = json['user'];
    pickupDate = json['pickupDate'];
    returnDate = json['returnDate'];
    pickupLocation = json['pickupLocation'];
    returnLocation = json['returnLocation'];
    amount = json['amount'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  dynamic vehicle;
  String? user;
  String? pickupDate;
  String? returnDate;
  String? pickupLocation;
  String? returnLocation;
  int? amount;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['vehicle'] = vehicle;
    map['user'] = user;
    map['pickupDate'] = pickupDate;
    map['returnDate'] = returnDate;
    map['pickupLocation'] = pickupLocation;
    map['returnLocation'] = returnLocation;
    map['amount'] = amount;
    map['status'] = status;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}