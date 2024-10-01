
import 'package:drive2goo/Repostory/ModelClass/HelpCenter/HelpcenterChatModel.dart';
import 'package:drive2goo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Bloc/Profile/Helpcenter/chat/chat_bloc.dart';
import '../../Bloc/Profile/Helpcenter/post/helpcenterpost_bloc.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  TextEditingController chatcontroler = TextEditingController();
  @override
  void initState() {

      BlocProvider.of<ChatBloc>(context).add(Fetchchatevent());


    // TODO: implement initState
    super.initState();
  }
late List<HelpcenterChatModel> chatdata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor:Color(0xFF000B17),
        leading: GestureDetector(onTap: (){
          Navigator.of(context).pop();
        },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 55.w,
              height: 55.h,
              decoration: ShapeDecoration(
                  color: Colors.white,
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
                  child: ClipOval(
                      child: Image.asset("assets/dp.jpg",fit: BoxFit.cover,)),
                  
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "Help Center",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'sfprodisplay',
              ),
            )
          ],
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(10.h), child: Container()),
      ),
      body: BlocBuilder<ChatBloc, ChatState>(
  builder: (context, state) {
    if(state is ChatBlocLoading){
      return Center(child: CircularProgressIndicator(),);

    }
    if(state is ChatBlocError){
      return SizedBox();
        // Center( child: Text("Error"),);
    }
    if(state is ChatBlocLoaded){

      chatdata=BlocProvider.of<ChatBloc>(context).helpcenterChatModel;


    return Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: chatdata.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
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
                            chatdata[index].queryDescription.toString(),
                            style: TextStyle(color: Colors.black,
                            fontSize: 17.sp,fontWeight: FontWeight.w500, fontFamily: 'sfprodisplay',),
                          ),
                        ),
                      ),
                      chatdata[index].response==null? SizedBox():  ChatBubble(
                        clipper:
                            ChatBubbleClipper5(type: BubbleType.receiverBubble),
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 2.h),
                        backGroundColor: Colors.white,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7.w,
                          ),
                          child:Text(
                           chatdata[index].response.toString(),
                            style: TextStyle(color: Colors.green,
                              fontSize: 17.sp,fontWeight: FontWeight.w500, fontFamily: 'sfprodisplay',),
                          ),
                        ),
                      ),
                    ],
                  ),
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
      );}
    else{
      return SizedBox();
    }
  },
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
                controller: chatcontroler,
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

              ),

            ),
            SizedBox(width: 8.w), // Adds space between the text field and the button
            BlocListener<HelpcenterpostBloc, HelpcenterpostState>(
  listener: (context, state) {
    if(state is HelpcenterpostBlocLoading){

    }
    if(state is HelpcenterpostBlocLoaded){
      BlocProvider.of<ChatBloc>(context).add(Fetchchatevent());
    //  Navigator.of(context).pop();
print("hello"+chatcontroler.text.toString());
    }
    if (state is HelpcenterpostBlocError) {
     // Navigator.of(context).pop();

      print("error");
    }
    // TODO: implement listener
  },
  child: GestureDetector(onTap: (){
    //ethe evide cheythathe pettane thanne chat kanan
              BlocProvider.of<HelpcenterpostBloc>(context).add(
                      FetchHelpcenterpostevent(descriptionmessage: chatcontroler.text));
chatcontroler.clear();
              },
              child: Container(
                width: 60.w,height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.white, // Button background color
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Icon(Icons.send, color: Colors.grey),
              ),
            ),
),
          ],
        ),
      ),
    );
  }
}
