import 'package:drive2goo/Sign_UP.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}
TextEditingController email=TextEditingController();
TextEditingController password=TextEditingController();
class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width:double.infinity.w,
        height: double.infinity.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.09, 1.00),
            end: Alignment(0.09, -1),
            colors: [Colors.black, Color(0xFF272C2F), Color(0xFF525E64), Color(0xFF3B4F58), Color(0xFF01293B)],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              children: [
                SizedBox(
                  height: 146.h,
                ),
                Text(
                  'Welcome ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFF6F6F6),
                    fontSize: 32.sp,
                    fontFamily: 'sfprodisplay',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.80.w,
                  ),
                ),
            SizedBox(height: 68.h,),
                TextField(
                  controller: email,
                  style: TextStyle(color: Colors.white),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 15.w),
                    filled: true,
                      fillColor: Colors.white.withOpacity(0.18000000715255737),
                      border:OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(20.r)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r),borderSide: BorderSide.none,
          
                      ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r),borderSide: BorderSide.none,
          
                  ) ,
                      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20.r)),
          
                      hintText:
                      'Email ID',
                      hintStyle:  TextStyle(
                        color: Color(0xFFA7B0BB),
                        fontSize: 16.sp,
                        fontFamily: 'sfprodisplay',
                        fontWeight: FontWeight.w400,
                      ),
          
          
                  ),
                  // validator: (value) {
                  //   if (value!.isEmpty ||
                  //       !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  //           .hasMatch(value)) {
                  //     return 'Enter a valid email!';
                  //   }
                  //   return null;
                  // },
                ),
                SizedBox(height: 40.h,),
                TextField(
                  controller: password,
                  style: TextStyle(color: Colors.white),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 15.w),

                      filled: true,
                      fillColor: Colors.white.withOpacity(0.18000000715255737),
                      border:OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(20.r)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r),borderSide: BorderSide.none,
          
                      ),
                      focusedBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(20.r),borderSide: BorderSide.none,
          
                      ) ,
                      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20.r)),
          
                      hintText:
                      'Password',
                      hintStyle:  TextStyle(
                        color: Color(0xFFA7B0BB),
                        fontSize: 16.sp,
                        fontFamily: 'sfprodisplay',
                        fontWeight: FontWeight.w400,
                      ),
                    suffixIcon: Icon(Icons.remove_red_eye_outlined,color: Color(0xFFA7B0BB),)
          
          
                  ),
          
          
                ),SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xFFDDE0E3),
                        fontSize: 16.sp,
                        fontFamily: 'sfprodisplay',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),SizedBox(height: 88.h,),
            Container(
              width: 350.w,
              height: 73.h,
              decoration: ShapeDecoration(
                color: Color(0xFFDDE0E3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
          
              ),
            ),
          
              child:  Center(
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: Color(0xFF01293B),
                  fontSize: 20.sp,
                  fontFamily: 'sfprodisplay',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.20.w,
                ),
              ),
            ),
          ),
                SizedBox(height: 20.h,),
            Container(
              width: 350.w,
              height: 73.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 37.w,
                    height: 37.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/c.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w,),
                  Text(
            'Sign In With Google',
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontFamily: 'sfprodisplay',
                fontWeight: FontWeight.w400,
            letterSpacing: 0.16.w,
            ),
          )
                ],
              ),
            ),
                SizedBox(height: 20.h,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account',
                      style: TextStyle(
                        color: Color(0xFFDDE0E3),
                        fontSize: 16.sp,
                        fontFamily: 'sfprodisplay',
                        fontWeight: FontWeight.w400,

                      ),
                    ),SizedBox(width: 5.w,),
                    GestureDetector(onTap: (){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>SignUp()),(route)=>false);
                    },
                      child: Text(
                        'Sign Up',
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
