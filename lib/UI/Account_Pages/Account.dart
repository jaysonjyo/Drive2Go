import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:drive2goo/UI/Account_Pages/editpage.dart';
import 'package:drive2goo/UI/Account_Pages/feedback.dart';
import 'package:drive2goo/UI/Account_Pages/help_center.dart';
import 'package:drive2goo/UI/Account_Pages/privacy_policy.dart';
import 'package:drive2goo/UI/Account_Pages/terms_conditions.dart';
import 'package:drive2goo/UI/authentication_pages/Sign_In.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Bloc/Profile/User/user_bloc.dart';
import '../../Repostory/ModelClass/profileupdate/UserModelclass.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late UserModelclass userdata;
  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(FetchUserevent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF000B17),

        appBar: AppBar(
          backgroundColor: Color(0xFF000B17),
          // leading: GestureDetector(
          //   onTap: () {
          //
          //   },
          //   child: Container(
          //       width: 24.w,
          //       height: 24.h,
          //       clipBehavior: Clip.antiAlias,
          //       decoration: BoxDecoration(),
          //       child: Icon(
          //         Icons.arrow_back,
          //         color: Colors.white,
          //       )),
          // ),
          actions: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      width: 430.w,
                      height: 167.h, decoration: ShapeDecoration(
                      color: Color(0xFFF7F5F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r),
                        ),
                      ),
                    ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 42.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 46.w),
                              child: Text(
                                'Share profile',
                                style: TextStyle(
                                  color: Color(0xFF000B17),
                                  fontSize: 15.sp,
                                  fontFamily: 'sfprodisplay',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 22.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              child: Divider(
                                  thickness: 1.sp,
                                  height: 1.h,
                                  color: Color(0xFFD9D9D9)),
                            ),
                            SizedBox(
                              height: 22.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 46.w),
                              child: Text(
                                'Copy Link',
                                style: TextStyle(
                                  color: Color(0xFF000B17),
                                  fontSize: 15.sp,
                                  fontFamily: 'sfprodisplay',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Container(
                  width: 24.w,
                  height: 38.h,
                  child: Icon(
                    Icons.more_vert_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<UserBloc, UserState>(
  builder: (context, state) {
    if(state is UserBlocLoading){
    return Center(child: CircularProgressIndicator(),);
    }
    if(state is UserBlocError){

    return Center(child:Text("Error"),);
    }
    if(state is UserBlocLoaded){
    userdata=BlocProvider.of<UserBloc>(context).userModelclass;

    return Column(
    children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 35.w,
                ),
                Container(
                    width: 82.w,
                    height: 80.h,
                    child: Stack(children: [
                      ClipRRect(borderRadius: BorderRadius.circular(7.r),
                        child: Container(
                          width: 74.w,
                          height: 74.h,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.r)),
                          ),
                          child:  Image.network(userdata.profilePhotoUrl.toString(),fit: BoxFit.cover,),
                        ),
                      ),
                      Positioned(
                        left: 55.w,
                        top: 53.h,
                        child: Container(
                          width: 27.w,
                          height: 27.h,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFFD66D),
                            shape: OvalBorder(),
                          ),
                          // child: Icon(
                          //   Icons.edit,
                          //   color: Colors.white,
                          //   size: 15.sp,
                          // ),
                        ),
                      )
                    ])),
                SizedBox(
                  width: 18.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userdata.fullName.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        userdata.email.toString(),
                        //'Individual profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 11.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 56.w),
              child: Divider(
                thickness: 1.sp,
                height: 1.h,
                color: Color(0xFFD9D9D9),
              ),
            ),
            SizedBox(
              height: 23.h,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account settings',
                          style: TextStyle(
                            color: Color(0xFF929191),
                            fontSize: 12.sp,
                            fontFamily: 'sfprodisplay',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: GestureDetector(onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Editpage(profilename: userdata.fullName.toString(),)));
                    },
                      child: Container(
                        width: 113.w,
                        height: 24.h,
                        child: Row(
                          children: [
                            Container(
                              width: 24.w,
                              height: 24.h,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(

                              ),
                              child: Image.asset("assets/edit.png",fit: BoxFit.cover,color: Colors.white,),
                            ),
                            SizedBox(
                              width: 22.w,
                            ),
                            Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 19.56.h,
                  ),
                  Divider(
                      thickness: 1.sp, height: 1.h, color: Color(0xFFD9D9D9)),
                  SizedBox(
                    height: 20.44.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Column(
                      children: [
                        Text(
                          'Support',
                          style: TextStyle(
                            color: Color(0xFF929191),
                            fontSize: 12.sp,
                            fontFamily: 'sfprodisplay',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: GestureDetector(onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>HelpCenter()));
                    },
                      child: Container(
                        width: 76.w,
                        height: 24.h,
                        child: Row(
                          children: [
                            Container(
                                width: 24.w,
                                height: 24.h,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Icon(
                                  Icons.help_outline_outlined,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              width: 22.w,
                            ),
                            Text(
                              'Help',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 19.56.h,
                  ),
                  Divider(
                      thickness: 1.sp, height: 1.h, color: Color(0xFFD9D9D9)),
                  SizedBox(
                    height: 20.44.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: GestureDetector(onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Feedbackpage() ));
                    },
                      child: Container(
                        width: 108.w,
                        height: 24.h,
                        child: Row(
                          children: [
                            Container(
                              width: 24.w,
                              height: 24.h,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(

                              ),
                                child: Image.asset("assets/thumbs-up.png",fit: BoxFit.cover,color: Colors.white,)
                            ),
                            SizedBox(
                              width: 22.w,
                            ),
                            Text(
                              'Feedback',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 19.56.h,
                  ),
                  Divider(
                      thickness: 1.sp, height: 1.h, color: Color(0xFFD9D9D9)),
                  SizedBox(
                    height: 20.44.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: Container(
                      width: 138.w,
                      height: 24.h,
                      child: Row(
                        children: [
                          Icon(
                            Icons.share,color: Colors.white,
                            size: 24.sp,
                          ),
                          SizedBox(
                            width: 22.w,
                          ),
                          Text(
                            'Share this App',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 19.56.h,
                  ),
                  Divider(
                      thickness: 1.sp, height: 1.h, color: Color(0xFFD9D9D9)),
                  SizedBox(
                    height: 20.44.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: Container(
                      width: 189.w,
                      height: 24.h,
                      child: Row(
                        children: [
                          Icon(
                            BootstrapIcons.google_play,color: Colors.white,
                            size: 24.sp,
                          ),
                          SizedBox(
                            width: 22.w,
                          ),
                          Text(
                            'Rate on Google Play',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 19.56.h,
                  ),
                  Divider(
                      thickness: 1.sp, height: 1.h, color: Color(0xFFD9D9D9)),
                  SizedBox(
                    height: 23.44.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Legal',
                          style: TextStyle(
                            color: Color(0xFF929191),
                            fontSize: 12.sp,
                            fontFamily: 'sfprodisplay',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 19.44.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: GestureDetector(onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=> PrivacyPolicy() ));
                    },
                      child: Container(
                        width: 189.w,
                        height: 24.h,
                        child: Row(
                          children: [
                            Container(
                                width: 24.w,
                                height: 24.h,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Icon(
                                  Icons.lock_outline,
                                  size: 24.sp,color: Colors.white,
                                )),
                            SizedBox(
                              width: 22.w,
                            ),
                            Text(
                              'Privacy Policy',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 19.56.h,
                  ),
                  Divider(
                      thickness: 1.sp, height: 1.h, color: Color(0xFFD9D9D9)),
                  SizedBox(
                    height: 19.44.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: GestureDetector(onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>TermsCondition()));
                    },
                      child: Container(
                        width: 189.w,
                        height: 24.h,
                        child: Row(
                          children: [
                            Container(
                                width: 24.w,
                                height: 24.h,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Icon(
                                  BootstrapIcons.shield,
                                  size: 24.sp,color: Colors.white,
                                )),
                            SizedBox(
                              width: 22.w,
                            ),
                            Text(
                              'Terms and Conditions',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 19.56.h,
                  ),
                  Divider(
                      thickness: 1.sp, height: 1.h, color: Color(0xFFD9D9D9)),
                  SizedBox(
                    height: 38.44.h,
                  ),
                  Center(
                    child: GestureDetector(onTap: () async {
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.clear();
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> SignIn()), (route)=>false);
                    },
                      child: Container(
                          width: 339.w,
                          height: 56.h,
                          decoration: ShapeDecoration(
                            color:Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r)),
                          ),
                          child: Center(
                            child: Text(
                              'Log Out',
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                color:  Color(0xFF000B17),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              )),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 125.h,
            )
          ]);  }else{
      return SizedBox();
    }
  },
),
        ));
  }
}
