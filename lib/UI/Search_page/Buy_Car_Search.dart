import 'dart:math';

import 'package:drive2goo/Bloc/Buy_vechile_search/buysearch_bloc.dart';
import 'package:drive2goo/Repostory/ModelClass/Buyvechile/BuyvehileSearchModelclass.dart';
import 'package:drive2goo/UI/Buy_Car_Pages/Buy_car_Details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../Home_Pages/Car_Details.dart';

class BuyCarSearch extends StatefulWidget {
  const BuyCarSearch({super.key});

  @override
  State<BuyCarSearch> createState() => _BuyCarSearchState();
}

class _BuyCarSearchState extends State<BuyCarSearch> {
  bool locationEnabled = true;

  // current location
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

  }

  // current location end
  TextEditingController buysearch = TextEditingController();

  @override
  void initState() {
    _getCurrentLocation();
    BlocProvider.of<BuysearchBloc>(context)
        .add(FetchBuysearchEvent(brandsearch: buysearch.text));
    // TODO: implement initState
    super.initState();
  }


  late List<BuyvehileSearchModelclass> buysearchdata;

  //list of plcae convert
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

  //
  @override
  void dispose() {
    buysearchdata.clear();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000B17),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Buy Car Search",
          style: TextStyle(fontSize: 25.sp,color: Colors.white),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: Column(
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
                  controller: buysearch,
                  style:
                      TextStyle(color: Colors.white, decorationThickness: 0.sp),
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
                  onChanged: (value) {
                    setState(() {
                      BlocProvider.of<BuysearchBloc>(context).add(
                          FetchBuysearchEvent(brandsearch: buysearch.text));
                    });
                  },
                  onSubmitted: (value) {
                    setState(() {
                      BlocProvider.of<BuysearchBloc>(context).add(
                          FetchBuysearchEvent(brandsearch: buysearch.text));
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
        backgroundColor: Color(0xFF000B17),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: BlocBuilder<BuysearchBloc, BuysearchState>(
            builder: (context, state) {
              if (state is BuysearchBlocLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is BuysearchBlocError) {
                return Center(
                  child: Text("Error"),
                );
              }
              if (state is BuysearchBlocLoaded) {
                buysearchdata = BlocProvider.of<BuysearchBloc>(context)
                    .buyvehileSearchModelclass;

                return Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 389.w,
                      //height: (2*buysearchdata.length)+((2-1)*20).h,
                      // height: (236 * 15 / 2).h,
                      //   height: max(0,((buysearchdata.length / crossAxisCount).ceil() * (itemHeight + mainAxisSpacing)) - mainAxisSpacing),
                      height: max(0, ((buysearchdata.length / 2).ceil() * (225.h + 20.0.h)) - 20.0.h),
                      child: Expanded(
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 18.0.w,
                          mainAxisSpacing: 20.0.h,
                          childAspectRatio: 185 / 225,
                          shrinkWrap: true,
                          children: List.generate(
                            buysearchdata.length,
                            (index) {
                              return FutureBuilder<List<Placemark>>(
                                future: _getVechileAddress(
                                    buysearchdata[index]
                                        .location!
                                        .coordinates!
                                        .first
                                        .toString(),
                                    buysearchdata[index]
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
                                      child: Text("Error"),
                                    );
                                  }
                                  if (snapshot.hasData) {
                                    String? place = snapshot.data![0].locality;

                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (_) => BuyCarDetails(
                                                      photo: buysearchdata[index]
                                                          .photos!
                                                          .toList(),
                                                      brand: buysearchdata[index]
                                                          .brand
                                                          .toString(),
                                                      rating: buysearchdata[index]
                                                          .rating
                                                          .toString(),
                                                      fueltype:
                                                          buysearchdata[index]
                                                              .fuelType
                                                              .toString(),
                                                      gear: buysearchdata[index]
                                                          .gearType
                                                          .toString(),
                                                      seat: buysearchdata[index]
                                                          .noOfSeats
                                                          .toString(),
                                                      door: buysearchdata[index]
                                                          .noOfDoors
                                                          .toString(),
                                                      ownerphoto:
                                                          buysearchdata[index]
                                                              .ownerProfilePhoto
                                                              .toString(),
                                                      ownername:
                                                          buysearchdata[index]
                                                              .ownerName
                                                              .toString(),
                                                      ownerplace:
                                                          buysearchdata[index]
                                                              .ownerPlace
                                                              .toString(),
                                                      id: buysearchdata[index]
                                                          .id
                                                          .toString(),
                                                      price: buysearchdata[index]
                                                          .rentPrice
                                                          .toString(),
                                                      description:
                                                          buysearchdata[index]
                                                              .description
                                                              .toString(),
                                                      phonenumber:
                                                          buysearchdata[index]
                                                              .ownerPhoneNumber
                                                              .toString(),
                                                      locationEnabled:
                                                          locationEnabled,
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
                                                      buysearchdata[index]
                                                          .photos![0]),
                                                  fit: BoxFit.cover,
                                                ),
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
                                                  horizontal: 9.w,
                                                  vertical: 13.h),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    buysearchdata[index]
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
                                                            width: 70.w,
                                                            child: Text(
                                                              place.toString(),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
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
                                                      Text(
                                                        "\$ ${buysearchdata[index].rentPrice.toString()}",
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFFFFD66D),
                                                          fontSize: 13.sp,
                                                          fontFamily:
                                                              'sfprodisplay',
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                  } else {
                                    return SizedBox();
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
// sfprodisplay
