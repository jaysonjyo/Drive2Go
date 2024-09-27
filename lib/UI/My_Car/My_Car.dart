import 'package:drive2goo/Repostory/ModelClass/Buyvechile/Buy_OrderShow_Modelclass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../Bloc/Buy/Buycar_order/buyorder_bloc.dart';
import '../../Bloc/Rent/RentOrder_Bloc/rent_car_order_bloc.dart';
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
    BlocProvider.of<BuyorderBloc>(context).add(FetchBuyorderEvent());
    // TODO: implement initState
    super.initState();
  }
  late List<RentCarOrderModelClass> rentcarorderdata;
  late List<BuyOrderShowModelclass> buyorderdata;
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
                              borderRadius: BorderRadius.circular(30.r)),
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
                                  ),SizedBox(width: 15.w,),
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 5.h,),
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
                                      ),  SizedBox(height: 4.h,),
                                      Row(children: [  Text(
                                        "Status : ",
                                        style: TextStyle(
                                          color: Color(0xFFF7F5F2),
                                          fontSize: 14.sp,
                                          fontFamily: 'sfprodisplay',
                                          fontWeight: FontWeight.w400,

                                        ),
                                      ),  Text(
                                        rentcarorderdata[position].status.toString(),
                                        style: TextStyle(
                                          color:Color(0xFFFFD66D),
                                          fontSize: 14.sp,
                                          fontFamily: 'sfprodisplay',
                                          fontWeight: FontWeight.w400,

                                        ),
                                      ),
                                      ],),
                                      SizedBox(height: 2.h,),
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
                                          Text('₹ ${rentcarorderdata[position].vehicle!.rentPrice.toString() } / day',
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
                              child: BlocBuilder<BuyorderBloc, BuyorderState>(
  builder: (context, state) {
    if(state is BuyorderBlocLoading){
      return Center(child: CircularProgressIndicator(),);
    }
    if(state is BuyorderBlocError){
      return Center(child: Text("Error"),);
    }
    if(state is BuyorderBlocLoaded){
      buyorderdata =BlocProvider.of<BuyorderBloc>(context).buyOrderShowModelclass;
    return ListView.separated(
                                itemCount: buyorderdata.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, position) {
                                  String pickedate=dateConvert(buyorderdata[position].purchaseDate.toString(),);
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
                                                image: NetworkImage(buyorderdata[position].vehicle!.photos![0]),
                                                fit: BoxFit.cover,
                                              ),
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
                                            ),
                                          ),
                                          SizedBox(width: 15.w,),
                                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 16.h,),
                                              Text(
                                                buyorderdata[position].vehicle!.brand.toString(),
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color: Color(0xFFF7F5F2),
                                                  fontSize: 16.sp,
                                                  fontFamily: 'sfprodisplay',
                                                  fontWeight: FontWeight.w600,

                                                ),
                                              ),
                                              SizedBox(height: 3.h,),
                                              Text(
                                                buyorderdata[position].vehicle!.ownerName.toString(),
                                                style: TextStyle(
                                                  color: Color(0xFFF7F5F2),
                                                  fontSize: 15.sp,
                                                  fontFamily: 'sfprodisplay',
                                                  fontWeight: FontWeight.w400,

                                                ),
                                              ),
                                              Text(
                                                pickedate.toString(),
                                                style: TextStyle(
                                                  color: Color(0xFFF7F5F2),
                                                  fontSize: 14.sp,
                                                  fontFamily: 'sfprodisplay',
                                                  fontWeight: FontWeight.w400,

                                                ),
                                              ), SizedBox(height: 4.h,),
                                              Row(children: [  Text(
                                                "Status : ",
                                                style: TextStyle(
                                                  color: Color(0xFFF7F5F2),
                                                  fontSize: 14.sp,
                                                  fontFamily: 'sfprodisplay',
                                                  fontWeight: FontWeight.w400,

                                                ),
                                              ),  Text(
                                               buyorderdata[position].deliveryStatus.toString(),
                                                style: TextStyle(
                                                  color:Color(0xFFFFD66D),
                                                  fontSize: 14.sp,
                                                  fontFamily: 'sfprodisplay',
                                                  fontWeight: FontWeight.w400,

                                                ),
                                              ),
                                              ],),
                                              SizedBox(height: 4.h,),
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 140.w,
                                                    child: Text(
                                                      "${buyorderdata[position].vehicle!.mileage.toString()} km mileage",

                                                      style: TextStyle(
                                                        color: Color(0xFFF7F5F2),
                                                        fontSize: 14.sp,
                                                        fontFamily: 'sfprodisplay',
                                                        fontWeight: FontWeight.w400,

                                                      ),
                                                    ),
                                                  ),

                                                  Text(
                                                    "₹ ${buyorderdata[position].vehicle!.rentPrice.toString()}"
                                                    //'\$5000 / day'
                                                    ,
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
                                          )
                                        ],
                                      ),

                                    ),
                                  );
                                },
                                separatorBuilder: (context, position) {
                                  return SizedBox(height: 10.h,);
                                },

                              );}else
                                {
                                  return SizedBox();
                                }
  },
),
                            ),
                      ])),
              SizedBox(height: 120.h,)
                    ])
        ));
  }
}
