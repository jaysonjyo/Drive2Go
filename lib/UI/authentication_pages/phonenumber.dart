import 'package:drive2goo/Bloc/Sign_up_Bloc/sign_up_bloc.dart';
import 'package:drive2goo/UI/Others/BottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Sign_In.dart';

class Phonenumber extends StatefulWidget {
  final String user_name;
  final String user_email;
  final String user_uid_password;

  const Phonenumber({super.key,
    required this.user_name,
    required this.user_email,
    required this.user_uid_password});

  @override
  State<Phonenumber> createState() => _PhonenumberState();
}

class _PhonenumberState extends State<Phonenumber> {
  TextEditingController phonenumber = TextEditingController();
  var _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF01293B),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.grey,
                  controller: phonenumber,
                  style:
                  TextStyle(color: Colors.white, decorationThickness: 0.sp),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
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
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'PhoneNumber',
                    hintStyle: TextStyle(
                      color: Color(0xFFA7B0BB),
                      fontSize: 16.sp,
                      fontFamily: 'sfprodisplay',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 10) {
                      return 'Enter a valid Phone Number!....';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 50.h,
                ),
                BlocListener<SignUpBloc, SignUpState>(
                  listener: (context, state) {
                    if (state is SignupBlocLoading) {
                      showDialog(
                          context: context,
                          builder: (ctx) =>
                              Center(
                                child: CircularProgressIndicator(),
                              ));
                      print("loading");
                    }
                    if (state is SignupBlocLoaded) {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => SignIn()),
                              (route) => false);
                    }
                    if (state is SignupBlocError) {
                      Navigator.of(context).pop();

                      print("error");
                    }

                    // TODO: implement listener
                  },
                  child: GestureDetector(onTap: ()
                  {
                    final isValid = _formKey.currentState!.validate();
                    if (isValid) {
                      BlocProvider.of<SignUpBloc>(context).add(FetchSignUpEvent(
                          name: widget.user_name,
                          email: widget.user_email,
                          phone:phonenumber.text,
                          password: widget.user_uid_password));
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
