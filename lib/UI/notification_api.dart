import 'package:drive2goo/UI/Others/notification_screen.dart';
import 'package:drive2goo/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// print cheyyan mathram
Future<void>handlebagroundmessage(RemoteMessage message)async{

}

void handlemessage (RemoteMessage? message){
  if(message==null) return;
  navigatorykey.currentState?.pushNamed(NotificationScreen.route,arguments: message);
}
Future initPush_Notifications()async{
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    sound: true,badge: true
  );
  FirebaseMessaging.instance.getInitialMessage().then((value) => handlemessage);
  FirebaseMessaging.onMessageOpenedApp.listen(handlemessage);
  FirebaseMessaging.onBackgroundMessage(handlebagroundmessage);
}
class Notificationfirebase{
  final firbasemessaging=FirebaseMessaging.instance;


  Future<void> initNotification()async {
    await firbasemessaging.requestPermission();
    final Fcmtoken=await firbasemessaging.getToken();
    
    print("token :$Fcmtoken");
 initPush_Notifications();
  }
  
}