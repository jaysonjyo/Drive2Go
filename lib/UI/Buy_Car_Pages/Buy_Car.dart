import 'dart:math';
import 'package:drive2goo/Repostory/ModelClass/Buyvechile/AllBuyVechileModelclass.dart';
import 'package:drive2goo/Repostory/ModelClass/Buyvechile/NearByBuyCarModelClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../Bloc/Buy/All_buyCar_Bloc/all_buycar_bloc.dart';
import '../../Bloc/Buy/Nearby_Buy_Car_Bloc/nearby_buy_bloc.dart';
import '../Home_Pages/Car_Details.dart';
import '../Search_page/Buy_Car_Search.dart';
import 'Buy_car_Details.dart';

class BuyCar extends StatefulWidget {
  const BuyCar({super.key});

  @override
  State<BuyCar> createState() => _BuyCarState();
}

class _BuyCarState extends State<BuyCar> {
  @override
  void initState() {
    BlocProvider.of<AllBuycarBloc>(context).add(FetchAllBuycarEvent());
    _getCurrentLocation();
    // TODO: implement initState
    super.initState();
  }
bool  locationEnabled=true;
  // current location and nearbylocation
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        locationEnabled=false;
      });

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Get the current position of the device.
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Convert the coordinates to a human-readable address.
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    BlocProvider.of<NearbyBuyBloc>(context).add(FetchNearbyBuycarevent(
        lat: position.latitude.toString(),
        long: position.longitude.toString()));
  }

  // current location and nearbylocation end
  // list of location  converting
  Future<List<Placemark>> _getVechileAddress(String lat, String long) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        double.parse(lat),
        double.parse(long),
      );

      return placemarks; // Return the list of placemarks instead of a single placemark
    } catch (e) {
      print(e);
      return []; // Return an empty list in case of an error
    }
  }

// just converting
  late List<NearByBuyCarModelClass> nearbybuycardata;
  late List<AllBuyVechileModelclass> allbuycardata;

  int latestitemcount = 0;
  int highitemcount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000B17),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 92.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => BuyCarSearch()));
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
                          side:
                              BorderSide(width: 1.w, color: Color(0xFF58606A)),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13.w,
                          ),
                          Icon(
                            Icons.search_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 13.w,
                          ),
                          Text(
                            'Search your dream car..',
                            textAlign: TextAlign.start,
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
                  SizedBox(
                    width: 23.w,
                  ),
                  Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFFCE50),
                      shape: OvalBorder(),
                    ),
                    child: Icon(
                      Icons.tune,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                  Container(
                    width: 45.w,
                    height: 45.h,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF7F5F2),
                      shape: OvalBorder(),
                    ),
                    child: Icon(
                      Icons.notifications_none_outlined,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
               BlocBuilder<NearbyBuyBloc, NearbyBuyState>(
                 builder: (context, state) {
                   if (state is NearbybuycarBlocLoading) {
                     return Center(
                       child: CircularProgressIndicator(),
                     );
                   }
                   if (state is NearbybuycarBlocError) {
                     return Center(
                       child: Text(
                         "Error",
                         style: TextStyle(color: Colors.white),
                       ),
                     );
                   }
                   if (state is NearbybuycarBlocLoaded) {
                     nearbybuycardata = BlocProvider.of<NearbyBuyBloc>(context)
                         .nearByBuyCarModelClass;

                     return locationEnabled==false||  nearbybuycardata.length==0?SizedBox():Column(
                       children: [

                         Padding(
                           padding: EdgeInsets.only(left: 9.w),
                           child: Row(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text(
                                 'Nearby',
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
                               )
                             ],
                           ),
                         ),
                         SizedBox(
                           height: 4.h,
                         ),
                         SizedBox(
                           width: double.infinity.w,
                           height: 223.h,
                           child: ListView.separated(
                             itemCount: nearbybuycardata.length,
                             scrollDirection: Axis.horizontal,
                             itemBuilder: (context, position) {
                               return FutureBuilder<List<Placemark>>(
                                   future: _getVechileAddress(
                                       nearbybuycardata[position]
                                           .location!
                                           .coordinates!
                                           .first
                                           .toString(),
                                       nearbybuycardata[position]
                                           .location!
                                           .coordinates!
                                           .last
                                           .toString()),
                                   builder: (BuildContext context,
                                       AsyncSnapshot<List<Placemark>> snapshot) {
                                     if (snapshot.connectionState ==
                                         ConnectionState.waiting) {
                                       return Center(
                                         child: CircularProgressIndicator(),
                                       );
                                     }
                                     if (snapshot.hasError) {
                                       return Center(
                                           child: Text("Error fetching location"));
                                     }
                                     if (snapshot.hasData) {
                                       String? place = snapshot.data![0].locality;
                                       return GestureDetector(
                                         onTap: () {
                                           Navigator.of(context)
                                               .push(MaterialPageRoute(
                                               builder: (_) => BuyCarDetails(
                                                 photo: nearbybuycardata[
                                                 position]
                                                     .photos!
                                                     .toList(),
                                                 brand: nearbybuycardata[
                                                 position]
                                                     .brand
                                                     .toString(),
                                                 rating: nearbybuycardata[
                                                 position]
                                                     .rating
                                                     .toString(),
                                                 fueltype: nearbybuycardata[
                                                 position]
                                                     .fuelType
                                                     .toString(),
                                                 gear: nearbybuycardata[
                                                 position]
                                                     .gearType
                                                     .toString(),
                                                 seat: nearbybuycardata[
                                                 position]
                                                     .noOfSeats
                                                     .toString(),
                                                 door: nearbybuycardata[
                                                 position]
                                                     .noOfDoors
                                                     .toString(),
                                                 ownerphoto:
                                                 nearbybuycardata[
                                                 position]
                                                     .ownerProfilePhoto
                                                     .toString(),
                                                 ownername: nearbybuycardata[
                                                 position]
                                                     .ownerName
                                                     .toString(),
                                                 ownerplace:
                                                 nearbybuycardata[
                                                 position]
                                                     .ownerPlace
                                                     .toString(),
                                                 id: nearbybuycardata[
                                                 position]
                                                     .id
                                                     .toString(),
                                                 price: nearbybuycardata[
                                                 position]
                                                     .rentPrice
                                                     .toString(),
                                                 description:
                                                 nearbybuycardata[
                                                 position]
                                                     .description
                                                     .toString(),
                                                 phonenumber:
                                                 nearbybuycardata[
                                                 position]
                                                     .ownerPhoneNumber
                                                     .toString(), locationEnabled: locationEnabled,
                                               )));
                                           print("hy" +
                                               nearbybuycardata[position]
                                                   .photos![0]);
                                         },
                                         child: Container(
                                           width: 185.w,
                                           height: 223.h,
                                           decoration: ShapeDecoration(
                                             gradient: LinearGradient(
                                               begin: Alignment(-5, 0.54),
                                               end: Alignment(0.54, -0.54),
                                               colors: [
                                                 Color(0x1BFFFFFF),
                                                 Color(0xFF000C1B)
                                               ],
                                             ),
                                             shape: RoundedRectangleBorder(
                                               side: BorderSide(
                                                   width: 1.w,
                                                   color: Color(0xFF58606A)),
                                               borderRadius:
                                               BorderRadius.circular(10.r),
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
                                                       image: NetworkImage(
                                                         nearbybuycardata[position]
                                                             .photos![0]
                                                             .toString(),
                                                       ),
                                                       fit: BoxFit.cover),
                                                   shape: RoundedRectangleBorder(
                                                     borderRadius: BorderRadius.only(
                                                       topLeft: Radius.circular(8.r),
                                                       topRight:
                                                       Radius.circular(8.r),
                                                     ),
                                                   ),
                                                 ),
                                               ),
                                               Padding(
                                                 padding: EdgeInsets.symmetric(
                                                   horizontal: 8.w,
                                                   //vertical: 13.h
                                                 ),
                                                 child: Column(
                                                   crossAxisAlignment:
                                                   CrossAxisAlignment.start,
                                                   children: [
                                                     SizedBox(
                                                       height: 10.h,
                                                     ),
                                                     Text(
                                                       nearbybuycardata[position]
                                                           .brand
                                                           .toString(),
                                                       maxLines: 1,
                                                       textAlign: TextAlign.start,
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
                                                       MainAxisAlignment
                                                           .spaceBetween,
                                                       children: [
                                                         Row(
                                                           mainAxisAlignment:
                                                           MainAxisAlignment
                                                               .start,
                                                           crossAxisAlignment:
                                                           CrossAxisAlignment
                                                               .start,
                                                           children: [
                                                             Container(
                                                               width: 14.w,
                                                               height: 14.h,
                                                               decoration: BoxDecoration(
                                                                   image: DecorationImage(
                                                                       image: AssetImage(
                                                                           "assets/h.png"),
                                                                       fit: BoxFit
                                                                           .cover)),
                                                             ),
                                                             SizedBox(
                                                               width: 5.w,
                                                             ),
                                                             Container(
                                                               width: 65.w,
                                                               child: Text(
                                                                 place.toString(),
                                                                 overflow:
                                                                 TextOverflow
                                                                     .ellipsis,
                                                                 maxLines: 1,
                                                                 textAlign:
                                                                 TextAlign.start,
                                                                 style: TextStyle(
                                                                   color: Color(
                                                                       0xFFF7F5F2),
                                                                   fontSize: 13.sp,
                                                                   fontFamily:
                                                                   'sfprodisplay',
                                                                   fontWeight:
                                                                   FontWeight
                                                                       .w300,
                                                                   letterSpacing:
                                                                   0.50.w,
                                                                 ),
                                                               ),
                                                             )
                                                           ],
                                                         ),
                                                         Container(
                                                           child: Text(
                                                             "₹ ${nearbybuycardata[position].rentPrice.toString()}",
                                                             textAlign:
                                                             TextAlign.center,
                                                             style: TextStyle(
                                                               color:
                                                               Color(0xFFFFD66D),
                                                               fontSize: 13.sp,
                                                               fontFamily:
                                                               'sfprodisplay',
                                                               fontWeight:
                                                               FontWeight.w500,
                                                               // letterSpacing: 0.50.w,
                                                             ),
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
                                     } else {
                                       return SizedBox();
                                     }
                                   });
                             },
                             separatorBuilder: (context, position) {
                               return SizedBox(
                                 width: 18.w,
                               );
                             },
                           ),
                         ),
                         SizedBox(
                           height: 30.h,
                         ),
                       ],
                     );
                   } else {
                     return SizedBox();
                   }
                 },
               ),


              BlocBuilder<AllBuycarBloc, AllBuycarState>(
                builder: (context, state) {
                  if (state is AllBuycarBlocLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is AllBuycarBlocError) {
                    return Center(
                      child: Text("Error"),
                    );
                  }
                  if (state is AllBuycarBlocLoaded) {
                    allbuycardata = BlocProvider.of<AllBuycarBloc>(context)
                        .allBuyVechileModelclass;
                    //fittering  position . all car length ne latest ayitulla car nte mathram length kittan
                    for (int i = 0; i < allbuycardata.length; i++) {
                      if (allbuycardata[i].latestModel == true) {
                        latestitemcount = latestitemcount + 1;
                      }
                      if (allbuycardata[i].highMilage == true) {
                        highitemcount = highitemcount + 1;
                      }
                    }
                    return allbuycardata.length==0?SizedBox(): Column(
                      children: [
                        latestitemcount == 0
                            ? SizedBox()
                            : Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 9.w),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                SizedBox(
                                    width: double.infinity.w,
                                    height: 223.h,
                                    child: ListView.separated(
                                      itemCount: allbuycardata.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, position) {
                                        if (allbuycardata[position].latestModel ==
                                            true) {
                                          return FutureBuilder(
                                            future: _getVechileAddress(
                                                allbuycardata[position]
                                                    .location!
                                                    .coordinates!
                                                    .first
                                                    .toString(),
                                                allbuycardata[position]
                                                    .location!
                                                    .coordinates!
                                                    .last
                                                    .toString()),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<dynamic> snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              }
                                              if (snapshot.hasError) {
                                                return Center(
                                                  child: Text(
                                                      "Error fetching location"),
                                                );
                                              }
                                              if (snapshot.hasData) {
                                                String? place =
                                                    snapshot.data![0].locality;
                                                return GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder:
                                                                (_) =>
                                                                    BuyCarDetails(
                                                                      photo: allbuycardata[
                                                                              position]
                                                                          .photos!
                                                                          .toList(),
                                                                      brand: allbuycardata[
                                                                              position]
                                                                          .brand
                                                                          .toString(),
                                                                      rating: allbuycardata[
                                                                              position]
                                                                          .rating
                                                                          .toString(),
                                                                      fueltype: allbuycardata[
                                                                              position]
                                                                          .fuelType
                                                                          .toString(),
                                                                      gear: allbuycardata[
                                                                              position]
                                                                          .gearType
                                                                          .toString(),
                                                                      seat: allbuycardata[
                                                                              position]
                                                                          .noOfSeats
                                                                          .toString(),
                                                                      door: allbuycardata[
                                                                              position]
                                                                          .noOfDoors
                                                                          .toString(),
                                                                      ownerphoto: allbuycardata[
                                                                              position]
                                                                          .ownerProfilePhoto
                                                                          .toString(),
                                                                      ownername: allbuycardata[
                                                                              position]
                                                                          .ownerName
                                                                          .toString(),
                                                                      ownerplace: allbuycardata[
                                                                              position]
                                                                          .ownerPlace
                                                                          .toString(),
                                                                      id: allbuycardata[
                                                                              position]
                                                                          .id
                                                                          .toString(),
                                                                      price: allbuycardata[
                                                                              position]
                                                                          .rentPrice
                                                                          .toString(),
                                                                      description: allbuycardata[
                                                                              position]
                                                                          .description
                                                                          .toString(),
                                                                      phonenumber: allbuycardata[
                                                                              position]
                                                                          .ownerPhoneNumber
                                                                          .toString(), locationEnabled: locationEnabled,
                                                                    )));
                                                  },
                                                  child: Container(
                                                    width: 185.w,
                                                    height: 223.h,
                                                    decoration: ShapeDecoration(
                                                      gradient: LinearGradient(
                                                        begin: Alignment(-5, 0.54),
                                                        end: Alignment(0.54, -0.54),
                                                        colors: [
                                                          Color(0x1BFFFFFF),
                                                          Color(0xFF000C1B)
                                                        ],
                                                      ),
                                                      shape: RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            width: 1.w,
                                                            color:
                                                                Color(0xFF58606A)),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10.r),
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
                                                          decoration:
                                                              ShapeDecoration(
                                                            image: DecorationImage(
                                                              image: NetworkImage(
                                                                  allbuycardata[
                                                                          position]
                                                                      .photos![0]
                                                                      .toString()),
                                                              fit: BoxFit.cover,
                                                            ),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.only(
                                                                topLeft:
                                                                    Radius.circular(
                                                                        8.r),
                                                                topRight:
                                                                    Radius.circular(
                                                                        8.r),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                  horizontal: 9.w,
                                                                  vertical: 13.h),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                allbuycardata[
                                                                        position]
                                                                    .brand
                                                                    .toString(),
                                                                maxLines: 1,
                                                                textAlign: TextAlign
                                                                    .start,
                                                                style: TextStyle(
                                                                  color: Color(
                                                                      0xFFF7F5F2),
                                                                  fontSize: 16.sp,
                                                                  fontFamily:
                                                                      'sfprodisplay',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 6.h,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        width: 14.w,
                                                                        height:
                                                                            14.h,
                                                                        decoration: BoxDecoration(
                                                                            image: DecorationImage(
                                                                                image:
                                                                                    AssetImage("assets/h.png"),
                                                                                fit: BoxFit.cover)),
                                                                      ),
                                                                      SizedBox(
                                                                        width: 5.w,
                                                                      ),
                                                                      Container(
                                                                        width: 65.w,
                                                                        child: Text(
                                                                          overflow:
                                                                              TextOverflow
                                                                                  .ellipsis,
                                                                          place
                                                                              .toString(),
                                                                          textAlign:
                                                                              TextAlign
                                                                                  .start,
                                                                          style:
                                                                              TextStyle(
                                                                            color: Color(
                                                                                0xFFF7F5F2),
                                                                            fontSize:
                                                                                13.sp,
                                                                            fontFamily:
                                                                                'sfprodisplay',
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                            letterSpacing:
                                                                                0.50.w,
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  Container(
                                                                    child: Text(
                                                                      "₹ ${allbuycardata[position].rentPrice.toString()}",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xFFFFD66D),
                                                                        fontSize:
                                                                            13.sp,
                                                                        fontFamily:
                                                                            'sfprodisplay',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        letterSpacing:
                                                                            0.50.w,
                                                                      ),
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
                                              } else {
                                                return SizedBox();
                                              }
                                            },
                                          );
                                        } else {
                                          return SizedBox();
                                        }
                                      },
                                      separatorBuilder: (context, position) {
                                        if (allbuycardata[position].latestModel ==
                                            true) {
                                          return SizedBox(
                                            width: 18.w,
                                          );
                                        } else {
                                          return SizedBox();
                                        }
                                      },
                                    )),
                                SizedBox(
                                  height: 30.h,
                                ),
                              ],
                            ),

                        highitemcount == 0
                            ? SizedBox()
                            : Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 9.w),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                SizedBox(
                                    width: double.infinity.w,
                                    height: 223.h,
                                    child: ListView.separated(
                                      itemCount: allbuycardata.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, position) {
                                        if (allbuycardata[position].highMilage ==
                                            true) {
                                          return FutureBuilder(
                                            future: _getVechileAddress(
                                                allbuycardata[position]
                                                    .location!
                                                    .coordinates!
                                                    .first
                                                    .toString(),
                                                allbuycardata[position]
                                                    .location!
                                                    .coordinates!
                                                    .last
                                                    .toString()),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<dynamic> snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return Center(
                                                  child:
                                                  CircularProgressIndicator(),
                                                );
                                              }
                                              if (snapshot.hasError) {
                                                return Center(
                                                    child: Text(
                                                        "Error fetching location"));
                                              }
                                              if (snapshot.hasData) {
                                                String? place =
                                                    snapshot.data![0].locality;
                                                return GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder:
                                                                (_) =>
                                                                BuyCarDetails(
                                                                  photo: allbuycardata[
                                                                  position]
                                                                      .photos!
                                                                      .toList(),
                                                                  brand: allbuycardata[
                                                                  position]
                                                                      .brand
                                                                      .toString(),
                                                                  rating: allbuycardata[
                                                                  position]
                                                                      .rating
                                                                      .toString(),
                                                                  fueltype: allbuycardata[
                                                                  position]
                                                                      .fuelType
                                                                      .toString(),
                                                                  gear: allbuycardata[
                                                                  position]
                                                                      .gearType
                                                                      .toString(),
                                                                  seat: allbuycardata[
                                                                  position]
                                                                      .noOfSeats
                                                                      .toString(),
                                                                  door: allbuycardata[
                                                                  position]
                                                                      .noOfDoors
                                                                      .toString(),
                                                                  ownerphoto: allbuycardata[
                                                                  position]
                                                                      .ownerProfilePhoto
                                                                      .toString(),
                                                                  ownername: allbuycardata[
                                                                  position]
                                                                      .ownerName
                                                                      .toString(),
                                                                  ownerplace: allbuycardata[
                                                                  position]
                                                                      .ownerPlace
                                                                      .toString(),
                                                                  id: allbuycardata[
                                                                  position]
                                                                      .id
                                                                      .toString(),
                                                                  price: allbuycardata[
                                                                  position]
                                                                      .rentPrice
                                                                      .toString(),
                                                                  description: allbuycardata[
                                                                  position]
                                                                      .description
                                                                      .toString(),
                                                                  phonenumber: allbuycardata[
                                                                  position]
                                                                      .ownerPhoneNumber
                                                                      .toString(), locationEnabled: locationEnabled,
                                                                )));
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
                                                        colors: [
                                                          Color(0x1BFFFFFF),
                                                          Color(0xFF000C1B)
                                                        ],
                                                      ),
                                                      shape: RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            width: 1.w,
                                                            color:
                                                            Color(0xFF58606A)),
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
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
                                                          decoration:
                                                          ShapeDecoration(
                                                            image: DecorationImage(
                                                              image: NetworkImage(
                                                                  allbuycardata[
                                                                  position]
                                                                      .photos![0]
                                                                      .toString()),
                                                              fit: BoxFit.cover,
                                                            ),
                                                            shape:
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.only(
                                                                topLeft:
                                                                Radius.circular(
                                                                    8.r),
                                                                topRight:
                                                                Radius.circular(
                                                                    8.r),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 9.w,
                                                              vertical: 13.h),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                allbuycardata[
                                                                position]
                                                                    .brand
                                                                    .toString(),
                                                                maxLines: 1,
                                                                textAlign:
                                                                TextAlign.start,
                                                                style: TextStyle(
                                                                  color: Color(
                                                                      0xFFF7F5F2),
                                                                  fontSize: 16.sp,
                                                                  fontFamily:
                                                                  'sfprodisplay',
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 6.h,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      Container(
                                                                        width: 14.w,
                                                                        height:
                                                                        14.h,
                                                                        decoration: BoxDecoration(
                                                                            image: DecorationImage(
                                                                                image:
                                                                                AssetImage("assets/h.png"),
                                                                                fit: BoxFit.cover)),
                                                                      ),
                                                                      SizedBox(
                                                                        width: 5.w,
                                                                      ),
                                                                      Container(
                                                                        width: 70.w,
                                                                        child: Text(
                                                                          place
                                                                              .toString(),
                                                                          textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                          overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                          style:
                                                                          TextStyle(
                                                                            color: Color(
                                                                                0xFFF7F5F2),
                                                                            fontSize:
                                                                            13.sp,
                                                                            fontFamily:
                                                                            'sfprodisplay',
                                                                            fontWeight:
                                                                            FontWeight.w300,
                                                                            letterSpacing:
                                                                            0.50.w,
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  Container(
                                                                    child: Text(
                                                                      "₹ ${allbuycardata[position].rentPrice.toString()}",
                                                                      textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                      style:
                                                                      TextStyle(
                                                                        color: Color(
                                                                            0xFFFFD66D),
                                                                        fontSize:
                                                                        13.sp,
                                                                        fontFamily:
                                                                        'sfprodisplay',
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                        letterSpacing:
                                                                        0.50.w,
                                                                      ),
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
                                              } else {
                                                return SizedBox();
                                              }
                                            },
                                          );
                                        } else {
                                          return SizedBox();
                                        }
                                      },
                                      separatorBuilder: (context, position) {
                                        if (allbuycardata[position].highMilage ==
                                            true) {
                                          return SizedBox(
                                            width: 18.w,
                                          );
                                        } else {
                                          return SizedBox();
                                        }
                                      },
                                    )),
                                SizedBox(
                                  height: 30.h,
                                ),
                              ],
                            ),

                        Padding(
                          padding: EdgeInsets.only(left: 9.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        SizedBox(
                          height: 9.h,
                        ),
                        SizedBox(
                          width: 389.w,
                          height: max(0, ((allbuycardata.length / 2).ceil() * (225.h + 20.0.h)) - 20.0.h),
                          // height: (256 * allbuycardata.length / 2).h,
                          child: GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 18.0.w,
                            mainAxisSpacing: 20.0.h,
                            childAspectRatio: 185 / 225,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            children: List.generate(
                              allbuycardata.length,
                              (index) {
                                return FutureBuilder(
                                    future: _getVechileAddress(
                                        allbuycardata[index]
                                            .location!
                                            .coordinates!
                                            .first
                                            .toString(),
                                        allbuycardata[index]
                                            .location!
                                            .coordinates!
                                            .last
                                            .toString()),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<dynamic> snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      if (snapshot.hasError) {
                                        return Center(
                                          child:
                                              Text("Error fetching location"),
                                        );
                                      }
                                      if (snapshot.hasData) {
                                        String? place =
                                            snapshot.data![0].locality;
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        BuyCarDetails(
                                                          photo: allbuycardata[
                                                                  index]
                                                              .photos!
                                                              .toList(),
                                                          brand: allbuycardata[
                                                                  index]
                                                              .brand
                                                              .toString(),
                                                          rating: allbuycardata[
                                                                  index]
                                                              .rating
                                                              .toString(),
                                                          fueltype:
                                                              allbuycardata[
                                                                      index]
                                                                  .fuelType
                                                                  .toString(),
                                                          gear: allbuycardata[
                                                                  index]
                                                              .gearType
                                                              .toString(),
                                                          seat: allbuycardata[
                                                                  index]
                                                              .noOfSeats
                                                              .toString(),
                                                          door: allbuycardata[
                                                                  index]
                                                              .noOfDoors
                                                              .toString(),
                                                          ownerphoto: allbuycardata[
                                                                  index]
                                                              .ownerProfilePhoto
                                                              .toString(),
                                                          ownername:
                                                              allbuycardata[
                                                                      index]
                                                                  .ownerName
                                                                  .toString(),
                                                          ownerplace:
                                                              allbuycardata[
                                                                      index]
                                                                  .ownerPlace
                                                                  .toString(),
                                                          id: allbuycardata[
                                                                  index]
                                                              .id
                                                              .toString(),
                                                          price: allbuycardata[
                                                                  index]
                                                              .rentPrice
                                                              .toString(),
                                                          description:
                                                              allbuycardata[
                                                                      index]
                                                                  .description
                                                                  .toString(),
                                                          phonenumber:
                                                              allbuycardata[
                                                                      index]
                                                                  .ownerPhoneNumber
                                                                  .toString(), locationEnabled: locationEnabled,
                                                        )));
                                          },
                                          child: Container(
                                            width: 185.w,
                                            height: 223.h,
                                            decoration: ShapeDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment(-5, 0.54),
                                                end: Alignment(0.54, -0.54),
                                                colors: [
                                                  Color(0x1BFFFFFF),
                                                  Color(0xFF000C1B)
                                                ],
                                              ),
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 1.w,
                                                    color: Color(0xFF58606A)),
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
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
                                                      image: NetworkImage(
                                                          allbuycardata[index]
                                                              .photos![0]),
                                                      fit: BoxFit.cover,
                                                    ),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                8.r),
                                                        topRight:
                                                            Radius.circular(
                                                                8.r),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 9.w,
                                                      vertical: 13.h),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        allbuycardata[index]
                                                            .brand
                                                            .toString(),
                                                        maxLines: 1,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFFF7F5F2),
                                                          fontSize: 16.sp,
                                                          fontFamily:
                                                              'sfprodisplay',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 6.h,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 14.w,
                                                                height: 14.h,
                                                                decoration: BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            "assets/h.png"),
                                                                        fit: BoxFit
                                                                            .cover)),
                                                              ),
                                                              SizedBox(
                                                                width: 5.w,
                                                              ),
                                                              Container(
                                                                width: 70.w,
                                                                child: Text(
                                                                  place
                                                                      .toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFFF7F5F2),
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontFamily:
                                                                        'sfprodisplay',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    letterSpacing:
                                                                        0.50.w,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              "₹ ${allbuycardata[index].rentPrice.toString()}",
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFFFFD66D),
                                                                fontSize: 13.sp,
                                                                fontFamily:
                                                                    'sfprodisplay',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                letterSpacing:
                                                                    0.50.w,
                                                              ),
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
                                      } else {
                                        return SizedBox();
                                      }
                                    });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 110.h,
                        )
                      ],
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
