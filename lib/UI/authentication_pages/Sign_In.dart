import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:drive2goo/UI/Others/BottomNavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Bloc/Authantication/Sign_In_Bloc/sign_in_bloc.dart';
import '../../Repostory/ModelClass/authentication/SignInModelClass.dart';
import 'Sign_UP.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isvisible = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  late SignInModelClass signindata;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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
            colors: [
              Colors.black,
              Color(0xFF272C2F),
              Color(0xFF525E64),
              Color(0xFF3B4F58),
              Color(0xFF01293B)
            ],
          ),
        ),
        child: BlocListener<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is SignInBlocLoading) {
              showDialog(
                  context: context,
                  builder: (ctx) => Center(
                        child: CircularProgressIndicator(),
                      ));
              print("loading");
            }
            if (state is SignInBlocLoaded) {
              signindata = BlocProvider.of<SignInBloc>(context)
                  .signInModelClass;

              CheckLogin(
                  signindata.id.toString(),
                  //
                  //id koduthathe preference ne ane bakki ullathe namuke venamenkil kodutha mathi " athe orderne vendi koduthatha " order detail adikkathey sign cheytha usernte details vech cheyan venditte "pakshe ethe venakil atharm kodutha mathi
                  signindata.fullName.toString(),
                  signindata.phone.toString(),
                  signindata.email.toString()
                  
              );
              //
              Navigator.of(context).pop();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (_) => Bottomnavigation()),
                  (route) => false);
            }
            if (state is SignInBlocError) {
              Navigator.of(context).pop();
            }
            // TODO: implement listener
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Form(
                key: _formKey,
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
                    SizedBox(
                      height: 68.h,
                    ),
                    TextFormField(
                      cursorColor: Colors.grey,
                      controller: email,
                      style: TextStyle(
                          color: Colors.white, decorationThickness: 0.sp),
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
                        hintText: 'Email ID',
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
                      height: 40.h,
                    ),
                    TextFormField(
                      obscureText: !isvisible,
                      cursorColor: Colors.grey,
                      controller: password,
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
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            decoration: TextDecoration.none,
                            color: Color(0xFFA7B0BB),
                            fontSize: 16.sp,
                            fontFamily: 'sfprodisplay',
                            fontWeight: FontWeight.w400,
                          ),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  print(isvisible);
                                  isvisible = !isvisible;
                                });
                              },
                              child: isvisible
                                  ? Icon(BootstrapIcons.eye,
                                  color: Color(0xFFA7B0BB))
                                  : Icon(
                                BootstrapIcons.eye_slash,
                                color: Color(0xFFA7B0BB),
                              ))),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 9) {
                          return 'Enter a valid password!....';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
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
                    ),
                    SizedBox(
                      height: 88.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        final isValid = _formKey.currentState!.validate();
                        if (isValid) {
                          BlocProvider.of<SignInBloc>(context).add(
                              FetchSignInEvent(
                                  email: email.text, password: password.text));
                        }
                        _formKey.currentState?.save();
                      },
                      child: Container(
                        width: 350.w,
                        height: 73.h,
                        decoration: ShapeDecoration(
                          color: Color(0xFFDDE0E3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        child: Center(
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
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(onTap: (){
                      signInwithGoogle();
                    },
                      child: Container(
                        width: 350.w,
                        height: 73.h,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            SizedBox(
                              width: 4.w,
                            ),
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
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account',
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
                                MaterialPageRoute(builder: (_) => SignUp()),
                                    (route) => false);
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
        ),
      ),
    );
  }

  //sharedpreference
  void CheckLogin(String userId, String userName, String userPhonenumber,
      String userEmail) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userId", userId);

    //ethile bakki ullathe koduthathe molil parja details ne vendi matharm "code number 206"
    prefs.setString("userName", userName);
    prefs.setString("userPhonenumber", userPhonenumber);
    prefs.setString("userEmail", userEmail);
  }
//sharedpreference
  Future<String?> signInwithGoogle() async {
    // CheckLogin(signindata.id.toString(), signindatat.fullName.toString(), signindata.phone.toString(), signindata.email.toString());
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      //api ayite google signup cheyyumbo  ee rand varicode venam
      final UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;
      //the end code

      BlocProvider.of<SignInBloc>(context).add(FetchSignInEvent(email: user!.email.toString(), password: user.uid.toString()));
      print("hy"+ user.email.toString());
      print("hellou"+user.uid.toString());
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (_) => Bottomnavigation(
      //         user_name: user!.displayName.toString(),
      //         user_email: user.email.toString(),
      //         user_uid_password: user.uid.toString())));
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }
}
