class NearByBuyCarModelClass {
  NearByBuyCarModelClass({
      this.location, 
      this.id, 
      this.brand, 
      this.model, 
      this.description, 
      this.rentPrice, 
      this.mileage, 
      this.photos, 
      this.vehicleColor, 
      this.gearType, 
      this.fuelType, 
      this.noOfSeats, 
      this.rating, 
      this.noOfDoors, 
      this.ownerName, 
      this.ownerPhoneNumber, 
      this.ownerPlace, 
      this.ownerProfilePhoto, 
      this.available, 
      this.latestModel, 
      this.highMilage, 
      this.v,});

  NearByBuyCarModelClass.fromJson(dynamic json) {
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    id = json['_id'];
    brand = json['brand'];
    model = json['model'];
    description = json['description'];
    rentPrice = json['rentPrice'];
    mileage = json['mileage'];
    photos = json['photos'] != null ? json['photos'].cast<String>() : [];
    vehicleColor = json['vehicleColor'];
    gearType = json['gearType'];
    fuelType = json['fuelType'];
    noOfSeats = json['noOfSeats'];
    rating = json['rating'];
    noOfDoors = json['noOfDoors'];
    ownerName = json['ownerName'];
    ownerPhoneNumber = json['ownerPhoneNumber'];
    ownerPlace = json['ownerPlace'];
    ownerProfilePhoto = json['ownerProfilePhoto'];
    available = json['available'];
    latestModel = json['latestModel'];
    highMilage = json['highMilage'];
    v = json['__v'];
  }
  Location? location;
  String? id;
  String? brand;
  String? model;
  String? description;
  int? rentPrice;
  int? mileage;
  List<String>? photos;
  String? vehicleColor;
  String? gearType;
  String? fuelType;
  int? noOfSeats;
  double? rating;
  int? noOfDoors;
  String? ownerName;
  String? ownerPhoneNumber;
  String? ownerPlace;
  String? ownerProfilePhoto;
  bool? available;
  bool? latestModel;
  bool? highMilage;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['_id'] = id;
    map['brand'] = brand;
    map['model'] = model;
    map['description'] = description;
    map['rentPrice'] = rentPrice;
    map['mileage'] = mileage;
    map['photos'] = photos;
    map['vehicleColor'] = vehicleColor;
    map['gearType'] = gearType;
    map['fuelType'] = fuelType;
    map['noOfSeats'] = noOfSeats;
    map['rating'] = rating;
    map['noOfDoors'] = noOfDoors;
    map['ownerName'] = ownerName;
    map['ownerPhoneNumber'] = ownerPhoneNumber;
    map['ownerPlace'] = ownerPlace;
    map['ownerProfilePhoto'] = ownerProfilePhoto;
    map['available'] = available;
    map['latestModel'] = latestModel;
    map['highMilage'] = highMilage;
    map['__v'] = v;
    return map;
  }
  //convert in to list code
  static List<NearByBuyCarModelClass> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => NearByBuyCarModelClass.fromJson(value)).toList();
  }
//convert in to list code

}

class Location {
  Location({
      this.type, 
      this.coordinates,});

  Location.fromJson(dynamic json) {
    type = json['type'];
    coordinates = json['coordinates'] != null ? json['coordinates'].cast<double>() : [];
  }
  String? type;
  List<double>? coordinates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['coordinates'] = coordinates;
    return map;
  }

}