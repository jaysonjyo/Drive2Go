import 'package:fluttertoast/fluttertoast.dart';
//toastmessage
class ToastMessage {
  toastmessage({required String message}) {
    Fluttertoast.showToast(msg: message);
  }
}
