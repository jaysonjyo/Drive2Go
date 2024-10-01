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
Future.delayed(Duration(seconds: 2),() async {
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
      body: Container(width: double.infinity,height: double.infinity,child: Image(image: AssetImage("assets/splash.png"),fit:BoxFit.cover ,),),
    );

  }
}
