import 'dart:io';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:drive2goo/Bloc/Profile/profileupdate/profile_update_bloc.dart';
import 'package:drive2goo/UI/authentication_pages/Sign_UP.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../Bloc/Profile/User/user_bloc.dart';

class Editpage extends StatefulWidget {
  final String profilename;

  const Editpage({super.key, required this.profilename});

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  File? imagefile;
  final picker = ImagePicker();

  Future getImageGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        imagefile = File(pickedFile.path);
        BlocProvider.of<ProfileUpdateBloc>(context).add(FetchProfileUpdatevent(
            boolcheckingimage: true, userimae: imagefile));
      } else {
        print("No image Picked");
      }
    });
  }

  Future getCamera() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        imagefile = File(pickedFile.path);
        BlocProvider.of<ProfileUpdateBloc>(context).add(FetchProfileUpdatevent(
            boolcheckingimage: true, userimae: imagefile));
      } else {
        print("No image Picked");
      }
    });
  }

  bool selected = false;
  bool isvisible = false;
  TextEditingController name = TextEditingController();
  TextEditingController oldpasswordcontroler = TextEditingController();
  TextEditingController newpasswordcontroler = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF000B17),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Color(0xFF000B17),
      body: SafeArea(
        child: SingleChildScrollView(
            child: BlocListener<ProfileUpdateBloc, ProfileUpdateState>(
          listener: (context, state) {
            if (state is ProfileUpdateBlocLoading) {
              showDialog(
                  context: context,
                  builder: (ctx) => Center(
                        child: CircularProgressIndicator(),
                      ));
            }
            if (state is ProfileUpdateBlocLoaded) {
              BlocProvider.of<UserBloc>(context).add(FetchUserevent());
              Navigator.of(context).pop();
              Navigator.of(context).pop();

            }
            if (state is ProfileUpdateBlocError) {
              Navigator.of(context).pop();
            }
            // TODO: implement listener
          },
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Stack(
                children: [
                  Container(
                    width: 150.w,
                    height: 150.h,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.w, color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(75.r))),

                    child: GestureDetector(
                        onTap: () {
                          getImageGallery();
                        },
                        child: ClipOval(
                            child: imagefile != null
                                ? Image.file(
                                    imagefile!.absolute,
                                    fit: BoxFit.cover,
                                  )
                                : Icon(
                                    Icons.person,
                                    size: 100.sp,
                                  ))),
                  ),
                  Positioned(
                    top: 100.h,
                    left: 100.w,
                    child: Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: ShapeDecoration(
                          color: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.r))),
                      child: GestureDetector(
                        onTap: () {
                          getCamera();
                        },
                        child: ClipOval(
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Color(0xFF000B17),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              Divider(
                thickness: 1.sp,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                    backgroundColor: Color(0xFF000B17),
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: Container(
                          width: 430.w,
                          height: 187.h,
                          decoration: ShapeDecoration(
                            color: Color(0xFF000B17),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.r),
                                topRight: Radius.circular(10.r),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text("Enter your name",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.sp,
                                      fontFamily: 'sfprodisplay',
                                      fontWeight: FontWeight.w400,
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        cursorColor: Colors.white,
                                        controller: name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            decorationThickness: 0.sp),
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          border: UnderlineInputBorder(),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.emoji_emotions_outlined,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        width: 100.w,
                                        height: 50.h,
                                        decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.r))),
                                        child: Center(
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.sp,
                                              fontFamily: 'sfprodisplay',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<ProfileUpdateBloc>(
                                                context)
                                            .add(FetchProfileUpdatevent(
                                          fullname: name.text,
                                          boolcheckingimage: false,
                                        ));
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        width: 100.w,
                                        height: 50.h,
                                        decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.r))),
                                        child: Center(
                                          child: Text("Save",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.sp,
                                                fontFamily: 'sfprodisplay',
                                                fontWeight: FontWeight.w400,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 80.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Text("Name",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.sp,
                                  fontFamily: 'sfprodisplay',
                                  fontWeight: FontWeight.w400,
                                )),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              width: 350.w,
                              child: Text(widget.profilename,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.sp,
                                    fontFamily: 'sfprodisplay',
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                height: 1.h,
                thickness: 1.sp,
                color: Colors.grey,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = !selected;
                  });
                  print("hello");
                },
                child: Container(
                  width: double.infinity,
                  height: 50.h,
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.password,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text("Create New Password",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 60.w,
                ),
                child: Divider(
                  height: 1.h,
                  thickness: 1.sp,
                  color: Colors.grey,
                ),
              ),
              selected
                  ? Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 80.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    cursorColor: Colors.grey,
                                    controller: oldpasswordcontroler,
                                    style: TextStyle(
                                        color: Colors.white,
                                        decorationThickness: 0.sp),
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 20.h, horizontal: 25.w),
                                      filled: true,
                                      fillColor: Colors.white
                                          .withOpacity(0.18000000715255737),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(20.r)),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        borderSide: BorderSide.none,
                                      ),
                                      errorBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(20.r)),
                                      hintText: 'Old Password',
                                      hintStyle: TextStyle(
                                        color: Color(0xFFA7B0BB),
                                        fontSize: 16.sp,
                                        fontFamily: 'sfprodisplay',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 9) {
                                        return 'Enter a valid password!....';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  TextFormField(
                                    obscureText: !isvisible,
                                    cursorColor: Colors.grey,
                                    controller: newpasswordcontroler,
                                    style: TextStyle(
                                        color: Colors.white,
                                        decorationThickness: 0.sp),
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 20.h, horizontal: 25.w),
                                        filled: true,
                                        fillColor: Colors.white
                                            .withOpacity(0.18000000715255737),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(20.r)),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          borderSide: BorderSide.none,
                                        ),
                                        errorBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(20.r)),
                                        hintText: 'New Password',
                                        hintStyle: TextStyle(
                                          color: Color(0xFFA7B0BB),
                                          fontSize: 16.sp,
                                          fontFamily: 'sfprodisplay',
                                          fontWeight: FontWeight.w400,
                                        ),
                                        suffixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isvisible = !isvisible;
                                              });
                                            },
                                            child: isvisible
                                                ? Icon(
                                                    BootstrapIcons.eye,
                                                    color: Color(0xFFA7B0BB),
                                                  )
                                                : Icon(BootstrapIcons.eye_slash,
                                                    color: Color(0xFFA7B0BB)))),
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 9) {
                                        return 'Enter a valid password!....';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      final isValid =
                                          _formKey.currentState!.validate();
                                      if (isValid) {
                                        BlocProvider.of<ProfileUpdateBloc>(
                                                context)
                                            .add(FetchProfileUpdatevent(
                                                oldpassword:
                                                    oldpasswordcontroler.text,
                                                newpassword:
                                                    newpasswordcontroler.text,
                                                boolcheckingimage: false));
                                      }
                                      _formKey.currentState?.save();
                                    },
                                    child: Container(
                                      width: 250.w,
                                      height: 70.h,
                                      decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.r))),
                                      child: Center(
                                        child: Text("Set Your Password ",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25.sp,
                                              fontFamily: 'sfprodisplay',
                                              fontWeight: FontWeight.w700,
                                            )),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        )),
      ),
    );
  }
}
