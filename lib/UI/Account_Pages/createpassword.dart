import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Createpassword extends StatefulWidget {
  const Createpassword({super.key});

  @override
  State<Createpassword> createState() => _CreatepasswordState();
}

class _CreatepasswordState extends State<Createpassword> {
  bool isvisible = false;
  TextEditingController oldpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000B17),
      appBar: AppBar(foregroundColor: Colors.white ,
        title:  Text("Create a New Password",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.sp,
            fontFamily: 'sfprodisplay',
            fontWeight: FontWeight.w700,
          )), centerTitle: true,backgroundColor: Color(0xFF000B17),),
    //  backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(
                height: 170.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        cursorColor: Colors.grey,
                        controller: oldpassword,
                        style: TextStyle(
                            color: Colors.white, decorationThickness: 0.sp),
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
                          hintText: 'Old Password',
                          hintStyle: TextStyle(
                            color: Color(0xFFA7B0BB),
                            fontSize: 16.sp,
                            fontFamily: 'sfprodisplay',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 9) {
                            return 'Enter a valid password!....';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      TextFormField(
                        obscureText: !isvisible,
                        cursorColor: Colors.grey,
                        controller: newpassword,
                        style: TextStyle(
                            color: Colors.white, decorationThickness: 0.sp),
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
                            hintText: 'New Password',
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
                        height: 50.h,
                      ),
                      Container(
                        width: 250.w,
                        height: 70.h,
                        decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r))),
                        child:  Center(
                          child: Text("Set Your Password ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
