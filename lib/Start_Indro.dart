import 'package:drive2goo/Sign_In.dart';
import 'package:drive2goo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StartIndro extends StatefulWidget {
  const StartIndro({super.key});

  @override
  State<StartIndro> createState() => _StartIndroState();
}
//not finish
class _StartIndroState extends State<StartIndro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body:Stack(
        children: [
          Container(width: double.infinity.w,
          height: double.infinity.h,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/a.png"))),
          child: Image.asset("assets/b.png"),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height:190.h,),
                  Text(
                  'Wheels You Needed',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.sp,
                    fontFamily: "sfprodisplay",
                    fontWeight: FontWeight.w600,)
            
            
                ),
                  SizedBox(height: 36.h,),
                  SizedBox(
                  width: 313.w,
                  child: Text(
                    'Premium and prestige daily rental car, experience the thrill at a lower price.',
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                      color: Color(0xFF8493A3),
                      fontSize: 16.sp,
                      fontFamily: 'sfprodisplay',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.36.w,
                    ),
                  ),
                ),
                  SizedBox(height: 446.h,),
                              GestureDetector(onTap: (){
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>SignIn()),(route)=>false);
                              },
                                child: Container(
                                                width: 332.w,
                                                height: 64.h,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xBC001024),
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(width: 1.w, color:Colors.white60),
                                                    borderRadius: BorderRadius.circular(50.r),
                                                  ),
                                                ),
                                                child:    Center(
                                                  child: Text(
                                                    'Let’s Go',
                                                    style:  TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20.sp,
                                                      fontFamily: 'sfprodisplay',
                                                      fontWeight: FontWeight.w700,
                                                      letterSpacing: 1.70.w,
            
                                                  )),
                                                ),
                                              ),
                              ),
            
                ],
              ),
            ),
          )
        ],
      ) ,
    );
  }
}
