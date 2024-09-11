
import '../Rentvechile/NearbyCarModelClass.dart';

class NearByBuyCarModelClass {
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

  NearByBuyCarModelClass({this.location, this.id, this.brand, this.model, this.description, this.rentPrice, this.mileage, this.photos, this.vehicleColor, this.gearType, this.fuelType, this.noOfSeats, this.rating, this.noOfDoors, this.ownerName, this.ownerPhoneNumber, this.ownerPlace, this.ownerProfilePhoto, this.available, this.latestModel, this.highMilage, this.v});

  NearByBuyCarModelClass.fromJson(Map<String, dynamic> json) {
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
    latestModel = json["latestModel"];
    highMilage = json["highMilage"];
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
    _data["latestModel"] = latestModel;
    _data["highMilage"] = highMilage;
    _data["__v"] = v;
    return _data;
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