
import 'package:drive2goo/Bloc/Nearby_Bloc/nearby_car_bloc.dart';
import 'package:drive2goo/Repostory/ModelClass/NearbyModelClass.dart';
import 'package:drive2goo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  }
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
    List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude, position.longitude);
    BlocProvider.of<NearbyCarBloc>(context).add(FetchNearbycar(lat:  position.latitude.toString(), long: position.longitude.toString()));

    Placemark place = placemarks[0];

    setState(() {
      _location =
      '${place.locality}, ${place.administrativeArea}, ${place.country}';
    });
  }
  // current location end
  late List<NearbyCarModelClass> nearbycardata;
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
                                SizedBox(height: 7.h,),
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
                            child: Icon(Icons.notifications_none_outlined,size: 24.sp,),
                          )
                        ],
                      ),
                      SizedBox(height: 19.h,),
                      Row(crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Search()));
                          },
                            child: Container(
                              width: 292.w,
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
                  child: BlocBuilder<NearbyCarBloc, NearbyCarState>(
  builder: (context, state) {
    if(state is NearbyCarBlocLoading){
      return Center(child: CircularProgressIndicator(),);
    }
    if(state is NearbyCarBlocError){
      return Center(child:  Text("Error",style: TextStyle(color: Colors.white),),);
    }
    if(state is NearbyCarBlocLoaded){
      nearbycardata = BlocProvider.of<NearbyCarBloc>(context).nearbyCarModelClass;
    return ListView.separated(
                    itemCount: nearbycardata.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, position) {
                      return  GestureDetector(onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CarDetails()));
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
                                    image: NetworkImage(nearbycardata[position].photos![0].toString()),
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
                                      nearbycardata[position].brand.toString(),maxLines: 1,
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
                                              nearbycardata[position].location.toString(),
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
                      return SizedBox(width: 18.w,);
                    },

                  );}else {
      return SizedBox();
    }
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

                SizedBox(
                  width: 389.w,
                  height: (236*6/2).h,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 18.0.w,
                    mainAxisSpacing: 20.0.h,
                    childAspectRatio: 185/225,
                    shrinkWrap: true,
                    children: List.generate(6,
                          (index) {
                      return GestureDetector(onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CarDetails()));
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
                        ),
                      );
                    },),
                  ),
                ),
                SizedBox(height: 130.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// sfprodisplay