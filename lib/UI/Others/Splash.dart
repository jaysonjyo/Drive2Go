import 'package:drive2goo/UI/Others/BottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Start_Indro.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
Future.delayed(Duration(seconds: 4),() async {
  //shared preferences.
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        if(prefs.containsKey("userId")){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>Bottomnavigation()),(route)=> false);
        }else{
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>StartIndro()),(route)=> false);
        }

});
    return Scaffold(

      backgroundColor: Colors.black,
    );
  }
}
