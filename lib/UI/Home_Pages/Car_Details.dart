import 'package:carousel_slider/carousel_slider.dart';
import 'package:drive2goo/Bloc/Nearby_Bloc/nearby_car_bloc.dart';
import 'package:drive2goo/Repostory/ModelClass/NearbyCarModelClass.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'Rent_Details.dart';

class CarDetails extends StatefulWidget {
  final List<dynamic> carphoto;
  final String carname;
  final String rating;
  final String fuel;
  final String gear;
  final String seat;
  final String door;
  final String ownerphoto;
  final String ownername;
  final String location;
  final String id;

  const CarDetails(
      {super.key,
      required this.carphoto,
      required this.carname,
      required this.rating,
      required this.fuel,
      required this.gear,
      required this.seat,
      required this.door,
      required this.ownerphoto,
      required this.ownername,
      required this.location, required this.id});

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  // current location start
  String _location = 'Unknown';
  // current location
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
          '${place.locality}, ${place.administrativeArea}, ${place.country}';
    });
  }

  // current location end
  late List<NearbyCarModelClass> nearbydatas;
  // just converting
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF000B17),
        leading: GestureDetector(
          onTap: () {
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
          widget.carname,
          style: TextStyle(
            color: Color(0xFFF7F5F2),
            fontSize: 24.sp,
            fontFamily: 'sfprodisplay',
            fontWeight: FontWeight.w600,
            letterSpacing: 0.24.w,
          ),
        ),
      ),
      backgroundColor: Color(0xFF000B17),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity.w,
                  height: 313.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xFF000B17),
                        Color(0x6FFFFFFF),
                        Color(0x89000B17)
                      ],
                    ),
                  ),
                  child: CarouselSlider.builder(
                    itemCount: widget.carphoto.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Container(
                      width: 315.w,
                      height: 254.h,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.carphoto[itemIndex]),
                          fit: BoxFit.cover,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r)),
                      ),
                    ),
                    options: CarouselOptions(
                      height: 254.h,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.77,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.carname,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFF7F5F2),
                              fontSize: 20.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            width: 30.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/like.png"))),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            unratedColor: Colors.grey,
                            itemSize: 20.sp,
                            initialRating: double.parse(widget.rating),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            //  itemPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(
                            width: 13.w,
                          ),
                          Text(
                            widget.rating,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFF7F5F2),
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 39.h,
                      ),
                      Text(
                        'Car Details',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 180.w,
                                  height: 58.h,
                                  decoration: ShapeDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(-5, 0.64),
                                      end: Alignment(0.54, -7.14),
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
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Container(
                                        width: 22.w,
                                        height: 22.h,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image: AssetImage("assets/1.png"),
                                          fit: BoxFit.cover,
                                        )),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Tank type',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFFA7B0BB),
                                                fontSize: 12.sp,
                                                fontFamily: 'sfprodisplay',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              widget.fuel,
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
                                Container(
                                  width: 180.w,
                                  height: 58.h,
                                  decoration: ShapeDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(-5, 0.64),
                                      end: Alignment(0.54, -7.14),
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
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Container(
                                        width: 26.w,
                                        height: 16.h,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image:
                                                    AssetImage("assets/2.png"),
                                                fit: BoxFit.cover)),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Gearbox',
                                              style: TextStyle(
                                                color: Color(0xFFA7B0BB),
                                                fontSize: 12.sp,
                                                fontFamily: 'sfprodisplay',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              widget.gear,
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
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 180.w,
                                  height: 58.h,
                                  decoration: ShapeDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(-5, 0.64),
                                      end: Alignment(0.54, -7.14),
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
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Container(
                                          width: 24.w,
                                          height: 24.h,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/3.png"),
                                                  fit: BoxFit.cover))),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Seats',
                                              style: TextStyle(
                                                color: Color(0xFFA7B0BB),
                                                fontSize: 12.sp,
                                                fontFamily: 'sfprodisplay',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              widget.seat,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.sp,
                                                fontFamily: 'sfprodisplayy',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 180.w,
                                  height: 58.h,
                                  decoration: ShapeDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(-5, 0.64),
                                      end: Alignment(0.54, -7.14),
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
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Container(
                                        width: 23.w,
                                        height: 23.h,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image:
                                                    AssetImage("assets/4.png"),
                                                fit: BoxFit.cover)),
                                      ),
                                      SizedBox(
                                        width: 14.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Door',
                                              style: TextStyle(
                                                color: Color(0xFFA7B0BB),
                                                fontSize: 12.sp,
                                                fontFamily: 'sfprodisplayy',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              widget.door,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.sp,
                                                fontFamily: 'sfprodisplayy',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 39.h,
                      ),
                      Text(
                        'Renter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontFamily: 'sfprodisplayy',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      Container(
                          width: 380.w,
                          height: 91.h,
                          decoration: ShapeDecoration(
                            color: Color(0xB21C2631),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Row(children: [
                            SizedBox(
                              width: 20.w,
                            ),
                            Container(
                              width: 62.w,
                              height: 62.h,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(widget.ownerphoto),
                                  fit: BoxFit.cover,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.r)),
                              ),
                            ),
                            SizedBox(
                              width: 19.w,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 22.h),
                                  child: Container(
                                    width: 150.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.ownername,
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: Color(0xFFF7F5F2),
                                            fontSize: 16.sp,
                                            fontFamily: 'sfprodisplayy',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11.h,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 14.w,
                                              height: 14.h,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/h.png"),
                                                      fit: BoxFit.cover)),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Container(
                                              width: 131.w,
                                              child: Text(
                                                widget.location,
                                                maxLines: 1,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color: Color(0xFFF7F5F2),
                                                  fontSize: 13.sp,
                                                  fontFamily: 'sfprodisplayy',
                                                  fontWeight: FontWeight.w300,
                                                  letterSpacing: 0.50.w,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 26.w,
                                  height: 26.h,
                                  padding: EdgeInsets.all(3.25.sp),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("assets/j.png"),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(
                                  width: 25.w,
                                ),
                                Container(
                                  width: 26.w,
                                  height: 26.h,
                                  padding: EdgeInsets.all(3.25.sp),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("assets/k.png"),
                                          fit: BoxFit.cover)),
                                )
                              ],
                            ),
                          ])),
                      SizedBox(
                        height: 39.h,
                      ),
                      Text(
                        'Recommended for you',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontFamily: 'sfprodisplayy',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 23.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.w),
                  child: Column(
                    children: [
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
                              nearbydatas =
                                  BlocProvider.of<NearbyCarBloc>(context)
                                      .nearbyCarModelClass;

                              return ListView.separated(
                                itemCount: nearbydatas.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, position) {
                                  if(widget.id==nearbydatas[position].id.toString()){
                                    return Container(child: Text("Error",style: TextStyle(color: Colors.red),),);
                                  }else {
                                    return FutureBuilder<List<Placemark>>(
                                      future: _getVechileAddress(
                                          nearbydatas[position]
                                              .location!
                                              .coordinates!
                                              .first
                                              .toString(),
                                          nearbydatas[position]
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
                                              child: Text(
                                                  "Error fetching location"));
                                        } else if (snapshot.hasData) {
                                          String? place = snapshot.data![0]
                                              .locality;
                                          return GestureDetector(
                                            // onTap: () {
                                            //   Navigator.of(context).push(MaterialPageRoute(
                                            //       builder: (_) => CarDetails(
                                            //         carphoto:
                                            //         nearbydatas[position]
                                            //             .photos!
                                            //             .toList(),
                                            //         carname:
                                            //         nearbydatas[position]
                                            //             .brand
                                            //             .toString(),
                                            //         rating:
                                            //         nearbydatas[position]
                                            //             .rating
                                            //             .toString(),
                                            //         fuel:
                                            //         nearbydatas[position]
                                            //             .fuelType
                                            //             .toString(),
                                            //         gear:
                                            //         nearbydatas[position]
                                            //             .gearType
                                            //             .toString(),
                                            //         seat:
                                            //         nearbydatas[position]
                                            //             .noOfSeats
                                            //             .toString(),
                                            //         door:
                                            //         nearbydatas[position]
                                            //             .noOfDoors
                                            //             .toString(),
                                            //         ownerphoto:
                                            //         nearbydatas[position]
                                            //             .ownerProfilePhoto
                                            //             .toString(),
                                            //         ownername:
                                            //         nearbydatas[position]
                                            //             .ownerName
                                            //             .toString(),
                                            //         location: place.toString(),
                                            //       )
                                            //       )
                                            //   );
                                            // },
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
                                                            nearbydatas[position]
                                                                .photos![0]
                                                                .toString()),
                                                        fit: BoxFit.cover,
                                                      ),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .only(
                                                          topLeft: Radius
                                                              .circular(8.r),
                                                          topRight:
                                                          Radius.circular(8.r),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets
                                                        .symmetric(
                                                        horizontal: 9.w,
                                                        vertical: 13.h),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          nearbydatas[position]
                                                              .brand
                                                              .toString(),
                                                          maxLines: 1,
                                                          textAlign: TextAlign
                                                              .center,
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFFF7F5F2),
                                                            fontSize: 16.sp,
                                                            fontFamily: 'sfprodisplay',
                                                            fontWeight: FontWeight
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
                                                                    maxLines: 1,
                                                                    textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                    style: TextStyle(
                                                                      color: Color(
                                                                          0xFFF7F5F2),
                                                                      fontSize: 13
                                                                          .sp,
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
                                                              "\$ ${nearbydatas[position]
                                                                  .rentPrice
                                                                  .toString()} / day",
                                                              // ' 8000 ',
                                                              textAlign:
                                                              TextAlign.center,
                                                              style: TextStyle(
                                                                color:
                                                                Color(
                                                                    0xFFFFD66D),
                                                                fontSize: 13.sp,
                                                                fontFamily:
                                                                'sfprodisplay',
                                                                fontWeight:
                                                                FontWeight.w500,
                                                                letterSpacing: 0.50
                                                                    .w,
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
                                  }
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 108.h,
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 430.w,
                height: 99.h,
                decoration: ShapeDecoration(
                  color: Color(0x82C2C2C2).withOpacity(0.8),
                  //color: Colors.white.withOpacity(0.7099999904632568),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 49.w,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '8000\$',
                            style: TextStyle(
                              color: Color(0xFF000B17),
                              fontSize: 20.sp,
                              fontFamily: 'sfprodisplayy',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: '/Day',
                            style: TextStyle(
                              color: Color(0xFF000B17),
                              fontSize: 15.sp,
                              fontFamily: 'sfprodisplayy',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 41.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => RentDetails()));
                      },
                      child: Container(
                        width: 213.w,
                        height: 50.h,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFFFFF0C9),
                              Color(0xFFFFCE50),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Rent Now',
                            style: TextStyle(
                              color: Color(0xFFF7F5F2),
                              fontSize: 20.sp,
                              fontFamily: 'sfprodisplayy',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
