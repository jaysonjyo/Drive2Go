import 'package:drive2goo/Buy_Car_Pages/Buy_car_Details.dart';
import 'package:drive2goo/Search_page/Buy_Car_Search.dart';
import 'package:drive2goo/authentication_pages/Sign_In.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Home_Pages/Car_Details.dart';

class BuyCar extends StatefulWidget {
  const BuyCar({super.key});

  @override
  State<BuyCar> createState() => _BuyCarState();
}

class _BuyCarState extends State<BuyCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000B17),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 18.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 92.h,),
              Row(
                children: [
                  SizedBox(width: 10.w,),
                  GestureDetector(onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>BuyCarSearch()));
                  },
                    child: Container(
                      width: 245.w,
                      height: 48.h,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(-0.19, 6),
                          end: Alignment(0.09, -1),
                          colors: [Color(0x1BFFFFFF), Color(0xFF000C1B)],
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1.w, color: Color(0xFF58606A)),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                     child:  Row(
                       children: [
                         SizedBox(width: 13.w,),
                         Icon(Icons.search_rounded,color: Colors.white,),
                         SizedBox(width: 13.w,),
                         Text(
                           'Search your dream car..',
                           textAlign: TextAlign.center,
                           style: TextStyle(
                             color: Color(0xFF627387),
                             fontSize: 15.sp,
                             fontFamily: 'sfprodisplay',
                             fontWeight: FontWeight.w300,
                             letterSpacing: 1.50.w,
                           ),
                         )
                       ],
                     ),
                    ),
                  ),
                  SizedBox(width: 23.w,),
                  Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFFCE50),
                      shape: OvalBorder(),
                    ),child:Icon(Icons.tune,color: Colors.white,size: 24.sp,),
                  ),
                  SizedBox(width: 14.w,),
                  Container(
                    width: 45.w,
                    height: 45.h,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF7F5F2),
                      shape: OvalBorder(),
                    ),
                    child: Icon(Icons.notifications_none_outlined,size: 24.sp,),
                  ),
                ],
              ),
              SizedBox(height: 40.h,),
              Padding(
                padding:  EdgeInsets.only(left: 9.w),
                child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Latest Model ',
                      style: TextStyle(
                        color: Color(0xFFF7F5F2),
                        fontSize: 22.sp,
                        fontFamily: 'sfprodisplay',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                Container(
                  width: 66.w,
                  height: 38.h,
                child:  Center(
                  child: Text(
                    'View all',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFF7F5F2),
                      fontSize: 15.sp,
                      fontFamily: 'sfprodisplay',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                )
                  ],
                ),
              ),
              SizedBox(height: 4.h,),
              SizedBox(
                width: double.infinity.w,
                height: 223.h,
                child: ListView.separated(
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, position) {
                    return  GestureDetector(onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>BuyCarDetails()));
                    },
                      child: Container(
                        width: 185.w,
                        height: 223.h,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(-5, 0.54),
                            end: Alignment(0.54, -0.54),
                            // begin: Alignment(-0.99, 1.00),
                            // end: Alignment(0.09, -5),
                            colors: [Color(0x1BFFFFFF), Color(0xFF000C1B)],
                          ),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.w, color: Color(0xFF58606A)),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 3.h,),
                            Container(
                              width: 177.w,
                              height: 146.h,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/g.png"),
                                  fit: BoxFit.cover,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.r),
                                    topRight: Radius.circular(8.r),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 9.w,vertical: 13.h),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Audi R8 Coupé',maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFF7F5F2),
                                      fontSize: 16.sp,
                                      fontFamily: 'sfprodisplay',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 6.h,),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
                                    children: [
          
                                      Row(mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 14.w,
                                            height: 14.h,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(image: AssetImage("assets/h.png"),fit: BoxFit.cover)
                                            ),
                                          ),
                                          SizedBox(width: 5.w,),
                                          Text(
                                            'Kottakal',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFFF7F5F2),
                                              fontSize: 13.sp,
                                              fontFamily: 'sfprodisplay',
                                              fontWeight: FontWeight.w300,
                                              letterSpacing: 0.50.w,
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        '\$ 8000 / day',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFFFFD66D),
                                          fontSize: 13.sp,
                                          fontFamily: 'sfprodisplay',
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.50.w,
                                        ),
                                      )
                                    ],
                                  )
                                ],
          
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, position) {
                    return SizedBox(width: 18.w,);
                  },
          
                ),
              ),
              SizedBox(height: 30.h,),
              Padding(
                padding:  EdgeInsets.only(left: 9.w),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'High Milage',
                      style: TextStyle(
                        color: Color(0xFFF7F5F2),
                        fontSize: 22.sp,
                        fontFamily: 'sfprodisplay',
                        fontWeight: FontWeight.w600,
          
                      ),
                    ),
                    Container(
                      width: 66.w,
                      height: 38.h,
                      child: Center(
                        child: Text(
                          'View all',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFF7F5F2),
                            fontSize: 15.sp,
                            fontFamily: 'sfprodisplay',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 9.h,),
              SizedBox(
                width: 389.w,
                height: (236*6/2).h,
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 18.0.w,
                  mainAxisSpacing: 20.0.h,
                  childAspectRatio: 185/225,
                  shrinkWrap: true,padding: EdgeInsets.zero,
                  children: List.generate(6,
                        (index) {
                      return GestureDetector(onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>BuyCarDetails()));
                      },
                        child: Container(
                          width: 185.w,
                          height: 223.h,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(-5, 0.54),
                              end: Alignment(0.54, -0.54),
                              colors: [Color(0x1BFFFFFF), Color(0xFF000C1B)],
                            ),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1.w, color: Color(0xFF58606A)),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 3.h,),
                              Container(
                                width: 177.w,
                                height: 146.h,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/g.png"),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.r),
                                      topRight: Radius.circular(8.r),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 9.w,vertical: 13.h),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Audi R8 Coupé',maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFFF7F5F2),
                                        fontSize: 16.sp,
                                        fontFamily: 'sfprodisplay',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 6.h,),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      children: [

                                        Row(mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 14.w,
                                              height: 14.h,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(image: AssetImage("assets/h.png"),fit: BoxFit.cover)
                                              ),
                                            ),
                                            SizedBox(width: 5.w,),
                                            Text(
                                              'Kottakal',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFFF7F5F2),
                                                fontSize: 13.sp,
                                                fontFamily: 'sfprodisplay',
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: 0.50.w,
                                              ),
                                            )
                                          ],
                                        ),
                                        Text(
                                          '\$ 8000 / day',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFFFFD66D),
                                            fontSize: 13.sp,
                                            fontFamily: 'sfprodisplay',
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.50.w,
                                          ),
                                        )
                                      ],
                                    )
                                  ],

                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },),
                ),
              ),
             SizedBox(height: 130.h,)

            ],
          ),
        ),
      ),

    );
  }
}
