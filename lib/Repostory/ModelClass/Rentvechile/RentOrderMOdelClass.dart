
class RentCarOrderModelClass {
  String? id;
  Vehicle? vehicle;
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

  RentCarOrderModelClass({this.id, this.vehicle, this.user, this.pickupDate, this.returnDate, this.pickupLocation, this.returnLocation, this.amount, this.status, this.createdAt, this.updatedAt, this.v});

  RentCarOrderModelClass.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    vehicle = json["vehicle"] == null ? null : Vehicle.fromJson(json["vehicle"]);
    user = json["user"];
    pickupDate = json["pickupDate"];
    returnDate = json["returnDate"];
    pickupLocation = json["pickupLocation"];
    returnLocation = json["returnLocation"];
    amount = json["amount"];
    status = json["status"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    if(vehicle != null) {
      _data["vehicle"] = vehicle?.toJson();
    }
    _data["user"] = user;
    _data["pickupDate"] = pickupDate;
    _data["returnDate"] = returnDate;
    _data["pickupLocation"] = pickupLocation;
    _data["returnLocation"] = returnLocation;
    _data["amount"] = amount;
    _data["status"] = status;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
  static List<RentCarOrderModelClass> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => RentCarOrderModelClass.fromJson(value)).toList();}
}

class Vehicle {
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
  int? v;

  Vehicle({this.location, this.id, this.brand, this.model, this.description, this.rentPrice, this.mileage, this.photos, this.vehicleColor, this.gearType, this.fuelType, this.noOfSeats, this.rating, this.noOfDoors, this.ownerName, this.ownerPhoneNumber, this.ownerPlace, this.ownerProfilePhoto, this.available, this.v});

  Vehicle.fromJson(Map<String, dynamic> json) {
    location = json["location"] == null ? null : Location.fromJson(json["location"]);
    id = json["_id"];
    brand = json["brand"];
    model = json["model"];
    description = json["description"];
    rentPrice = json["rentPrice"];
    mileage = json["mileage"];
    photos = json["photos"] == null ? null : List<String>.from(json["photos"]);
    vehicleColor = json["vehicleColor"];
    gearType = json["gearType"];
    fuelType = json["fuelType"];
    noOfSeats = json["noOfSeats"];
    rating = json["rating"];
    noOfDoors = json["noOfDoors"];
    ownerName = json["ownerName"];
    ownerPhoneNumber = json["ownerPhoneNumber"];
    ownerPlace = json["ownerPlace"];
    ownerProfilePhoto = json["ownerProfilePhoto"];
    available = json["available"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(location != null) {
      _data["location"] = location?.toJson();
    }
    _data["_id"] = id;
    _data["brand"] = brand;
    _data["model"] = model;
    _data["description"] = description;
    _data["rentPrice"] = rentPrice;
    _data["mileage"] = mileage;
    if(photos != null) {
      _data["photos"] = photos;
    }
    _data["vehicleColor"] = vehicleColor;
    _data["gearType"] = gearType;
    _data["fuelType"] = fuelType;
    _data["noOfSeats"] = noOfSeats;
    _data["rating"] = rating;
    _data["noOfDoors"] = noOfDoors;
    _data["ownerName"] = ownerName;
    _data["ownerPhoneNumber"] = ownerPhoneNumber;
    _data["ownerPlace"] = ownerPlace;
    _data["ownerProfilePhoto"] = ownerProfilePhoto;
    _data["available"] = available;
    _data["__v"] = v;
    return _data;
  }
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    coordinates = json["coordinates"] == null ? null : List<double>.from(json["coordinates"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["type"] = type;
    if(coordinates != null) {
      _data["coordinates"] = coordinates;
    }
    return _data;
  }
}