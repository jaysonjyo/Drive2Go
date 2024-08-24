import 'package:drive2goo/Sign_In.dart';
import 'package:drive2goo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'BottomNavigation.dart';
import 'Home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}
TextEditingController fullname=TextEditingController();
TextEditingController email=TextEditingController();
TextEditingController phonenumber=TextEditingController();
TextEditingController password=TextEditingController();

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity.w,
        height: double.infinity.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.09, 1.00),
            end: Alignment(0.09, -1),
            colors: [Colors.black, Color(0xFF025479)],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 39.w),
            child: Column(
              children: [
                SizedBox(height:147.h ,),
                Text(
                  'Create New Account',
                  style: TextStyle(
                    color: Color(0xFFF6F6F6),
                    fontSize: 28.sp,
                    fontFamily: 'sfprodisplay',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.w,
                  ),
                ),
                SizedBox(height: 81.h,),
                TextField(
                  cursorColor: Colors.grey,
                  controller:fullname ,
                  style: TextStyle(color: Colors.white),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 25.w),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.18000000715255737),
                    border:OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(20.r)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r),borderSide: BorderSide.none,
          
                    ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r),borderSide: BorderSide.none,
          
                  ) ,
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(20.r)),
          
                    hintText:
                    'Full Name',
                    hintStyle: TextStyle(
                      color: Color(0xFFA7B0BB),
                      fontSize: 16.sp,
                      fontFamily: 'sfprodisplay',
                      fontWeight: FontWeight.w400,
                    ),
          
                  ),
          
                ),
                SizedBox(height: 20.h,),
                TextField(
                  cursorColor: Colors.grey,
                  controller:email ,
                  style: TextStyle(color: Colors.white),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 25.w),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.18000000715255737),
                    border:OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(20.r)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r),borderSide: BorderSide.none,
          
                    ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r),borderSide: BorderSide.none,
          
                  ) ,
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(20.r)),
          
                    hintText:
                      'Email Address',
                      hintStyle: TextStyle(
                        color: Color(0xFFA7B0BB),
                        fontSize: 16.sp,
                        fontFamily: 'sfprodisplay',
                        fontWeight: FontWeight.w400,
                      ),
          
          
                  ),
          
                ),
                SizedBox(height: 20.h,),
                TextField(
                  cursorColor: Colors.grey,
                  controller:phonenumber ,
                  style: TextStyle(color: Colors.white),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 25.w),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.18000000715255737),
                    border:OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(20.r)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r),borderSide: BorderSide.none,
          
                    ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r),borderSide: BorderSide.none,
          
                  ) ,
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(20.r)),
          
                    hintText:
                    'Phone Number',
                    hintStyle: TextStyle(
                      color: Color(0xFFA7B0BB),
                      fontSize: 16.sp,
                      fontFamily: 'sfprodisplaysfprodisplay',
                      fontWeight: FontWeight.w400,
                    ),
          
                  ),
          
                ),
                SizedBox(height: 20.h,),
                TextField(
                  cursorColor: Colors.grey,
                  controller:password ,
                  style: TextStyle(color: Colors.white),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 25.w),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.18000000715255737),
                    border:OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(20.r)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r),borderSide: BorderSide.none,
          
                    ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r),borderSide: BorderSide.none,
          
                  ) ,
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(20.r)),
          
                    hintText:
                    'Password',
                    hintStyle: TextStyle(
                      color: Color(0xFFA7B0BB),
                      fontSize: 16.sp,
                      fontFamily: 'sfprodisplay',
                      fontWeight: FontWeight.w400,
          
                    ),
                    suffixIcon: Icon(Icons.remove_red_eye_outlined,color:Color(0xFFA7B0BB) ,)
          
                  ),
          
                ),
                SizedBox(height: 82.h,),
            GestureDetector(onTap: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>Bottomnavigation()),(route)=>false);
            },
              child: Container(
                width: 350.w,
                height: 73.h,
                decoration: ShapeDecoration(
                  color: Color(0xFFDDE0E3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                ),
              child: Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Color(0xFF01293B),
                    fontSize: 20.sp,
                    fontFamily: 'sfprodisplay',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.20.w,
                  ),
                ),
              )
              ),
            ),
                SizedBox(height: 20.h,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have an account?',
                      style: TextStyle(
                        color: Color(0xFFDDE0E3),
                        fontSize: 16.sp,
                        fontFamily: 'sfprodisplay',
                        fontWeight: FontWeight.w400,
          
                      ),
                    ),  SizedBox(width: 5.w,),
                    GestureDetector(onTap: (){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>SignIn()),(route)=>false);
                    },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color(0xFF0078FF),
                          fontSize: 16.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}
