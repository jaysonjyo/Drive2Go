import 'dart:convert';
import 'dart:io';
import 'package:drive2goo/Repostory/ModelClass/Buyvechile/AllBuyVechileModelclass.dart';
import 'package:drive2goo/Repostory/ModelClass/Buyvechile/BuyvechildetailsModelClass.dart';
import 'package:drive2goo/Repostory/ModelClass/Buyvechile/NearByBuyCarModelClass.dart';
import 'package:drive2goo/Repostory/ModelClass/FeedBack/FeedBackModel.dart';
import 'package:drive2goo/Repostory/ModelClass/HelpCenter/HelpCenterpostModel.dart';
import 'package:drive2goo/Repostory/ModelClass/HelpCenter/HelpcenterChatModel.dart';
import 'package:drive2goo/Repostory/ModelClass/Privacy_policy/PrivacyPolicyModelClass.dart';
import 'package:drive2goo/Repostory/ModelClass/Rentvechile/RentOrderMOdelClass.dart';
import 'package:drive2goo/Repostory/ModelClass/Rentvechile/RentcarsearchModelclass.dart';
import 'package:drive2goo/Repostory/ModelClass/Terms_Condition/TermsConditionModelClass.dart';
import 'package:drive2goo/Repostory/ModelClass/authentication/SignUpModelClass.dart';
import 'package:drive2goo/Repostory/ModelClass/profileupdate/ProfileUpdateModelClass.dart';
import 'package:drive2goo/Repostory/ModelClass/profileupdate/UserModelclass.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ModelClass/Buyvechile/Buy_OrderShow_Modelclass.dart';
import '../ModelClass/Buyvechile/Buy_VechilOrderModelClass.dart';
import '../ModelClass/Buyvechile/BuyvehileSearchModelclass.dart';
import '../ModelClass/Rentvechile/AllcarModel.dart';
import '../ModelClass/Rentvechile/NearbyCarModelClass.dart';
import '../ModelClass/Rentvechile/RentCarModel.dart';
import '../ModelClass/authentication/SignInModelClass.dart';
import 'Client.dart';
import 'package:http/http.dart' as http;

class UserMainapi {
  ApiClient apiClient = ApiClient();

  // signUP
  Future<SignUpModelClass> getsignup(String name, String email, String phone,
      String password) async {
    String trendingpath = 'http://45.159.221.50:8868/api/signup';
    var body = {
      "fullName": name,
      "email": email,
      "phone": phone,
      "password": password
    };
    print("hi hello" + body.toString());
    Response response =
    await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return SignUpModelClass.fromJson(jsonDecode(response.body));
  }

  // sign in

  Future<SignInModelClass> getsignin(String email, String password) async {
    String trendingpath = 'http://45.159.221.50:8868/api/signin';
    var body = {"email": email, "password": password};
    print(body);
    Response response =
    await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return SignInModelClass.fromJson(jsonDecode(response.body));
  }

  // nearby
  Future<List<NearbyCarModelClass>> getnearby(String lat, String long) async {
    String trendingpath =
        "http://45.159.221.50:8868/api/get-nearby-vehicles?latitude=$lat&longitude=$long";

    var body = {};
    print(body);
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return NearbyCarModelClass.listFromJson(jsonDecode(response.body));
  }

  // rent car
  Future<RentCarModel> getrentcar(String vehicle,
      String pickupdate,
      String returndate,
      String pickuplocation,
      String returnlocation,
      String amount) async {
    String trendingpath = "http://45.159.221.50:8868/api/create-rent-order";
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("userId").toString();
    var body = {
      "vehicle": vehicle,
      "user": userId,
      "pickupDate": pickupdate,
      "returnDate": returndate,
      "pickupLocation": pickuplocation,
      "returnLocation": returnlocation,
      "amount": int.parse(amount)
    };
    print("hi" + body.toString());
    Response response =
    await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return RentCarModel.fromJson(jsonDecode(response.body));
  }

  //All car
  Future<List<AllcarModelClass>> getAllcar() async {
    String trendingpath = "http://45.159.221.50:8868/api/get-vehicles";

    var body = {};
    print(body);
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return AllcarModelClass.listFromJson(jsonDecode(response.body));
  }

  // rentcarorder
  Future<List<RentCarOrderModelClass>> getRentorder() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("userId").toString();
    String trendingpath =
        "http://45.159.221.50:8868/api/get-rent-orders/$userId";

    var body = {};
    print(body);
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return RentCarOrderModelClass.listFromJson(jsonDecode(response.body));
  }

  //searchrent
  Future<List<RentcarsearchModelclass>> getRentsearch(String brand) async {
    String trendingpath =
        "http://45.159.221.50:8868/api/search-vehicles?brand=$brand";

    var body = {};
    print(body);
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return RentcarsearchModelclass.listFromJson(jsonDecode(response.body));
  }

  // Buy_ Cars ModelClass
  Future<List<NearByBuyCarModelClass>> getNBuycar(String lat,
      String long) async {
    String trendingpath =
        "http://45.159.221.50:8868/api/get-nearby-buyvehicles?latitude=$lat&longitude=$long";

    var body = {};
    print(body);
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return NearByBuyCarModelClass.listFromJson(jsonDecode(response.body));
  }

  // allbuycarmodelss
  Future<List<AllBuyVechileModelclass>> getAllBuycar() async {
    String trendingpath = "http://45.159.221.50:8868/api/get-buyvehicles";

    var body = {};
    print(body);
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return AllBuyVechileModelclass.listFromJson(jsonDecode(response.body));
  }
  //
  //buyvechiledetals
  Future<BuyvechildetailsModelClass> getBuyvechildetails(
      String vechilid
      ) async {
    String trendingpath = "http://45.159.221.50:8868/api/get-buyvehicle/$vechilid";

    var body = {};
    print(body);
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return BuyvechildetailsModelClass.fromJson(jsonDecode(response.body));
  }
  //

  // create oder
  Future<BuyCreateOrderModelClass> getBuyCreateOrder(String vehicleid,
      String buyerAddress,
      String purchaseprice) async {
    String trendingpath = "http://45.159.221.50:8868/api/create-buy-order";
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("userId").toString();
    //egganeyum cheyyam /  ui design undakite controler veche kodukam but requied akkanam
    String userName = prefs.getString("userName").toString();
    String userPhonenumber = prefs.getString("userPhonenumber").toString();
    String userEmail = prefs.getString("userEmail").toString();
    var body = {
      "vehicle": vehicleid,
      "buyerId": userId,
      "buyerName": userName,
      "buyerPhoneNumber": userPhonenumber,
      "buyerEmail": userEmail,
      "buyerAddress": buyerAddress,
      "purchasePrice": int.parse(purchaseprice)
    };
    print("jayson" + body.toString());
    Response response =
    await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return BuyCreateOrderModelClass.fromJson(jsonDecode(response.body));
  }

  // buyvehileshwoorder
  Future<List<BuyOrderShowModelclass>> getBuyorder() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("userId").toString();
    String trendingpath = "http://45.159.221.50:8868/api/get-buy-orders/$userId";

    var body = {};
    print(body);
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return BuyOrderShowModelclass.listFromJson(jsonDecode(response.body));
  }

  //
  // buyvehile search
  Future<List<BuyvehileSearchModelclass>> getBuyvehileSearch(
      String brandsearch) async {
    String trendingpath = "http://45.159.221.50:8868/api/search-buyvehicles?brand=$brandsearch";

    var body = {};
    print(body);
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return BuyvehileSearchModelclass.listFromJson(jsonDecode(response.body));
  }

//
//Helpcenterpost
  Future<HelpCenterpostModel> getHelpcenterpost(
      String descriptionmessage) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("userId").toString();
    String trendingpath = "http://45.159.221.50:8868/api/help-center";

    var body = {
      "user": userId,
      "queryDescription": descriptionmessage
    };
    print("hy" + body.toString());
    Response response =
    await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return HelpCenterpostModel.fromJson(jsonDecode(response.body));
  }

  //
  //chat
  Future <List<HelpcenterChatModel>> getchat() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("userId").toString();
    String trendingpath = "http://45.159.221.50:8868/api/help-center/user/$userId";

    var body = {};
    print(body);
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return HelpcenterChatModel.listFromJson(jsonDecode(response.body));
  }

  //
//feedback
  Future<FeedBackModel> getFeedback(String comment) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("userId").toString();
    String trendingpath = "http://45.159.221.50:8868/api/feedback";

    var body = {
      "user": userId,
      "comments": comment
    };
    print("print" + body.toString());
    Response response =
    await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return FeedBackModel.fromJson(jsonDecode(response.body));
  }

  // privacy policy
  Future <PrivacyPolicyModelClass> getPrivacypolicy() async {
    String trendingpath = "http://45.159.221.50:8868/api/privacy-policy/latest";

    var body = {};
    print(body);
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return PrivacyPolicyModelClass.fromJson(jsonDecode(response.body));
  }
  //

// Terms_condition
  Future <TermsConditionModelClass> getTermscnonditio() async {
    String trendingpath = "http://45.159.221.50:8868/api/terms-conditions/latest";

    var body = {};
    print(body);
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return TermsConditionModelClass.fromJson(jsonDecode(response.body));

  }
  //
  //User
  Future <UserModelclass> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("userId").toString();
    String trendingpath = "http://45.159.221.50:8868/api/user/$userId";

    var body = {};
    print(body);
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return UserModelclass.fromJson(jsonDecode(response.body));

  }
  //
//profileupdate
  Future <ProfileUpdateModelClass> getProfileupdate(
      String? fullname,
      String? oldpassword,
      String? newpassword

      ) async {
    //111
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("userId").toString();
    String trendingpath = "http://45.159.221.50:8868/api/update-profile/$userId";

    var body = {
      "fullName":fullname,
      "oldPassword":oldpassword,
      "newPassword":newpassword
    };
    print("ptofileupdate"+body.toString());
    Response response = await apiClient.invokeAPI(trendingpath, 'PUT', jsonEncode(body));

    return ProfileUpdateModelClass.fromJson(jsonDecode(response.body));

  }
  //

  // path  kittan vendi mathram ee function use akkunathe ellankil namuke matte functionil thanne cheyyam pakshe
  // condition kodukandi verum  // 111 nte avide send code


  Future<ProfileUpdateModelClass> uploadFile( File file) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("userId").toString();
    var request = http.MultipartRequest('PUT', Uri.parse('http://45.159.221.50:8868/api/update-profile/$userId'));
    request.files.add(await http.MultipartFile.fromPath('profilePhoto', file.path));

    var response = await request.send();
print('hello'+response.statusCode.toString());

      return ProfileUpdateModelClass.fromJson(response.headers);
      // Upload successful
    }

//
//
}