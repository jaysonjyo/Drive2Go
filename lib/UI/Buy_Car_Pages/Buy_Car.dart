import 'package:drive2goo/Repostory/ModelClass/Buyvechile/NearByBuyCarModelClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../Bloc/Buy_Car_Bloc/nearby_buy_bloc.dart';
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
    _getCurrentLocation();
    // TODO: implement initState
    super.initState();
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
                child: BlocBuilder<NearbyBuyBloc, NearbyBuyState>(
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

                      return ListView.separated(
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
                                                    photo:nearbybuycardata[position].photos!.toList(),
                                                    brand: nearbybuycardata[position].brand.toString(),
                                                    rating: nearbybuycardata[position].rating.toString(),
                                                    fueltype: nearbybuycardata[position].fuelType.toString(),
                                                    gear: nearbybuycardata[position].gearType.toString(),
                                                    seat: nearbybuycardata[position].noOfSeats.toString(),
                                                    door: nearbybuycardata[position].noOfDoors.toString(),
                                                    ownerphoto: nearbybuycardata[position].ownerProfilePhoto.toString(),
                                                    ownername: nearbybuycardata[position].ownerName.toString(),
                                                    ownerplace: nearbybuycardata[position].ownerPlace.toString(),
                                               id: nearbybuycardata[position].id.toString(),
                                                price: nearbybuycardata[position].rentPrice.toString(),
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
                                                image: NetworkImage(nearbybuycardata[position]
                                                    .photos![0]
                                                    .toString(),


                                                ),fit: BoxFit.cover

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
                                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

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
                                                          width: 60.w,
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
                                                        "₹ ${nearbybuycardata[position].rentPrice.toString()} / day",
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
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 9.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, position) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (_) => BuyCarDetails()));
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
              Padding(
                padding: EdgeInsets.only(left: 9.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, position) {
                    return GestureDetector(
                      onTap: () {
                        //  Navigator.of(context).push(
                        //    MaterialPageRoute(builder: (_) => BuyCarDetails()));
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
                height: (236 * 6 / 2).h,
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 18.0.w,
                  mainAxisSpacing: 20.0.h,
                  childAspectRatio: 185 / 225,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: List.generate(
                    6,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          //  Navigator.of(context).push(MaterialPageRoute(
                          //    builder: (_) => BuyCarDetails()));
                        },
                        child: Container(
                          width: 185.w,
                          height: 223.h,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(-5, 0.54),
                              end: Alignment(0.54, -0.54),
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
              SizedBox(
                height: 130.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
