import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:drive2goo/Bloc/Buy_Car_Bloc/nearby_buy_bloc.dart';
import 'package:drive2goo/Repostory/ModelClass/Buyvechile/NearByBuyCarModelClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class BuyCarDetails extends StatefulWidget {
  final List<dynamic> photo;
  final String brand;
  final String rating;
  final String fueltype;
  final String gear;
  final String seat;
  final String door;
  final String ownerphoto;
  final String ownername;
  final String ownerplace;
  final String id;
  final String price;

  const BuyCarDetails(
      {super.key,
      required this.photo,
      required this.brand,
      required this.rating,
      required this.fueltype,
      required this.gear,
      required this.seat,
      required this.door,
      required this.ownerphoto,
      required this.ownername,
      required this.ownerplace,
      required this.id,
      required this.price});

  @override
  State<BuyCarDetails> createState() => _BuyCarDetailsState();
}

class _BuyCarDetailsState extends State<BuyCarDetails> {
  // payment for any payments
  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

//payment ended function

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
    BlocProvider.of<NearbyBuyBloc>(context).add(FetchNearbyBuycarevent(
        lat: position.longitude.toString(),
        long: position.longitude.toString()));
  }

  // current location end
  // just list of place converting
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
          'Audi R8 Coupe',
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
                    itemCount: widget.photo.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Container(
                      width: 315.w,
                      height: 254.h,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.photo[itemIndex]),
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
                            widget.brand.toString(),
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
                            initialRating:
                                double.parse(widget.rating.toString()),
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
                            widget.rating.toString(),
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
                                              widget.fueltype.toString(),
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
                                              widget.gear.toString(),
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
                                              widget.seat.toString(),
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
                                              widget.door.toString(),
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
                                  image: NetworkImage(
                                      widget.ownerphoto.toString()),
                                  fit: BoxFit.cover,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.r)),
                              ),
                            ),
                            SizedBox(
                              width: 19.w,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 22.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.ownername.toString(),
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
                                                image:
                                                    AssetImage("assets/h.png"),
                                                fit: BoxFit.cover)),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Container(
                                        width: 131.w,
                                        child: Text(
                                          widget.ownerplace,
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
                                          image:
                                              AssetImage("assets/whatsapp.png"),
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
                        child: BlocBuilder<NearbyBuyBloc, NearbyBuyState>(
                          builder: (context, state) {
                            if (state is NearbybuycarBlocLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (state is NearbybuycarBlocError) {
                              return Center(
                                child: Text("Error"),
                              );
                            }
                            if (state is NearbybuycarBlocLoaded) {
                              nearbybuycardata =
                                  BlocProvider.of<NearbyBuyBloc>(context)
                                      .nearByBuyCarModelClass;
                              return ListView.separated(
                                itemCount: nearbybuycardata.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, position) {
                                  if (widget.id ==
                                      nearbybuycardata[position]
                                          .id
                                          .toString()) {
                                    return SizedBox();
                                  } else {
                                    return FutureBuilder(
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
                                          AsyncSnapshot<dynamic> snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                        if (snapshot.hasError) {
                                          return Center(
                                            child: Text("Errorr"),
                                          );
                                        }
                                        if (snapshot.hasData) {
                                          String? place =
                                              snapshot.data![0].locality;
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (_) => BuyCarDetails(
                                                      photo: nearbybuycardata[position]
                                                          .photos!
                                                          .toList(),
                                                      brand: nearbybuycardata[position]
                                                          .brand
                                                          .toString(),
                                                      rating: nearbybuycardata[position]
                                                          .rating
                                                          .toString(),
                                                      fueltype: nearbybuycardata[position]
                                                          .fuelType
                                                          .toString(),
                                                      gear: nearbybuycardata[position]
                                                          .gearType
                                                          .toString(),
                                                      seat: nearbybuycardata[position]
                                                          .noOfSeats
                                                          .toString(),
                                                      door: nearbybuycardata[position]
                                                          .noOfDoors
                                                          .toString(),
                                                      ownerphoto:
                                                          nearbybuycardata[position]
                                                              .ownerProfilePhoto
                                                              .toString(),
                                                      ownername:
                                                          nearbybuycardata[position]
                                                              .ownerName
                                                              .toString(),
                                                      ownerplace: nearbybuycardata[position].ownerPlace.toString(),

                                                      id: nearbybuycardata[position].id.toString(),
                                                      price: nearbybuycardata[position].rentPrice.toString())));
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
                                                    decoration: ShapeDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            nearbybuycardata[
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
                                                          nearbybuycardata[
                                                                  position]
                                                              .brand
                                                              .toString(),
                                                          maxLines: 1,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFFF7F5F2),
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
                                                                  width: 60.w,
                                                                  child: Text(
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
                                                                "\$ ${nearbybuycardata[position].rentPrice.toString()} / day",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
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
                                  }
                                },
                                separatorBuilder: (context, position) {
                                  if (widget.id ==
                                      nearbybuycardata[position]
                                          .id
                                          .toString()) {
                                    return SizedBox();
                                  } else {
                                    return SizedBox(
                                      width: 18.w,
                                    );
                                  }
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
                      width: 35.w,
                    ),
                    Container(
                      width: 150.w,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "₹ ${widget.price}",
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
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Razorpay razorpay = Razorpay();
                        var options = {
                          'key': 'rzp_test_gKANZdsNdLqaQs',
                          'amount': 100,
                          'name': 'Acme Corp.',
                          'description': 'Fine T-Shirt',
                          'retry': {'enabled': true, 'max_count': 1},
                          'send_sms_hash': true,
                          'prefill': {
                            'contact': '8888888888',
                            'email': 'test@razorpay.com'
                          },
                          'external': {
                            'wallets': ['paytm']
                          }
                        };
                        razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                            handlePaymentErrorResponse);
                        razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                            handlePaymentSuccessResponse);
                        razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                            handleExternalWalletSelected);
                        razorpay.open(options);
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
                            'Buy Now',
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
