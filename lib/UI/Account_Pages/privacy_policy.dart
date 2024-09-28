import 'package:drive2goo/Bloc/Profile/Privacypolicy/privacy_policy_bloc.dart';
import 'package:drive2goo/Repostory/ModelClass/Privacy_policy/PrivacyPolicyModelClass.dart';
import 'package:drive2goo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  void initState() {
    BlocProvider.of<PrivacyPolicyBloc>(context).add(FetchPrivacyPolicy());
    // TODO: implement initState
    super.initState();
  }
  late PrivacyPolicyModelClass privacypolicydata;


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
// email code
void sendemail()async{
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path:privacypolicydata.contactInfo!.email.toString(),
    query: encodeQueryParameters(<String, String>{
      'subject': '',
    }),
  );  if(await canLaunchUrl(emailLaunchUri)){
    await launchUrl(emailLaunchUri);
  }else{
    print("Could not email");
  }


  launchUrl(emailLaunchUri);

}
//
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF000B17),
      body: SafeArea(

        child: Padding(

          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: BlocBuilder<PrivacyPolicyBloc, PrivacyPolicyState>(
            builder: (context, state) {
              if(state is PrivacyPolicyBlocLoading){
                return Center( child: CircularProgressIndicator(),);
              }
              if(state is PrivacyPolicyBlocError){
                return Center(child: Text("Error"),);
              }
              if(state is PrivacyPolicyBlocLoaded){
                privacypolicydata= BlocProvider.of<PrivacyPolicyBloc>(context).privacyPolicyModelClass;

                String effectivedate=dateConvert(privacypolicydata.effectiveDate.toString());
                String lastuploaddate=dateConvert(privacypolicydata.lastUpdated.toString());
              return SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 20.h,),
                    Text(privacypolicydata.title.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(height: 15.h,),
                    Row(
                      children: [
                        Text("Effective Date      : ",
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
                    SizedBox(height: 10.h,),
                    Row(
                      children: [
                        Text("Last Updated       : ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w700,
                            )),
                        Text(lastuploaddate.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Row(
                      children: [
                        Text("Version  : ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w700,
                            )),
                        Text(privacypolicydata.version.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    SizedBox(height: 8.h,),
                    Text(privacypolicydata.content.toString(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w500,
                        )),
                
                    SizedBox(height: 12.h,),
                    Text("Information We Collect",
                        style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: 18.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(height: 10.h,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Personal Information  :  ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w700,
                            )),
                        Expanded(
                          child: Text( privacypolicydata.informationWeCollect!.personalInfo.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Vehicle Information  :  ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w700,
                            )),
                        Expanded(
                          child: Text( privacypolicydata.informationWeCollect!.vehicleInfo.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Technical Information  :  ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w700,
                            )),
                        Expanded(
                          child: Text( privacypolicydata.informationWeCollect!.technicalInfo.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text("Usage Data  :  ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w700,
                            )),
                
                        Expanded(
                          child: Text( privacypolicydata.informationWeCollect!.usageData.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                
                    SizedBox(height: 12.h,),
                    Text("How We Use Information",
                        style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: 18.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(height: 10.h,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Service Delivery  :  ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w700,
                            )),
                        Expanded(
                          child: Text( privacypolicydata.howWeUseInfo!.serviceDelivery.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Personalization  :  ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w700,
                            )),
                        Expanded(
                          child: Text( privacypolicydata.howWeUseInfo!.personalization.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Communication  :  ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w700,
                            )),
                        Expanded(
                          child: Text( privacypolicydata.howWeUseInfo!.communication.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Legal Obligations  :  ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w700,
                            )),
                
                        Expanded(
                          child: Text( privacypolicydata.howWeUseInfo!.legalObligations.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                
                    SizedBox(height: 12.h,),
                    Text("How We Share Information",
                        style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: 18.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(height: 10.h,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Service Providers  :  ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w700,
                            )),
                        Expanded(
                          child: Text( privacypolicydata.howWeShareInfo!.serviceProviders.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Legal Compliance  :  ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w700,
                            )),
                        Expanded(
                          child: Text( privacypolicydata.howWeShareInfo!.legalCompliance.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Business Transfers  :  ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w700,
                            )),
                        Expanded(
                          child: Text( privacypolicydata.howWeShareInfo!.businessTransfers.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                
                    SizedBox(height: 12.h,),
                    Text("Yousr Rights",
                        style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: 18.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(height: 10.h,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Access and Correction  :  ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w700,
                            )),
                        Expanded(
                          child: Text( privacypolicydata.userRights!.accessAndCorrection.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Deletion  :  ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w700,
                            )),
                        Expanded(
                          child: Text( privacypolicydata.userRights!.deletion.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Marketing Opt-Out  :  ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w700,
                            )),
                        Expanded(
                          child: Text( privacypolicydata.userRights!.marketingOptOut.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Data Portability  :  ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w700,
                            )),
                
                        Expanded(
                          child: Text( privacypolicydata.userRights!.dataPortability.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h,),
                
                    Text("Data Security",
                        style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: 18.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(height: 8.h,),
                    Text(privacypolicydata.dataSecurity.toString(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w500,
                        )),
                
                    SizedBox(height: 12.h,),
                    Text("Data Retention",
                        style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: 18.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(height: 8.h,),
                    Text(privacypolicydata.retentionPolicy.toString(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w500,
                        )),
                
                    SizedBox(height: 12.h,),
                    Text("Cookies Policy",
                        style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: 18.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(height: 8.h,),
                    Text(privacypolicydata.cookiesPolicy.toString(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w500,
                        )),
                
                    SizedBox(height: 12.h,),
                    Text("Children’s Privacy",
                        style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: 18.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(height: 8.h,),
                    Text(privacypolicydata.childrenPrivacy.toString(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w500,
                        )),

                    SizedBox(height: 12.h,),
                    Text("Changes to This Policy",
                        style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: 18.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(height: 8.h,),
                    Text(privacypolicydata.changesToPolicy.toString(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w500,
                        )),

                    SizedBox(height: 12.h,),
                    Text("Contact Us",
                        style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: 18.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(height: 8.h,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email  :  ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w700,
                            )),
                        Expanded(
                          child: GestureDetector(onTap: (){
                            sendemail();
                          },
                            child: Text( privacypolicydata.contactInfo!.email.toString(),
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16.sp,
                                  fontFamily: 'sfprodisplay',
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone  :  ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w700,
                            )),
                        Expanded(
                          child: GestureDetector(onTap: (){
                            launch("tel:${privacypolicydata.contactInfo!.phone.toString()}");
                          },
                            child: Text(
                                privacypolicydata.contactInfo!.phone.toString(),
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16.sp,
                                  fontFamily: 'sfprodisplay',
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text("Address  :  ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w700,
                            )),
                        Expanded(
                          child: Text( privacypolicydata.contactInfo!.address.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
                                fontFamily: 'sfprodisplay',
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h,)
                
                
                
                  ],),
              );
              }else{
                return SizedBox();
              }
            },
          ),
        ),
      ),

    );
  }
}
