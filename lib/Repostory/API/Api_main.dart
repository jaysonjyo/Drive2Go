import 'dart:convert';
import 'package:drive2goo/Repostory/ModelClass/NearbyModelClass.dart';
import 'package:drive2goo/Repostory/ModelClass/SignINModelClass.dart';
import 'package:drive2goo/Repostory/ModelClass/SignUpModelClass.dart';
import 'package:http/http.dart';
import 'Client.dart';

class User {
  ApiClient apiClient = ApiClient();


  // signUP
  Future<SignUpModelClass> getsignup(String name,String email,String phone,String password) async {
    String trendingpath ='http://45.159.221.50:8868/api/signup';
    var body = {
      "fullName": name,
      "email": email,
      "phone": phone,
      "password":password
    };
    print(body);
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return SignUpModelClass.fromJson(jsonDecode(response.body));
  }
  // sign in



  Future<SignInModelClass> getsignin(String email, String password) async {
    String trendingpath ='http://45.159.221.50:8868/api/signin';
    var body = {
      "email":email,
      "password": password
    };
    print(body);
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return SignInModelClass.fromJson(jsonDecode(response.body));
  }

  // nearby
  Future <List<NearbyCarModelClass>> getnearby(String lat,String long) async {
    String trendingpath ='http://45.159.221.50:8868/api/get-nearby-vehicles?latitude=$lat&longitude=$long';

    var body = {
    };
    print(body);
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return NearbyCarModelClass.listFromJson(jsonDecode(response.body));
  }
}