import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:drive2goo/Bloc/Sign_up_Bloc/sign_up_bloc.dart';
import 'package:drive2goo/Repostory/ModelClass/authentication/SignUpModelClass.dart';
import 'package:drive2goo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Others/BottomNavigation.dart';
import '../Home_Pages/Home.dart';
import '../Toast_message/Toast_message.dart';
import 'Sign_In.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

//controllers
TextEditingController fullname = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController phonenumber = TextEditingController();
TextEditingController password = TextEditingController();
//controllers
bool isvisible = false;

var _formKey = GlobalKey<FormState>();

class _SignUpState extends State<SignUp> {
  //api calling
  late SignUpModelClass Signupdata;

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
            padding: EdgeInsets.symmetric(horizontal: 39.w),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 147.h,
                  ),
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
                  SizedBox(
                    height: 81.h,
                  ),
                  TextFormField(
                    cursorColor: Colors.grey,
                    controller: fullname,
                    style: TextStyle(color: Colors.white,decorationThickness: 0.sp),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 25.w),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.18000000715255737),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20.r)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide.none,
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20.r)),
                      hintText: 'Full Name',
                      hintStyle: TextStyle(
                        color: Color(0xFFA7B0BB),
                        fontSize: 16.sp,
                        fontFamily: 'sfprodisplay',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your name!....';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    cursorColor: Colors.grey,
                    controller: email,
                    style: TextStyle(color: Colors.white,decorationThickness: 0.sp),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 25.w),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.18000000715255737),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20.r)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide.none,
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20.r)),
                      hintText: 'Email Address',
                      hintStyle: TextStyle(
                        color: Color(0xFFA7B0BB),
                        fontSize: 16.sp,
                        fontFamily: 'sfprodisplay',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    cursorColor: Colors.grey,
                    controller: phonenumber,
                    style: TextStyle(color: Colors.white,decorationThickness: 0.sp),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 25.w),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.18000000715255737),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20.r)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide.none,
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20.r)),
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(
                        color: Color(0xFFA7B0BB),
                        fontSize: 16.sp,
                        fontFamily: 'sfprodisplaysfprodisplay',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 10) {
                        return 'valid Number.!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    obscureText:!isvisible,
                    cursorColor: Colors.grey,
                    controller: password,
                    style: TextStyle(color: Colors.white,decorationThickness: 0.sp),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 20.h, horizontal: 25.w),
                        filled: true,
                        fillColor:
                            Colors.white.withOpacity(0.18000000715255737),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20.r)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide.none,
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(20.r)),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Color(0xFFA7B0BB),
                          fontSize: 16.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w400,
                        ),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isvisible = !isvisible;
                              });
                            },
                            child: isvisible
                                ? Icon(
                                    BootstrapIcons.eye,
                                    color: Color(0xFFA7B0BB),
                                  )
                                : Icon(BootstrapIcons.eye_slash,
                                    color: Color(0xFFA7B0BB)))),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 9) {
                        return 'Enter a valid password!....';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 82.h,
                  ),
                  BlocListener<SignUpBloc, SignUpState>(
                    listener: (context, state) {
                      if (state is SignupBlocLoading) {
                        showDialog(
                            context: context,
                            builder: (ctx) => Center(
                                  child: CircularProgressIndicator(),
                                ));
                        print("loading");
                      }
                      if (state is SignupBlocLoaded) {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (_) => SignIn()),
                            (route) => false);
                      }
                      if (state is SignupBlocError) {
                        Navigator.of(context).pop();

                        print("error");
                      }
                    },
                    child: GestureDetector(
                      onTap: () {
                        final isValid = _formKey.currentState!.validate();
                        if (isValid) {
                          BlocProvider.of<SignUpBloc>(context).add(
                              FetchSignUpEvent(
                                  name: fullname.text,
                                  email: email.text,
                                  phone: phonenumber.text,
                                  password: password.text));
                        }
                        _formKey.currentState?.save();
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
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Have an account?',
                        style: TextStyle(
                          color: Color(0xFFDDE0E3),
                          fontSize: 16.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (_) => SignIn()),
                              (route) => false);
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
      ),
    );
  }
}
