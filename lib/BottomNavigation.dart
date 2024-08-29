import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:drive2goo/Account_Pages/Account.dart';
import 'package:drive2goo/Buy_Car_Pages/Buy_Car.dart';
import 'package:drive2goo/Home_Pages/Home.dart';
import 'package:drive2goo/My_Car/My_Car.dart';
import 'package:drive2goo/Search_page/Search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  final screens = [Home(),MyCar(),BuyCar(),Account(),];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Stack(
  children: [
    screens[currentIndex],
    Padding(
      padding:  EdgeInsets.symmetric(horizontal: 18.w,vertical: 38.h),
      child: Column(mainAxisAlignment: MainAxisAlignment.end,

        children: [
          Container(
            width: 388.w,
            height: 74.h,
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.7099999904632568),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
              ),
            ),
           
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
              child: BottomNavigationBar(
                elevation: 0,
                selectedLabelStyle: TextStyle(fontSize: 0.sp),
                showSelectedLabels: true,
                backgroundColor: Colors.white.withOpacity(0.05),

                type: BottomNavigationBarType.fixed,

                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon:
                      currentIndex == 0 ?  Container(
                        width: 52.w,
                        height: 52.h,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.00, -1.00),
                            end: Alignment(0, 1),
                            colors: [Colors.white.withOpacity(0.5899999737739563), Color(0xD69E9E9E)],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11.r),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4.r,
                              offset: Offset(0, 4),
                              spreadRadius: 0.r,
                            )
                          ],
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(  width: 28.w,
                            height: 28.h,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/home.png"))
                            )),
                            Text(
                              'Home',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF1F354D),
                                fontSize: 10.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w300,

                              ),
                            )
                          ],
                        ),
                      ):Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(  width: 28.w,
                              height: 28.h,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage("assets/home.png"))
                              )),
                          Text(
                            'Home',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF1F354D),
                              fontSize: 10.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w300,

                            ),
                          )
                        ],
                      ),
                      label: ""
                  ),
                  BottomNavigationBarItem(
                      icon:currentIndex == 1 ? Container(
                        width: 52.w,
                        height: 52.h,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.00, -1.00),
                            end: Alignment(0, 1),
                            colors: [Colors.white.withOpacity(0.5899999737739563), Color(0xD69E9E9E)],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11.r),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4.r,
                              offset: Offset(0, 4),
                              spreadRadius: 0.r,
                            )
                          ],
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(  width: 28.w,
                                height: 28.h,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(

                                ),child: Icon(BootstrapIcons.car_front,color:Color(0xFF1F354D) ,),
                            ),
                            Text(
                              'My Car',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF1F354D),
                                fontSize: 10.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ):Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(  width: 28.w,
                              height: 28.h,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                              ),
                            child: Icon(BootstrapIcons.car_front,color:Color(0xFF1F354D) ,),

                          ),
                          Text(
                            'My Car',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF1F354D),
                              fontSize: 10.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),  label: ""
                  ),
                  BottomNavigationBarItem(
                      icon:currentIndex == 2 ? Container(
                        width: 52.w,
                        height: 52.h,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.00, -1.00),
                            end: Alignment(0, 1),
                            colors: [Colors.white.withOpacity(0.5899999737739563), Color(0xD69E9E9E)],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11.r),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4.r,
                              offset: Offset(0, 4),
                              spreadRadius: 0.r,
                            )
                          ],
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(  width: 28.w,
                                height: 28.h,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("assets/shopping.png"))
                                )),
                            Text(
                              'Buy Car',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF1F354D),
                                fontSize: 10.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w300,

                              ),
                            )
                          ],
                        ),
                      ):
                      Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(  width: 28.w,
                          height: 28.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/shopping.png"))
                          )),
                      Text(
                        'Buy Car',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF1F354D),
                          fontSize: 10.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w300,

                        ),
                      )
                    ],
                  ),
                      label: ""

                  ),
                  BottomNavigationBarItem(
                      icon:currentIndex == 3 ?Container(
                        width: 52.w,
                        height: 52.h,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.00, -1.00),
                            end: Alignment(0, 1),
                            colors: [Colors.white.withOpacity(0.5899999737739563), Color(0xD69E9E9E)],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11.r),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4.r,
                              offset: Offset(0, 4),
                              spreadRadius: 0.r,
                            )
                          ],
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(  width: 28.w,
                                height: 28.h,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("assets/user.png"))
                                )),
                            Text(
                              'Account',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF1F354D),
                                fontSize: 10.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w300,

                              ),
                            )
                          ],
                        ),
                      ):Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(  width: 28.w,
                              height: 28.h,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage("assets/user.png"))
                              )),
                          Text(
                            'Account',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF1F354D),
                              fontSize: 10.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w300,

                            ),
                          )
                        ],
                      ),
                      label: ""

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),

  ],
),
    );
  }
}
