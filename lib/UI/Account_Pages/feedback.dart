import 'package:drive2goo/Bloc/Profile/Feedback/feedback_bloc.dart';
import 'package:drive2goo/UI/Toast_message/Toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Feedbackpage extends StatefulWidget {
  const Feedbackpage({super.key});

  @override
  State<Feedbackpage> createState() => _FeedbackpageState();
}

class _FeedbackpageState extends State<Feedbackpage> {
  TextEditingController feedbackcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000B17),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 90.h,
              ),
              Text("Enter your FeedBack",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 29.sp,
                    fontFamily: 'sfprodisplay',
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: TextField(
                  maxLines: 5,
                  cursorColor: Colors.grey,
                  controller: feedbackcontroler,
                  style:
                  TextStyle(color: Colors.white, decorationThickness: 0.sp),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.18000000715255737),
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
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20.r)),
                    hintText: 'Type a message',
                    hintStyle: TextStyle(
                      color: Color(0xFFA7B0BB),
                      fontSize: 16.sp,
                      fontFamily: 'sfprodisplay',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ), SizedBox(height: 150.h,),
              BlocListener<FeedbackBloc, FeedbackState>(
                listener: (context, state) {
                  if(state is FeedbackBlocLoading){
                    showDialog(
                        context: context,
                        builder: (ctx) => Center(
                          child: CircularProgressIndicator(),
                        ));
                  }if(state is FeedbackBlocLoaded){
                    Navigator.of(context).pop();
                    ToastMessage().toastmessage(message: "Submitted your Feedback");
                  }if(state is FeedbackBlocError){
                    Navigator.of(context).pop();
                  }
                  // TODO: implement listener
                },
                child: GestureDetector(onTap: () {
                  BlocProvider.of<FeedbackBloc>(context).add(Fetchfeedbackevent(comment: feedbackcontroler.text));
feedbackcontroler.clear();
                },
                  child: Container(
                    width: 200.w,
                    height: 50.h,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r))),
                    child: Center(
                      child: Text('Submit',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w700,
                        ),),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
