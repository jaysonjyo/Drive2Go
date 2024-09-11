
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../Bloc/RentOrder_Bloc/rent_car_order_bloc.dart';
import '../../Repostory/ModelClass/Rentvechile/RentOrderMOdelClass.dart';

class MyCar extends StatefulWidget {
  const MyCar({super.key});

  @override
  State<MyCar> createState() => _MyCarState();
}

class _MyCarState extends State<MyCar> {
  @override
  void initState() {
    BlocProvider.of<RentCarOrderBloc>(context).add(FetchRentcarOrderEvent());
    // TODO: implement initState
    super.initState();
  }
  late List<RentCarOrderModelClass> rentcarorderdata;
//date format iso convert to dd-MM-yyy
  String dateConvert(String iso) {
    String isoString = iso;

    // Convert ISO string to DateTime
    DateTime dateTime = DateTime.parse(isoString);

    // Format DateTime to a specific format
    String formattedDate = DateFormat('MM/dd/yyyy').format(dateTime);

    print(formattedDate);
    return formattedDate;// Output: 2024-09-03 – 14:30
  }

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
                            child: BlocBuilder<RentCarOrderBloc, RentCarOrderState>(
              builder: (context, state) {
    if(state is RentCarOrderBlocLoading){
    return Center(child: CircularProgressIndicator(),);
    }if(state is RentCarOrderBlocError){
    return Center(child: Text("Error"),);
    }
    if(state is RentCarOrderBlocLoaded) {
      rentcarorderdata = BlocProvider
          .of<RentCarOrderBloc>(context)
          .rentCarOrderModelClass;
      // print(rentcarorderdata);
      return ListView.separated(
                        itemCount: rentcarorderdata.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, position) {

                          String pickedate=dateConvert(rentcarorderdata[position].pickupDate.toString(),);
                          String returndate=dateConvert(rentcarorderdata[position].returnDate.toString());
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
                                        image: NetworkImage(rentcarorderdata[position].vehicle!.photos![0]),
                                        fit: BoxFit.cover,
                                      ),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 10.w,),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 12.h,),
                                        Text(
                                          rentcarorderdata[position].vehicle!.brand.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFFF7F5F2),
                                            fontSize: 16.sp,
                                            fontFamily: 'sfprodisplay',
                                            fontWeight: FontWeight.w600,

                                          ),
                                        ),
                                        SizedBox(height: 3.h,),
                                        Text(

                                          rentcarorderdata[position].vehicle!.ownerName.toString()
                                          ,
                                          style: TextStyle(
                                            color: Color(0xFFF7F5F2),
                                            fontSize: 15.sp,
                                            fontFamily: 'sfprodisplay',
                                            fontWeight: FontWeight.w400,

                                          ),
                                        ),
                                        Text(
                                       pickedate,

                                            style: TextStyle(
                                            color: Color(0xFFF7F5F2),
                                            fontSize: 14.sp,
                                            fontFamily: 'sfprodisplay',
                                            fontWeight: FontWeight.w400,

                                          ),
                                        ),SizedBox(height: 3.h,),
                                        Text(

                                          returndate
                                          ,
                                          style: TextStyle(
                                            color: Color(0xFFF7F5F2),
                                            fontSize: 14.sp,
                                            fontFamily: 'sfprodisplay',
                                            fontWeight: FontWeight.w400,

                                          ),
                                        ), SizedBox(height: 4.h,),
                                        Row(
                                          children: [
                                            Container(width: 140.w,
                                              child: Text(
                                                "${rentcarorderdata[position].vehicle!.mileage.toString()} km mileage",
                                                style: TextStyle(
                                                  color: Color(0xFFF7F5F2),
                                                  fontSize: 14.sp,
                                                  fontFamily: 'sfprodisplay',
                                                  fontWeight: FontWeight.w400,

                                                ),
                                              ),
                                            ),
                                            // SizedBox(width: 97.w
                                            //   ,),
                                            Text('\$ ${rentcarorderdata[position].vehicle!.rentPrice.toString() } / day',
                                              style: TextStyle(
                                                color: Color(0xFFFFD66D),
                                                fontSize: 13.sp,
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

                      );
    }else {
      return SizedBox();
    }
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
                      ])),
              SizedBox(height: 120.h,)
                    ])
        ));
  }
}
