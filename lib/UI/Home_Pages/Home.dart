import 'package:drive2goo/Bloc/Allcar_Bloc/allcar_bloc.dart';
import 'package:drive2goo/Bloc/Nearby_Bloc/nearby_car_bloc.dart';
import 'package:drive2goo/Repostory/ModelClass/Rentvechile/AllcarModel.dart';
import 'package:drive2goo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Repostory/ModelClass/Rentvechile/NearbyCarModelClass.dart';
import '../Search_page/Search.dart';
import 'Car_Details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // current location start
  String _location = 'Unknown';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    BlocProvider.of<AllcarBloc>(context).add(FetchAllcarEvent());
  }

  // current location and nearbylocation
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
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
    BlocProvider.of<NearbyCarBloc>(context).add(FetchNearbycar(
        lat: position.latitude.toString(),
        long: position.longitude.toString()));

    Placemark place = placemarks[0];

    setState(() {
      _location =
          '${place.locality}, ${place.administrativeArea}';
    });
  }

  // current location and nearbylocation end

  late List<NearbyCarModelClass> nearbycardata;

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
  late List<AllcarModelClass> allcardata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000B17),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 37.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9.w),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 179.w,
                            height: 68.h,
                            // 55.h,
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
                                SizedBox(
                                  height: 7.h,
                                ),
                                Text(
                                  " $_location",
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
                            child: Icon(
                              Icons.notifications_none_outlined,
                              size: 24.sp,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => Search()));
                            },
                            child: Container(
                                width: 292.w,
                                height: 48.h,
                                decoration: ShapeDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment(-0.19, 6),
                                    end: Alignment(0.09, -1),
                                    colors: [
                                      Color(0x1BFFFFFF),
                                      Color(0xFF000C1B)
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.w, color: Color(0xFF58606A)),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 13.w),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.search_rounded,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 13.w,
                                      ),
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
                                )),
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
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 9.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                SizedBox(
                  height: 4.h,
                ),
                SizedBox(
                  width: double.infinity.w,
                  height: 223.h,
                  child: BlocBuilder<NearbyCarBloc, NearbyCarState>(
                    builder: (context, state) {
                      if (state is NearbyCarBlocLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is NearbyCarBlocError) {
                        return Center(
                          child: Text(
                            "Error",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }
                      if (state is NearbyCarBlocLoaded) {
                        nearbycardata = BlocProvider.of<NearbyCarBloc>(context)
                            .nearbyCarModelClass;
                        return ListView.separated(
                          itemCount: nearbycardata.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, position) {
                            return FutureBuilder<List<Placemark>>(
                              future: _getVechileAddress(
                                  nearbycardata[position]
                                      .location!
                                      .coordinates!
                                      .first
                                      .toString(),
                                  nearbycardata[position]
                                      .location!
                                      .coordinates!
                                      .last
                                      .toString()),
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text("Error fetching location"));
                                } else if (snapshot.hasData) {
                                  String? place = snapshot.data![0].locality;

                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (_) => CarDetails(
                                              carphoto: nearbycardata[position]
                                                  .photos!
                                                  .toList(),
                                              carname: nearbycardata[position]
                                                  .brand
                                                  .toString(),
                                              rating: nearbycardata[position]
                                                  .rating
                                                  .toString(),
                                              fuel: nearbycardata[position]
                                                  .fuelType
                                                  .toString(),
                                              gear: nearbycardata[position]
                                                  .gearType
                                                  .toString(),
                                              seat: nearbycardata[position]
                                                  .noOfSeats
                                                  .toString(),
                                              door: nearbycardata[position]
                                                  .noOfDoors
                                                  .toString(),
                                              ownerphoto: nearbycardata[position]
                                                  .ownerProfilePhoto
                                                  .toString(),
                                              ownername: nearbycardata[position]
                                                  .ownerName
                                                  .toString(),
                                              ownerplace: nearbycardata[position].ownerPlace.toString(),
                                              id: nearbycardata[position]
                                                  .id
                                                  .toString(),
                                              price: nearbycardata[position]
                                                  .rentPrice
                                                  .toString(),
                                              color: nearbycardata[position].vehicleColor.toString(),
                                              available: nearbycardata[position].available)));
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
                                                    nearbycardata[position]
                                                        .photos![0]
                                                        .toString()),
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
                                              //vertical: 13.h
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 6.h,
                                                ),
                                                Text(
                                                  nearbycardata[position]
                                                      .brand
                                                      .toString(),
                                                  maxLines: 1,
                                                  //..... see
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  //.....
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
                                                            //..... see
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            //.....
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 1,
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
                                                      "₹ ${nearbycardata[position].rentPrice.toString()} / day",
                                                      // ' {8000} ',
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
                                                      //  letterSpacing: 0.50.w,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 6.h,
                                                ),
                                                Text(
                                                  nearbycardata[position]
                                                              .available ==
                                                          true
                                                      ? "Available"
                                                      : "NotAvailable",
                                                  //..... see
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  //.....
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    color: Color(0xFFF7F5F2),
                                                    fontSize: 13.sp,
                                                    fontFamily: 'sfprodisplay',
                                                    fontWeight: FontWeight.w300,
                                                    letterSpacing: 0.50.w,
                                                  ),
                                                ),
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
                          separatorBuilder: (context, position) {
                            return SizedBox(
                              width: 18.w,
                            );
                          },
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 24.h,
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
                BlocBuilder<AllcarBloc, AllcarState>(
                  builder: (context, state) {
                    if (state is AllcarBlocLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is AllcarBlocError) {
                      return Center(
                        child: Text("Error"),
                      );
                    }
                    if (state is AllcarBlocLoaded) {
                      allcardata =
                          BlocProvider.of<AllcarBloc>(context).allcarModelClass;
                      return SizedBox(
                        width: 389.w,
                        height: ((246.h * allcardata.length) / 2).h,
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 18.0.w,
                          mainAxisSpacing: 20.0.h,
                          childAspectRatio: 185 / 225,
                          shrinkWrap: true,
                          children: List.generate(
                            allcardata.length,
                            (index) {
                              return FutureBuilder<List<Placemark>>(
                                future: _getVechileAddress(
                                    allcardata[index]
                                        .location!
                                        .coordinates!
                                        .first
                                        .toString(),
                                    allcardata[index]
                                        .location!
                                        .coordinates!
                                        .last
                                        .toString()),
                                builder: (BuildContext context,
                                    AsyncSnapshot<dynamic> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  } else if (snapshot.hasError) {
                                    return Center(
                                        child: Text("Error fetching location"));
                                  } else if (snapshot.hasData) {
                                    String? place = snapshot.data![0].locality;
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (_) => CarDetails(
                                                      carphoto: allcardata[index].photos!.toList(),
                                                      carname:allcardata[index].brand.toString(),
                                                      rating: allcardata[index].rentPrice.toString(),
                                                      fuel: allcardata[index].fuelType.toString(),
                                                      gear: allcardata[index].gearType.toString(),
                                                      seat:allcardata[index].noOfSeats.toString(),
                                                      door: allcardata[index].noOfDoors.toString(),
                                                      ownerphoto:allcardata[index].ownerProfilePhoto.toString(),
                                                      ownername: allcardata[index].ownerName.toString(),
                                                  ownerplace: allcardata[index].ownerPlace.toString(),
                                                      id: allcardata[index].id.toString(),
                                                      price: allcardata[index].rentPrice.toString(),
                                                      color: allcardata[index].vehicleColor.toString(),
                                                      available: allcardata[index].available,
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
                                                      allcardata[index]
                                                          .photos![0]),
                                                  fit: BoxFit.cover,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(8.r),
                                                    topRight:
                                                        Radius.circular(8.r),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 9.w,
                                                //vertical: 13.h
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 6.h,
                                                  ),
                                                  Text(
                                                    allcardata[index]
                                                        .brand
                                                        .toString(),
                                                    //..... see
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    //.....
                                                    maxLines: 1,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color(0xFFF7F5F2),
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
                                                              place.toString(),
                                                              //..... see
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              //.....
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
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
                                                        "₹ ${allcardata[index].rentPrice.toString()} / day",
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
                                                          letterSpacing: 0.50.w,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 4.h,
                                                  ),
                                                  Text(
                                                    allcardata[index].available==true?"Available":"NotAvailable",
                                                    //..... see
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    //.....
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      color: Color(0xFFF7F5F2),
                                                      fontSize: 13.sp,
                                                      fontFamily:
                                                          'sfprodisplay',
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      letterSpacing: 0.50.w,
                                                    ),
                                                  ),
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
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
                SizedBox(
                  height: 130.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// sfprodisplay
