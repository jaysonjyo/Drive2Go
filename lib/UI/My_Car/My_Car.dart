import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCar extends StatefulWidget {
  const MyCar({super.key});

  @override
  State<MyCar> createState() => _MyCarState();
}

class _MyCarState extends State<MyCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF000B17),
        appBar: AppBar(
          backgroundColor: Color(0xFF000B17),
          leading: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        body: DefaultTabController(
            length: 2,
            child: Column(children: [
              Container(
                width: double.infinity.w,
                height: 50.h,
                decoration: ShapeDecoration(
                  color: Color(0xFF000B17),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: TabBar(
                  indicatorPadding: EdgeInsets.only(left: 10.w,right: 10.w),
                  indicatorColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerHeight: 1.h,
                  // indicator: BoxDecoration(
                  //   color: Colors.grey,
                  //   borderRadius: BorderRadius.circular(0),
                  // ),
                  labelColor: Colors.white,
                  dividerColor: Colors.black,
                  tabs: [
                    Tab(
                      child: Text(
                        "Rent Car",
                        style: TextStyle(
                          color: Color(0xFFF7F5F2),
                          fontSize: 20.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "My Car",
                        style: TextStyle(
                          color: Color(0xFFF7F5F2),
                          fontSize: 20.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(

                  child: TabBarView(
                      children: [

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    child: ListView.separated(
                      itemCount: 20,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, position) {
                        return  GestureDetector(onTap: (){
                         // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CarDetails()));
                        },
                          child: Container(
                            width: 391.w,
                            height: 129.h,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(-5, 0.54),
                                end: Alignment(0.64, -0.54),
                                colors: [Color(0x1BFFFFFF), Color(0xFF000C1B)],
                              ),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1.w, color: Color(0xFF58606A)),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 4.w,),
                                Container(
                                  width: 134.w,
                                  height: 121.h,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/g.png"),
                                      fit: BoxFit.cover,
                                    ),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 16.h),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Car name',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFFF7F5F2),
                                          fontSize: 16.sp,
                                          fontFamily: 'sfprodisplay',
                                          fontWeight: FontWeight.w600,

                                        ),
                                      ),
                                      SizedBox(height: 8.h,),
                                      Text(
                                        'James Robert',
                                        style: TextStyle(
                                          color: Color(0xFFF7F5F2),
                                          fontSize: 15.sp,
                                          fontFamily: 'sfprodisplay',
                                          fontWeight: FontWeight.w400,

                                        ),
                                      ), SizedBox(height: 8.h,),
                                      Text(
                                        '2022',
                                        style: TextStyle(
                                          color: Color(0xFFF7F5F2),
                                          fontSize: 12.sp,
                                          fontFamily: 'sfprodisplay',
                                          fontWeight: FontWeight.w400,

                                        ),
                                      ), SizedBox(height: 8.h,),
                                      Row(
                                        children: [
                                          Text(
                                            '1000 km',
                                            style: TextStyle(
                                              color: Color(0xFFF7F5F2),
                                              fontSize: 12.sp,
                                              fontFamily: 'sfprodisplay',
                                              fontWeight: FontWeight.w400,

                                            ),
                                          ),
                                          SizedBox(width: 97.w
                                            ,),
                                          Text(
                                            '\$5000 / day',
                                            style: TextStyle(
                                              color: Color(0xFFFFD66D),
                                              fontSize: 16.sp,
                                              fontFamily: 'sfprodisplay',
                                              fontWeight: FontWeight.w400,

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
                        return SizedBox(height: 10.h,);
                      },

                    ),
                  ),

                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.w),
                      child: ListView.separated(
                        itemCount: 20,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, position) {
                          return  GestureDetector(onTap: (){
                            // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CarDetails()));
                          },
                            child: Container(
                              width: 391.w,
                              height: 129.h,
                              decoration: ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(-5, 0.54),
                                  end: Alignment(0.64, -0.54),
                                  colors: [Color(0x1BFFFFFF), Color(0xFF000C1B)],
                                ),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1.w, color: Color(0xFF58606A)),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 4.w,),
                                  Container(
                                    width: 134.w,
                                    height: 121.h,
                                    decoration: ShapeDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/g.png"),
                                        fit: BoxFit.cover,
                                      ),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 16.h),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Car name',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFFF7F5F2),
                                            fontSize: 16.sp,
                                            fontFamily: 'sfprodisplay',
                                            fontWeight: FontWeight.w600,

                                          ),
                                        ),
                                        SizedBox(height: 8.h,),
                                        Text(
                                          'James Robert',
                                          style: TextStyle(
                                            color: Color(0xFFF7F5F2),
                                            fontSize: 15.sp,
                                            fontFamily: 'sfprodisplay',
                                            fontWeight: FontWeight.w400,

                                          ),
                                        ), SizedBox(height: 8.h,),
                                        Text(
                                          '2022',
                                          style: TextStyle(
                                            color: Color(0xFFF7F5F2),
                                            fontSize: 12.sp,
                                            fontFamily: 'sfprodisplay',
                                            fontWeight: FontWeight.w400,

                                          ),
                                        ), SizedBox(height: 8.h,),
                                        Row(
                                          children: [
                                            Text(
                                              '1000 km',
                                              style: TextStyle(
                                                color: Color(0xFFF7F5F2),
                                                fontSize: 12.sp,
                                                fontFamily: 'sfprodisplay',
                                                fontWeight: FontWeight.w400,

                                              ),
                                            ),
                                            SizedBox(width: 97.w
                                              ,),
                                            Text(
                                              '\$5000 / day',
                                              style: TextStyle(
                                                color: Color(0xFFFFD66D),
                                                fontSize: 16.sp,
                                                fontFamily: 'sfprodisplay',
                                                fontWeight: FontWeight.w400,

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
                          return SizedBox(height: 10.h,);
                        },

                      ),
                    ),
              ]))
            ])));
  }
}
