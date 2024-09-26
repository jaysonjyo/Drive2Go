import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  static const route="/notification";

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {

    final message=ModalRoute.of(context)!.settings.arguments as RemoteMessage?;
    return Scaffold(
      body:message==null? SizedBox(): Column(crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("${message!.notification!.title}"),
        Text("${message.notification!.body}"),
        Text("${message.data.toString()}")
      ],),
    );
  }
}
