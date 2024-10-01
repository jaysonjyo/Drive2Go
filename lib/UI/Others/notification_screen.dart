import 'package:drive2goo/UI/Home_Pages/Car_Details.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  static const route = "/notification";

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<String> newimage = [
    "https://th.bing.com/th/id/OIP.7QmmMJW2YeufA4grKONzFAHaD5?w=1024&h=538&rs=1&pid=ImgDetMain",
    "https://th.bing.com/th/id/OIP.yEKm6GHOOjGDWDB52Ws8xwHaE8?pid=ImgDet&w=191&h=127&c=7",
    "https://th.bing.com/th/id/OIP.g_yyjiZC4FsAhJstSM1olgHaE6?pid=ImgDet&w=474&h=314&rs=1"
  ];

  @override
  Widget build(BuildContext context) {
    final message =
    ModalRoute
        .of(context)!
        .settings
        .arguments as RemoteMessage?;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body:
      //message==null? SizedBox():
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: newimage.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (_) =>
                    //     CarDetails(carphoto: carphoto,
                    //         carname: carname,
                    //         rating: rating,
                    //         fuel: fuel,
                    //         gear: gear,
                    //         seat: seat,
                    //         door: door,
                    //         ownerphoto: ownerphoto,
                    //         ownername: ownername,
                    //         ownerplace: ownerplace,
                    //         id: id,
                    //         price: price,
                    //         color: color,
                    //         available: available,
                    //         description: description,
                    //         number: number,
                    //         locationenable: locationenable)))
                  },
                    child: ListTile(
                      leading: Container(
                        width: 80.w,
                        height: 60.h,
                        decoration: ShapeDecoration(
                            color: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.r))),
                        child: ClipRRect(borderRadius: BorderRadius.circular(
                            7.r),
                            child: Image.network(
                              newimage[index].toString(), fit: BoxFit.cover,)),
                      ),
                      title: Text(
                        "New Message",
                        style: TextStyle(
                          color: Colors.white,
                          //Color(0xFF000B17),
                          fontSize: 20.sp,
                          fontFamily: 'sfprodisplayy',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        "You have new message",
                        style: TextStyle(
                          color: Colors.white,
                          //Color(0xFF000B17),

                          fontFamily: 'sfprodisplayy',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 4.h,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
