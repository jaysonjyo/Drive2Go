import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
//toastmessage
class ToastMessage {
  toastmessage({required String message}) {
    Fluttertoast.showToast(msg: message,backgroundColor: Colors.green,fontSize: 15.sp,);
  }
}
