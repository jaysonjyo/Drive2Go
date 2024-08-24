import 'package:drive2goo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000B17),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 37.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9.w),
                  child: Column(
                    children: [
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 179.w,
                            height: 55.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'location',
                                  style: TextStyle(
                                    color: Color(0xFFF7F5F2),
                                    fontSize: 20.sp,
                                    fontFamily: 'sfprodisplay',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 7.h,),
                                Text(
                                  'Malappuram , Kerala',
                                  style: TextStyle(
                                    color: Color(0xFFF7F5F2),
                                    fontSize: 20.sp,
                                    fontFamily: 'sfprodisplay',
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 45.w,
                            height: 45.h,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF7F5F2),
                              shape: OvalBorder(),
                            ),
                            child: Icon(Icons.notifications_none_outlined,size: 24.sp,),
                          )
                        ],
                      ),
                      SizedBox(height: 19.h,),
                      Row(crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 292.w,
                            height: 48.h,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                 begin: Alignment(-0.19, 6),
                                 end: Alignment(0.09, -1),

                                // begin: Alignment(-0.99, 2.00),
                                // end: Alignment(0.09, -5),
                                colors: [Color(0x1BFFFFFF), Color(0xFF000C1B)],
                              ),
                              shape: RoundedRectangleBorder(
                                side:
                                    BorderSide(width: 1.w, color: Color(0xFF58606A)),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            child:Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 13.w),
                              child: Row(
                                children: [
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
                            )
                          ),
                          Container(
                            width: 48.w,
                            height: 48.h,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFCE50),
                              shape: OvalBorder(),
                            ),child: Icon(Icons.tune,color: Colors.white,size: 24.sp,),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
            SizedBox(height: 32.h,),
                SizedBox(
                  width: 388.w,
                  height: 78.h,
                  child: ListView.separated(
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, position) {
                      return Container(
                        width: 78.w,
                        height: 78.h,
                        decoration: ShapeDecoration(
                          color: Color(0xFFF3F3F3),
                          shape: OvalBorder(),
                        ),
                        child: Image.asset("assets/f.png",fit: BoxFit.cover,),
                      );
                    },
                    separatorBuilder: (context, position) {
                      return SizedBox(width: 15.w,);
                    },

                  ),
                ), SizedBox(height: 28.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 9.w),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nearby',
                        textAlign: TextAlign.center,
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
                SizedBox(height: 4.h,),
                SizedBox(
                  width: double.infinity.w,
                  height: 223.h,
                  child: ListView.separated(
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, position) {
                      return  Container(
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
                      );
                    },
                    separatorBuilder: (context, position) {
                      return SizedBox(width: 18.w,);
                    },

                  ),
                ),
                SizedBox(height: 24.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 9.w),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'All Cars',
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
                // SizedBox(
                //   width: double.infinity.w,
                //   height: 223.h,
                //   child: ListView.separated(
                //     itemCount: 20,
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (context, position) {
                //       return  Container(
                //         width: 185.w,
                //         height: 223.h,
                //         decoration: ShapeDecoration(
                //           gradient: LinearGradient(
                //             begin: Alignment(-5, 0.54),
                //             end: Alignment(0.54, -0.54),
                //             // begin: Alignment(-0.99, 1.00),
                //             // end: Alignment(0.09, -5),
                //             colors: [Color(0x1BFFFFFF), Color(0xFF000C1B)],
                //           ),
                //           shape: RoundedRectangleBorder(
                //             side: BorderSide(width: 1.w, color: Color(0xFF58606A)),
                //             borderRadius: BorderRadius.circular(10.r),
                //           ),
                //         ),
                //         child: Column(
                //           children: [
                //             SizedBox(height: 3.h,),
                //             Container(
                //               width: 177.w,
                //               height: 146.h,
                //               decoration: ShapeDecoration(
                //                 image: DecorationImage(
                //                   image: AssetImage("assets/g.png"),
                //                   fit: BoxFit.cover,
                //                 ),
                //                 shape: RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.only(
                //                     topLeft: Radius.circular(8.r),
                //                     topRight: Radius.circular(8.r),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             Padding(
                //               padding:  EdgeInsets.symmetric(horizontal: 9.w,vertical: 13.h),
                //               child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Text(
                //                     'Audi R8 Coupé',maxLines: 1,
                //                     textAlign: TextAlign.center,
                //                     style: TextStyle(
                //                       color: Color(0xFFF7F5F2),
                //                       fontSize: 16.sp,
                //                       fontFamily: 'sfprodisplay',
                //                       fontWeight: FontWeight.w500,
                //                     ),
                //                   ),
                //                   SizedBox(height: 6.h,),
                //                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //
                //                     children: [
                //
                //                       Row(mainAxisAlignment: MainAxisAlignment.start,
                //                         crossAxisAlignment: CrossAxisAlignment.start,
                //                         children: [
                //                           Container(
                //                             width: 14.w,
                //                             height: 14.h,
                //                             decoration: BoxDecoration(
                //                                 image: DecorationImage(image: AssetImage("assets/h.png"),fit: BoxFit.cover)
                //                             ),
                //                           ),
                //                           SizedBox(width: 5.w,),
                //                           Text(
                //                             'Kottakal',
                //                             textAlign: TextAlign.center,
                //                             style: TextStyle(
                //                               color: Color(0xFFF7F5F2),
                //                               fontSize: 13.sp,
                //                               fontFamily: 'sfprodisplay',
                //                               fontWeight: FontWeight.w300,
                //                               letterSpacing: 0.50.w,
                //                             ),
                //                           )
                //                         ],
                //                       ),
                //                       Text(
                //                         '\$ 8000 / day',
                //                         textAlign: TextAlign.center,
                //                         style: TextStyle(
                //                           color: Color(0xFFFFD66D),
                //                           fontSize: 13.sp,
                //                           fontFamily: 'sfprodisplay',
                //                           fontWeight: FontWeight.w500,
                //                           letterSpacing: 0.50.w,
                //                         ),
                //                       )
                //                     ],
                //                   )
                //                 ],
                //
                //               ),
                //             )
                //           ],
                //         ),
                //       );
                //     },
                //     separatorBuilder: (context, position) {
                //       return SizedBox(width: 18.w,);
                //       },
                //
                //   ),
                // ),
                SizedBox(
                  width: 389.w,
                  height: 223*6/2.h,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 18.0.w,
                    mainAxisSpacing: 20.0.h,
                    childAspectRatio: 185/223,
                    shrinkWrap: true,
                    children: List.generate(6, (index) {
                      return Container(
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
                      );
                    },),
                  ),
                ),
                SizedBox(height: 42.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// sfprodisplay