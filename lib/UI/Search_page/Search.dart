import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000B17),
      appBar: AppBar(bottom:PreferredSize(preferredSize: Size.fromHeight(80.h), child:  Column(
        children: [
          Container(
            width: 345.w,
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
            child: TextField(
              style: TextStyle(color: Colors.white,decorationThickness: 0.sp),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'What are you looking for..',
                  hintStyle: TextStyle(
                    color: Color(0xFF627387),
                    fontSize: 15.sp,
                    fontFamily: 'sfprodisplay',
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.50.w,
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                  )),
            ),
          ),
          SizedBox(height: 20.h,)
        ],
      ),) ,
        backgroundColor: Color(0xFF000B17),
        leading: GestureDetector(onTap: (){
          Navigator.of(context).pop();
        },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),centerTitle: true,
        title: Text("Normal car",style: TextStyle(color: Colors.white),),

      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 389.w,
                height: (236 * 15 / 2).h,
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 18.0.w,
                  mainAxisSpacing: 20.0.h,
                  childAspectRatio: 185 / 225,
                  shrinkWrap: true,
                  children: List.generate(
                    15,
                        (index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CarDetails()));
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
                              side: BorderSide(
                                  width: 1.w, color: Color(0xFF58606A)),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 3.h,
                              ),
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 9.w, vertical: 13.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Audi R8 Coupé',
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFFF7F5F2),
                                        fontSize: 16.sp,
                                        fontFamily: 'sfprodisplay',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 14.w,
                                              height: 14.h,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/h.png"),
                                                      fit: BoxFit.cover)),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
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
