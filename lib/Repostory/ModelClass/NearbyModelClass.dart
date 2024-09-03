class NearbyCarModelClass {
  NearbyCarModelClass({
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
      this.available, 
      this.v,});

  NearbyCarModelClass.fromJson(dynamic json) {
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
    available = json['available'];
    v = json['__v'];
  }
  Location? location;
  String? id;
  String? brand;
  String? model;
  String? description;
  dynamic? rentPrice;
  dynamic? mileage;
  List<String>? photos;
  String? vehicleColor;
  String? gearType;
  String? fuelType;
  dynamic? noOfSeats;
  dynamic? rating;
  dynamic? noOfDoors;
  String? ownerName;
  String? ownerPhoneNumber;
  String? ownerPlace;
  bool? available;
  dynamic? v;

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
    map['available'] = available;
    map['__v'] = v;
    return map;
  }
  static List<NearbyCarModelClass> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => NearbyCarModelClass.fromJson(value)).toList();
  }
}

class Location {
  Location({
      this.type, 
      this.coordinates,});

  Location.fromJson(dynamic json) {
    type = json['type'];
    coordinates = json['coordinates'] != null ? json['coordinates'].cast<dynamic>() : [];
  }
  String? type;
  List<dynamic>? coordinates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['coordinates'] = coordinates;
    return map;
  }

}