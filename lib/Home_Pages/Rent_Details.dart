import 'package:drive2goo/authentication_pages/Sign_In.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RentDetails extends StatefulWidget {
  const RentDetails({super.key});

  @override
  State<RentDetails> createState() => _RentDetailsState();
}

class _RentDetailsState extends State<RentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000B17),
      appBar: AppBar(
        backgroundColor: Color(0xFF000B17),
        leading: GestureDetector(onTap: (){
          Navigator.of(context).pop();
        },
          child: Container(
            width: 24.w,
            height: 24.h,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Renting Details',
          style: TextStyle(
            color: Color(0xFFF7F5F2),
            fontSize: 24.sp,
            fontFamily: 'sfprodisplay',
            fontWeight: FontWeight.w600,
            letterSpacing: 0.24.w,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 49.h,
                  ),
                  Container(
                    width: 380.w,
                    height: 123.h,
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(-5, 0.64),
                        end: Alignment(0.54, -7.14),
                        colors: [Color(0x1BFFFFFF), Color(0xFF000C1B)],
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.w, color: Color(0xFF58606A)),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 127.w,
                          height: 102.h,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/rentcar.png"),
                              fit: BoxFit.cover,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r)),
                          ),
                        ),
                        SizedBox(
                          width: 27.w,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Audi R8 Coupé',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFF7F5F2),
                                  fontSize: 20.sp,
                                  fontFamily: 'sfprodisplay',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                'White',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF627487),
                                  fontSize: 16.sp,
                                  fontFamily: 'sfprodisplay',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                '8000\$/Day',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontFamily: 'sfprodisplay',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 42.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 24.w,
                              height: 24.h,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/calendar.png"))),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Select Date',
                              style: TextStyle(
                                color: Color(0xFFF7F5F2),
                                fontSize: 16.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 23.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 148.w,
                                height: 80.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      textAlign: TextAlign.center,
                                      cursorColor: Colors.white,
                                      style: TextStyle(color: Colors.white),
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: InputDecoration(
                                        //filled: true,
                                        //fillColor: Colors.white.withOpacity(0.18000000715255737),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            borderSide: BorderSide(
                                                width: 1.w,
                                                color: Color(0xFF627487))),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            borderSide: BorderSide(
                                                width: 1.w,
                                                color: Color(0xFF627487))),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            borderSide: BorderSide(
                                                width: 1.w,
                                                color: Color(0xFF627487))),
                                        //errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),
                                        //  borderRadius: BorderRadius.circular(20.r)),
                                        hintText: 'dd/mm/yyyy',
                                        hintStyle: TextStyle(
                                          color: Color(0xFF627487),
                                          fontSize: 16.sp,
                                          fontFamily: 'sfprodisplay',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                      'Pickup Date',
                                      style: TextStyle(
                                        color: Color(0xFF627487),
                                        fontSize: 14.sp,
                                        fontFamily: 'sfprodisplay',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 25.h),
                                child: Container(
                                  width: 32.w,
                                  child: Image.asset(
                                    "assets/Line.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Container(
                                width: 148.w,
                                height: 80.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      textAlign: TextAlign.center,
                                      cursorColor: Colors.white,
                                      style: TextStyle(color: Colors.white),
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: InputDecoration(
                                        //filled: true,
                                        //fillColor: Colors.white.withOpacity(0.18000000715255737),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            borderSide: BorderSide(
                                                width: 1.w,
                                                color: Color(0xFF627487))),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            borderSide: BorderSide(
                                                width: 1.w,
                                                color: Color(0xFF627487))),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            borderSide: BorderSide(
                                                width: 1.w,
                                                color: Color(0xFF627487))),
                                        //errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),
                                        //  borderRadius: BorderRadius.circular(20.r)),
                                        hintText: 'dd/mm/yyyy',
                                        hintStyle: TextStyle(
                                          color: Color(0xFF627487),
                                          fontSize: 16.sp,
                                          fontFamily: 'sfprodisplay',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                      'Return Date',
                                      style: TextStyle(
                                        color: Color(0xFF627487),
                                        fontSize: 14.sp,
                                        fontFamily: 'sfprodisplay',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 44.h,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        //       horizontal: 7.65.w
                        horizontal: 10.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 24.w,
                              height: 24.h,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/h.png"),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: 10.35.w,
                            ),
                            Text(
                              'Select Location',
                              style: TextStyle(
                                color: Color(0xFFF7F5F2),
                                fontSize: 16.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 22.58.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Container(
                            width: 352.w,
                            height: 80.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  //textAlign: TextAlign.start,
                                  cursorColor: Colors.white,
                                  style: TextStyle(color: Colors.white),
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    //filled: true,
                                    //fillColor: Colors.white.withOpacity(0.18000000715255737),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.r),
                                        borderSide: BorderSide(
                                            width: 1.w, color: Color(0xFF627487))),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.r),
                                        borderSide: BorderSide(
                                            width: 1.w, color: Color(0xFF627487))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.r),
                                        borderSide: BorderSide(
                                            width: 1.w, color: Color(0xFF627487))),
                                    //errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),
                                    //  borderRadius: BorderRadius.circular(20.r)),
                                    hintText: 'Type your location or search in map',
                                    hintStyle: TextStyle(
                                      color: Color(0xFF627487),
                                      fontSize: 16.sp,
                                      fontFamily: 'sfprodisplay',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    suffixIcon: Icon(
                                      Icons.map_outlined,
                                      color: Color(0xFF627487),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  'Pickup location',
                                  style: TextStyle(
                                    color: Color(0xFF627487),
                                    fontSize: 14.sp,
                                    fontFamily: 'sfprodisplay',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 26.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Container(
                            width: 352.w,
                            height: 80.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  //textAlign: TextAlign.start,
                                  cursorColor: Colors.white,
                                  style: TextStyle(color: Colors.white),
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    //filled: true,
                                    //fillColor: Colors.white.withOpacity(0.18000000715255737),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.r),
                                        borderSide: BorderSide(
                                            width: 1.w, color: Color(0xFF627487))),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.r),
                                        borderSide: BorderSide(
                                            width: 1.w, color: Color(0xFF627487))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.r),
                                        borderSide: BorderSide(
                                            width: 1.w, color: Color(0xFF627487))),
                                    //errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),
                                    //  borderRadius: BorderRadius.circular(20.r)),
                                    hintText: 'Type your location or search in map',
                                    hintStyle: TextStyle(
                                      color: Color(0xFF627487),
                                      fontSize: 16.sp,
                                      fontFamily: 'sfprodisplay',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    suffixIcon: Icon(
                                      Icons.map_outlined,
                                      color: Color(0xFF627487),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  'Return location',
                                  style: TextStyle(
                                    color: Color(0xFF627487),
                                    fontSize: 14.sp,
                                    fontFamily: 'sfprodisplay',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 41.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        //    horizontal:3.w
                        horizontal: 10.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                width: 24.w,
                                height: 24.h,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Icon(
                                  Icons.payment,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              width: 10.35.w,
                            ),
                            Text(
                              'Payment Method',
                              style: TextStyle(
                                color: Color(0xFFF7F5F2),
                                fontSize: 16.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Column(
                            children: [
                              Container(
                                  width: 352.w,
                                  height: 55.h,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1.w, color: Color(0xFF627487)),
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 16.w,
                                      ),
                                      Container(
                                        width: 24.w,
                                        height: 24.h,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image:
                                                    AssetImage("assets/card.png"),
                                                fit: BoxFit.cover)),
                                      ),
                                      SizedBox(
                                        width: 25.w,
                                      ),
                                      Text(
                                        '**** **** ***5 6324',
                                        style: TextStyle(
                                          color: Color(0xFF627487),
                                          fontSize: 16.sp,
                                          fontFamily: 'sfprodisplay',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  )),
                              SizedBox(height: 14.h,),
                              Container(
                                  width: 352.w,
                                  height: 55.h,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1.w, color: Color(0xFF627487)),
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 16.w,
                                      ),
                                      Container(
                                        width: 24.w,
                                        height: 24.h,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image:
                                                    AssetImage("assets/cash.png"),
                                                fit: BoxFit.cover)),
                                      ),
                                      SizedBox(
                                        width: 25.w,
                                      ),
                                      Text(
                                        'Cash',
                                        style: TextStyle(
                                          color: Color(0xFF627487),
                                          fontSize: 16.sp,
                                          fontFamily: 'sfprodisplay',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  )),
                              SizedBox(height: 14.h,),
                              Container(
                                  width: 352.w,
                                  height: 55.h,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1.w, color: Color(0xFF627487)),
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 16.w,
                                      ),
                                      Container(
                                        width: 24.w,
                                        height: 24.h,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image:
                                                    AssetImage("assets/add.png"),
                                                fit: BoxFit.cover)),
                                      ),
                                      SizedBox(
                                        width: 25.w,
                                      ),
                                      Text(
                                        'Add payment method',
                                        style: TextStyle(
                                          color: Color(0xFF627487),
                                          fontSize: 16.sp,
                                          fontFamily: 'sfprodisplay',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 34.h,),
            Container(
              width: 430.w,
              height: 156.h,
              decoration: ShapeDecoration(
                color: Color(0x82C2C2C2).withOpacity(0.7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                ),
              ),child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 52.h),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 25.w,),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                        'RENTAL PRICE FOR ',
                        style: TextStyle(
                          color: Color(0xFF1F354D),
                          fontSize: 15.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w500,
                        ),
                                    ),
                        SizedBox(height: 11.h,),
                        Text(
                          '14 Days - 1,12,000\$',
                          style: TextStyle(
                            color: Color(0xFFF7F5F2),
                            fontSize: 20.sp,
                            fontFamily: 'sfprodisplay',
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 33.w,),
                    Container(
                      width: 161.w,
                      height: 50.h,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFFFF0C9),
                            Color(0xFFFFCE50),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),child: Center(
                        child: Text(
                        'Pay Now ',
                        style: TextStyle(
                          color: Color(0xFFF7F5F2),
                          fontSize: 20.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w600,
                        ),
                                          ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// sfprodisplay
