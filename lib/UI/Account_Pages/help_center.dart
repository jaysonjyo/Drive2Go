import 'package:drive2goo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  TextEditingController chat = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor:Colors.grey[200],
        //Color(0xFF000B17),
        leading: GestureDetector(onTap: (){
          Navigator.of(context).pop();
        },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 55.w,
              height: 55.h,
              decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r))),
              child: Center(
                child: Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r))),
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "Name",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'sfprodisplay',
              ),
            )
          ],
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(10.h), child: Container()),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ChatBubble(
                      clipper: ChatBubbleClipper5(type: BubbleType.sendBubble),
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 20.h),
                      backGroundColor: Colors.green[400],
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7.w,
                        ),
                        child: Text(
                          "ertyuio",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    ChatBubble(
                      clipper:
                          ChatBubbleClipper5(type: BubbleType.receiverBubble),
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 2.h),
                      backGroundColor: Colors.white,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7.w,
                        ),
                        child: Text(
                          "ertyuio",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox();
              },
            ),
          ),
          SizedBox(
            height: 80.h,
          )
        ],
      ),
      bottomSheet: Container(
        width: double.infinity.w,
        height: 62.h,
        color: Colors.grey[200],
        child: Row(
          children: [
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                controller: chat,
                style:
                    TextStyle(color: Colors.black
                        , decorationThickness: 0.sp),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.w),
                  filled: true,
                  fillColor: Colors.white,
                      //.withOpacity(0.18000000715255737),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20.r)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: BorderSide.none,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Type a message',
                  hintStyle: TextStyle(
                    color: Color(0xFFA7B0BB),
                    fontSize: 16.sp,
                    fontFamily: 'sfprodisplay',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // validator: (value) {
                //   if (value!.isEmpty ||
                //       !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                //           .hasMatch(value)) {
                //     return 'Enter a valid email!';
                //   }
                //   return null;
                // },
              ),

            ),
            SizedBox(width: 8.w), // Adds space between the text field and the button
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Button background color
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: IconButton(
                icon: Icon(Icons.send, color: Colors.grey), // Send button icon
                onPressed: () {
                  // Add the send action here

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
