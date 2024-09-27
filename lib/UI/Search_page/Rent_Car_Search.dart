import 'dart:math';

import 'package:drive2goo/Repostory/ModelClass/Rentvechile/RentcarsearchModelclass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../Bloc/Rent/Rentcarsearch_Bloc/reant_search_bloc.dart';
import '../Home_Pages/Car_Details.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  //modelcalss calling
  late List<RentcarsearchModelclass> rentcarsearchdata;

  //
  //controller
  TextEditingController rent_search = TextEditingController();

  //
  bool locationEnabled = true;

// initstate
  @override
  void initState() {
    _getCurrentLocation();
    BlocProvider.of<ReantSearchBloc>(context)
        .add(FetchReantSearchEvent(brand: rent_search.text));
    super.initState();
  }

  //
  // dispose
  @override
  void dispose() {
    rent_search.clear();
    // TODO: implement dispose
    super.dispose();
  }

//

//all functions
  // current location
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        locationEnabled = false;
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
// list of location convert cheyyan
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

  // end code for list of place converting
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000B17),
      appBar: AppBar(
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
                  controller: rent_search,
                  style:
                      TextStyle(color: Colors.white, decorationThickness: 0.sp),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20.h),
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
                  onChanged: (v) {
                    setState(() {
                      BlocProvider.of<ReantSearchBloc>(context)
                          .add(FetchReantSearchEvent(brand: rent_search.text));
                    });
                  },
                  onSubmitted: (v) {
                    setState(() {
                      BlocProvider.of<ReantSearchBloc>(context)
                          .add(FetchReantSearchEvent(brand: rent_search.text));
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
        centerTitle: true,
        title: Text(
          "Rent Car Search",
          style: TextStyle(fontSize: 25.sp, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: BlocBuilder<ReantSearchBloc, ReantSearchState>(
            builder: (context, state) {
              if (state is ReantSearchBlocLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ReantSearchBlocError) {
                return Center(
                  child: Text("Error"),
                );
              }
              if (state is ReantSearchBlocLoaded) {
                rentcarsearchdata = BlocProvider.of<ReantSearchBloc>(context)
                    .rentcarsearchModelclass;
                return Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 389.w,
                      height: max(
                          0,
                          ((rentcarsearchdata.length / 2).ceil() *
                                  (225.h + 20.0.h)) -
                              20.0.h),

                      // height: rentcarsearchdata.length == 1
                      //     ? 225.h
                      //     : ((280 * rentcarsearchdata.length) / 2).h,
                      child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 18.0.w,
                          mainAxisSpacing: 20.0.h,
                          childAspectRatio: 185 / 225,
                          shrinkWrap: true,
                          children: List.generate(
                            rentcarsearchdata.length,
                            (index) {
                              return FutureBuilder<List<Placemark>>(
                                  future: _getVechileAddress(
                                      rentcarsearchdata[index]
                                          .location!
                                          .coordinates!
                                          .first
                                          .toString(),
                                      rentcarsearchdata[index]
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
                                      String? place =
                                          snapshot.data![0].locality;
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                                  builder: (_) => CarDetails(
                                                        carphoto:
                                                            rentcarsearchdata[
                                                                    index]
                                                                .photos!
                                                                .toList(),
                                                        carname:
                                                            rentcarsearchdata[
                                                                    index]
                                                                .brand
                                                                .toString(),
                                                        rating:
                                                            rentcarsearchdata[
                                                                    index]
                                                                .rating
                                                                .toString(),
                                                        fuel: rentcarsearchdata[
                                                                index]
                                                            .fuelType
                                                            .toString(),
                                                        gear: rentcarsearchdata[
                                                                index]
                                                            .gearType
                                                            .toString(),
                                                        seat: rentcarsearchdata[
                                                                index]
                                                            .noOfSeats
                                                            .toString(),
                                                        door: rentcarsearchdata[
                                                                index]
                                                            .noOfDoors
                                                            .toString(),
                                                        ownerphoto:
                                                            rentcarsearchdata[
                                                                    index]
                                                                .ownerProfilePhoto
                                                                .toString(),
                                                        ownername:
                                                            rentcarsearchdata[
                                                                    index]
                                                                .ownerName
                                                                .toString(),
                                                        ownerplace:
                                                            rentcarsearchdata[
                                                                    index]
                                                                .ownerPlace
                                                                .toString(),
                                                        id: rentcarsearchdata[
                                                                index]
                                                            .id
                                                            .toString(),
                                                        price:
                                                            rentcarsearchdata[
                                                                    index]
                                                                .rentPrice
                                                                .toString(),
                                                        color:
                                                            rentcarsearchdata[
                                                                    index]
                                                                .vehicleColor
                                                                .toString(),
                                                        available:
                                                            rentcarsearchdata[
                                                                    index]
                                                                .available
                                                                .toString(),
                                                        description:
                                                            rentcarsearchdata[
                                                                    index]
                                                                .description
                                                                .toString(),
                                                        number:
                                                            rentcarsearchdata[
                                                                    index]
                                                                .ownerPhoneNumber
                                                                .toString(),
                                                        locationenable:
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
                                                        rentcarsearchdata[index]
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
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 4.h,
                                                    ),
                                                    Text(
                                                      rentcarsearchdata[index]
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
                                                                maxLines: 1,
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
                                                            )
                                                          ],
                                                        ),
                                                        Text(
                                                          "\$ ${rentcarsearchdata[index].rentPrice.toString()} / day",
                                                          //'\$ 8000 / day',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFFFFD66D),
                                                            fontSize: 13.sp,
                                                            fontFamily:
                                                                'sfprodisplay',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            letterSpacing:
                                                                0.50.w,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Text(
                                                      rentcarsearchdata[index]
                                                                  .available ==
                                                              true
                                                          ? "Available"
                                                          : "NotAvailable",
                                                      //..... see
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      //.....
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFF7F5F2),
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
                                  });
                            },
                          )),
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
