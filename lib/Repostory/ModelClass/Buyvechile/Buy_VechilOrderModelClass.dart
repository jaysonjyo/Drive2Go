class BuyCreateOrderModelClass {
  BuyCreateOrderModelClass({
      this.buyer, 
      this.buyerName, 
      this.buyerPhoneNumber, 
      this.buyerEmail, 
      this.buyerAddress, 
      this.vehicle, 
      this.purchasePrice, 
      this.paymentStatus, 
      this.deliveryStatus, 
      this.id, 
      this.purchaseDate, 
      this.v,});

  BuyCreateOrderModelClass.fromJson(dynamic json) {
    buyer = json['buyer'];
    buyerName = json['buyerName'];
    buyerPhoneNumber = json['buyerPhoneNumber'];
    buyerEmail = json['buyerEmail'];
    buyerAddress = json['buyerAddress'];
    vehicle = json['vehicle'];
    purchasePrice = json['purchasePrice'];
    paymentStatus = json['paymentStatus'];
    deliveryStatus = json['deliveryStatus'];
    id = json['_id'];
    purchaseDate = json['purchaseDate'];
    v = json['__v'];
  }
  String? buyer;
  String? buyerName;
  String? buyerPhoneNumber;
  String? buyerEmail;
  String? buyerAddress;
  String? vehicle;
  int? purchasePrice;
  String? paymentStatus;
  String? deliveryStatus;
  String? id;
  String? purchaseDate;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['buyer'] = buyer;
    map['buyerName'] = buyerName;
    map['buyerPhoneNumber'] = buyerPhoneNumber;
    map['buyerEmail'] = buyerEmail;
    map['buyerAddress'] = buyerAddress;
    map['vehicle'] = vehicle;
    map['purchasePrice'] = purchasePrice;
    map['paymentStatus'] = paymentStatus;
    map['deliveryStatus'] = deliveryStatus;
    map['_id'] = id;
    map['purchaseDate'] = purchaseDate;
    map['__v'] = v;
    return map;
  }

}