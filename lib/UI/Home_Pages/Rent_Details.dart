import 'dart:ffi';
import 'package:drive2goo/UI/Others/BottomNavigation.dart';
import 'package:drive2goo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'Google_Ma_pickup.dart';
import 'Google_Map_ return.dart';

class RentDetails extends StatefulWidget {
  const RentDetails({super.key});

  @override
  State<RentDetails> createState() => _RentDetailsState();
}

class _RentDetailsState extends State<RentDetails> {
  //pick up date
  TextEditingController pickupdatecontroler = TextEditingController();

  Future<void> _pickdate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        pickupdatecontroler.text = DateFormat("dd/MM/yyyy").format(picked);
      });
    }
  }

  //return date
  TextEditingController retrundatecontroler = TextEditingController();

  Future<void> returndate(BuildContext context) async {
    final DateTime? pickedreturndate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (pickedreturndate != null) {
      setState(() {
        retrundatecontroler.text =
            DateFormat("dd/MM/yyyy").format(pickedreturndate);
      });
    }
  }
@override
  void dispose() {
    setState(() {
      pickuplocationcontroller.clear();
      returnlocationcontroller.clear();
    });
    // TODO: implement dispose
    super.dispose();
  }
  // payment for any payments
  void handlePaymentErrorResponse(PaymentFailureResponse response){
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response){

    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(context, "Payment Successful", "Payment ID: ${response.paymentId}");
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  void handleExternalWalletSelected(ExternalWalletResponse response){
    showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message){
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed:  () {},
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


//selected container
  int _selectedIndex = -1;
  void _selectContainer(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000B17),
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
          'Renting Details',
          style: TextStyle(
            color: Color(0xFFF7F5F2),
            fontSize: 24.sp,
            fontFamily: 'sfprodisplay',
            fontWeight: FontWeight.w600,
            letterSpacing: 0.24.w,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 49.h,
                  ),
                  Container(
                    width: 380.w,
                    height: 123.h,
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(-5, 0.64),
                        end: Alignment(0.54, -7.14),
                        colors: [Color(0x1BFFFFFF), Color(0xFF000C1B)],
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.w, color: Color(0xFF58606A)),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 127.w,
                          height: 102.h,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/rentcar.png"),
                              fit: BoxFit.cover,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r)),
                          ),
                        ),
                        SizedBox(
                          width: 27.w,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Audi R8 Coupé',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFF7F5F2),
                                  fontSize: 20.sp,
                                  fontFamily: 'sfprodisplay',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                'White',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF627487),
                                  fontSize: 16.sp,
                                  fontFamily: 'sfprodisplay',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                '8000\$/Day',
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
                  SizedBox(
                    height: 42.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 24.w,
                              height: 24.h,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/calendar.png"))),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Select Date',
                              style: TextStyle(
                                color: Color(0xFFF7F5F2),
                                fontSize: 16.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 23.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 148.w,
                                height: 80.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      controller: pickupdatecontroler,
                                      textAlign: TextAlign.center,
                                      cursorColor: Colors.white,
                                      style: TextStyle(color: Colors.white),
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      decoration: InputDecoration(
                                        //filled: true,
                                        //fillColor: Colors.white.withOpacity(0.18000000715255737),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            borderSide: BorderSide(
                                                width: 1.w,
                                                color: Color(0xFF627487))),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            borderSide: BorderSide(
                                                width: 1.w,
                                                color: Color(0xFF627487))),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            borderSide: BorderSide(
                                                width: 1.w,
                                                color: Color(0xFF627487))),
                                        //errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),
                                        //  borderRadius: BorderRadius.circular(20.r)),
                                        hintText: 'dd/mm/yyyy',
                                        //selectdate.toString(),
                                        hintStyle: TextStyle(
                                          color: Color(0xFF627487),
                                          fontSize: 16.sp,
                                          fontFamily: 'sfprodisplay',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      onTap: () {
                                        _pickdate(context);
                                      },
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                      'Pickup Date',
                                      style: TextStyle(
                                        color: Color(0xFF627487),
                                        fontSize: 14.sp,
                                        fontFamily: 'sfprodisplay',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 25.h),
                                child: Container(
                                  width: 32.w,
                                  child: Image.asset(
                                    "assets/Line.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Container(
                                width: 148.w,
                                height: 80.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      controller: retrundatecontroler,
                                      textAlign: TextAlign.center,
                                      cursorColor: Colors.white,
                                      style: TextStyle(color: Colors.white),
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      decoration: InputDecoration(
                                        //filled: true,
                                        //fillColor: Colors.white.withOpacity(0.18000000715255737),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            borderSide: BorderSide(
                                                width: 1.w,
                                                color: Color(0xFF627487))),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            borderSide: BorderSide(
                                                width: 1.w,
                                                color: Color(0xFF627487))),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            borderSide: BorderSide(
                                                width: 1.w,
                                                color: Color(0xFF627487))),
                                        //errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),
                                        //  borderRadius: BorderRadius.circular(20.r)),
                                        hintText: 'dd/mm/yyyy',
                                        hintStyle: TextStyle(
                                          color: Color(0xFF627487),
                                          fontSize: 16.sp,
                                          fontFamily: 'sfprodisplay',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      onTap: () {
                                        returndate(context);
                                      },
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                      'Return Date',
                                      style: TextStyle(
                                        color: Color(0xFF627487),
                                        fontSize: 14.sp,
                                        fontFamily: 'sfprodisplay',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 44.h,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        //       horizontal: 7.65.w
                        horizontal: 10.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 24.w,
                              height: 24.h,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/h.png"),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: 10.35.w,
                            ),
                            Text(
                              'Select Location',
                              style: TextStyle(
                                color: Color(0xFFF7F5F2),
                                fontSize: 16.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 22.58.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Container(
                            width: 352.w,
                            height: 80.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  controller: pickuplocationcontroller,
                                  //textAlign: TextAlign.start,
                                  cursorColor: Colors.white,
                                  style: TextStyle(color: Colors.white),
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    //filled: true,
                                    //fillColor: Colors.white.withOpacity(0.18000000715255737),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        borderSide: BorderSide(
                                            width: 1.w,
                                            color: Color(0xFF627487))),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        borderSide: BorderSide(
                                            width: 1.w,
                                            color: Color(0xFF627487))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        borderSide: BorderSide(
                                            width: 1.w,
                                            color: Color(0xFF627487))),
                                    //errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),
                                    //  borderRadius: BorderRadius.circular(20.r)),
                                    hintText:
                                        'Type your location or search in map',
                                    hintStyle: TextStyle(
                                      color: Color(0xFF627487),
                                      fontSize: 16.sp,
                                      fontFamily: 'sfprodisplay',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    GoogleMapickup()));
                                      },
                                      child: Icon(
                                        Icons.map_outlined,
                                        color: Color(0xFF627487),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  'Pickup location',
                                  style: TextStyle(
                                    color: Color(0xFF627487),
                                    fontSize: 14.sp,
                                    fontFamily: 'sfprodisplay',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 26.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Container(
                            width: 352.w,
                            height: 80.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  controller: returnlocationcontroller,
                                  //textAlign: TextAlign.start,
                                  cursorColor: Colors.white,
                                  style: TextStyle(color: Colors.white),
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    //filled: true,
                                    //fillColor: Colors.white.withOpacity(0.18000000715255737),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        borderSide: BorderSide(
                                            width: 1.w,
                                            color: Color(0xFF627487))),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        borderSide: BorderSide(
                                            width: 1.w,
                                            color: Color(0xFF627487))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        borderSide: BorderSide(
                                            width: 1.w,
                                            color: Color(0xFF627487))),
                                    //errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),
                                    //  borderRadius: BorderRadius.circular(20.r)),
                                    hintText:
                                        'Type your location or search in map',
                                    hintStyle: TextStyle(
                                      color: Color(0xFF627487),
                                      fontSize: 16.sp,
                                      fontFamily: 'sfprodisplay',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    GoogleMapReturn()));
                                      },
                                      child: Icon(
                                        Icons.map_outlined,
                                        color: Color(0xFF627487),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  'Return location',
                                  style: TextStyle(
                                    color: Color(0xFF627487),
                                    fontSize: 14.sp,
                                    fontFamily: 'sfprodisplay',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 41.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        //    horizontal:3.w
                        horizontal: 10.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                width: 24.w,
                                height: 24.h,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Icon(
                                  Icons.payment,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              width: 10.35.w,
                            ),
                            Text(
                              'Payment Method',
                              style: TextStyle(
                                color: Color(0xFFF7F5F2),
                                fontSize: 16.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child:Column(
                            children: [

                              GestureDetector(onTap: (){
                                _selectContainer(0);
                              },

                                child: Container(
                                    width: 352.w,
                                    height: 55.h,
                                    decoration: ShapeDecoration(

                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width:_selectedIndex == 0? 3.w:1.w
                                            , color: _selectedIndex == 0
                                            ? Colors.white
                                            : Color(0xFF627487)

                                          ),
                                        borderRadius: BorderRadius.circular(4.r),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 16.w,
                                        ),
                                        Container(
                                          width: 24.w,
                                          height: 24.h,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/card.png"),
                                                  fit: BoxFit.cover)),
                                        ),
                                        SizedBox(
                                          width: 25.w,
                                        ),
                                        Text(
                                          '**** **** ***5 6324',
                                          style: TextStyle(
                                            color: Color(0xFF627487),
                                            fontSize: 16.sp,
                                            fontFamily: 'sfprodisplay',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              GestureDetector(onTap: (){
                                _selectContainer(1);
                              },
                                child: Container(
                                    width: 352.w,
                                    height: 55.h,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width:_selectedIndex == 1
                                                ? 3.w:1.w,
                                          color: _selectedIndex == 1
                                            ? Colors.white
                                            : Color(0xFF627487),

                                        ),
                                        borderRadius: BorderRadius.circular(4.r),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 16.w,
                                        ),
                                        Container(
                                          width: 24.w,
                                          height: 24.h,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/cash.png"),
                                                  fit: BoxFit.cover)),
                                        ),
                                        SizedBox(
                                          width: 25.w,
                                        ),
                                        Text(
                                          'Razorpay',
                                          style: TextStyle(
                                            color: Color(0xFF627487),
                                            fontSize: 16.sp,
                                            fontFamily: 'sfprodisplay',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    )),
                              ),

                            ],
                          )

                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 34.h,
            ),
            Container(
              width: 430.w,
              height: 99.h,
              decoration: ShapeDecoration(
                color: Color(0x82C2C2C2).withOpacity(0.7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 25.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'RENTAL PRICE FOR ',
                        style: TextStyle(
                          color: Color(0xFF1F354D),
                          fontSize: 15.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      Text(
                        '14 Days - 1,12,000\$',
                        style: TextStyle(
                          color: Color(0xFFF7F5F2),
                          fontSize: 20.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 33.w,
                  ),
                  Center(
                    child: GestureDetector(onTap: (){
if(_selectedIndex==0){
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>Bottomnavigation()),(route)=>false);
}else if
(_selectedIndex==1)
{
  Razorpay razorpay = Razorpay();
  var options = {
    'key': 'rzp_test_gKANZdsNdLqaQs',
    'amount': 100,
    'name': 'Acme Corp.',
    'description': 'Fine T-Shirt',
    'retry': {
      'enabled': true,
      'max_count': 1
    },
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
}else
    {

    }
                    },
                      child: Container(
                        width: 161.w,
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
                            'Pay Now ',
                            style: TextStyle(
                              color: Color(0xFFF7F5F2),
                              fontSize: 20.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
