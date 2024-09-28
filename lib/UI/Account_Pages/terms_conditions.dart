import 'package:drive2goo/Bloc/Profile/Terms_Condition/terms_condition_bloc.dart';
import 'package:drive2goo/Repostory/ModelClass/Terms_Condition/TermsConditionModelClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class TermsCondition extends StatefulWidget {
  const TermsCondition({super.key});

  @override
  State<TermsCondition> createState() => _TermsConditionState();
}

class _TermsConditionState extends State<TermsCondition> {
  @override
  void initState() {
    BlocProvider.of<TermsConditionBloc>(context).add(FetchTermsConditionevent());
    // TODO: implement initState
    super.initState();
  }
  late TermsConditionModelClass termsconditiondata;
  // iso date convert into
  String dateConvert(String iso) {
    String isoString = iso;

    // Convert ISO string to DateTime
    DateTime dateTime = DateTime.parse(isoString);
    // Format DateTime to a specific format
    String formattedDate = DateFormat('MMM,dd,yyyy').format(dateTime);

    print(formattedDate);
    return formattedDate;// Output: 2024-09-03 – 14:30
  }
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000B17),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SafeArea(
          child: BlocBuilder<TermsConditionBloc, TermsConditionState>(
  builder: (context, state) {
    if(state is TermsConditionBlocLoading){
      return Center(child: CircularProgressIndicator(),);
    }
    if(state is TermsConditionBlocError){
      return Center(child: Text("Error"),);
    }
    if(state is TermsConditionBlocLoaded) {
      termsconditiondata = BlocProvider
          .of<TermsConditionBloc>(context)
          .termsConditionModelClass;
String effectivedate=dateConvert(termsconditiondata.effectiveDate.toString());
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 25.h,),
        Text("Terms and Conditions",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.sp,
              fontFamily: 'sfprodisplay',
              fontWeight: FontWeight.w700,
            )),
        SizedBox(height: 10.h,),
        Text(
            termsconditiondata.content.toString(),
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16.sp,
              fontFamily: 'sfprodisplay',
              fontWeight: FontWeight.w500,
            )),
        SizedBox(height: 8.h,),
        Row(
          children: [
            Text("Effective Date  :  ",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.sp,
                  fontFamily: 'sfprodisplay',
                  fontWeight: FontWeight.w700,
                )),
            Text(effectivedate.toString(),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.sp,
                  fontFamily: 'sfprodisplay',
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
          SizedBox(height: 8.h,),
          Row(
            children: [
              Text("Version  :  ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.sp,
                    fontFamily: 'sfprodisplay',
                    fontWeight: FontWeight.w700,
                  )),
              Text(termsconditiondata.version.toString(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.sp,
                    fontFamily: 'sfprodisplay',
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        SizedBox(height: 15.h,),

        Text(termsconditiondata.sections![0].sectionTitle.toString(),
            style: TextStyle(
              color: Colors.grey.shade200,
              fontSize: 19.sp,
              fontFamily: 'sfprodisplay',
              fontWeight: FontWeight.w700,
            )),
        SizedBox(height: 10.h,),
        Text(
            termsconditiondata.sections![0].sectionContent.toString(),
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16.sp,
              fontFamily: 'sfprodisplay',
              fontWeight: FontWeight.w500,
            )),
        SizedBox(height: 15.h,),
        Text(termsconditiondata.sections![1].sectionTitle.toString(),
            style: TextStyle(
              color: Colors.grey.shade200,
              fontSize: 19.sp,
              fontFamily: 'sfprodisplay',
              fontWeight: FontWeight.w700,
            )),
        SizedBox(height: 10.h,),
        Text(
            termsconditiondata.sections![1].sectionContent.toString(),
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16.sp,
              fontFamily: 'sfprodisplay',
              fontWeight: FontWeight.w500,
            )),
      ],);
    }else{
      return SizedBox();
    }
  },
),
        ),),
      ),
    );
  }
}
