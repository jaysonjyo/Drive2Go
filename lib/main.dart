import 'package:drive2goo/Bloc/Profile/Feedback/feedback_bloc.dart';
import 'package:drive2goo/UI/Others/Splash.dart';
import 'package:drive2goo/UI/Others/Start_Indro.dart';
import 'package:drive2goo/UI/Others/notification_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Bloc/Authantication/Sign_In_Bloc/sign_in_bloc.dart';
import 'Bloc/Authantication/Sign_up_Bloc/sign_up_bloc.dart';
import 'Bloc/Buy/All_buyCar_Bloc/all_buycar_bloc.dart';
import 'Bloc/Buy/Allcar_Bloc/allcar_bloc.dart';
import 'Bloc/Buy/Buy_create_order/buy_create_order_bloc.dart';
import 'Bloc/Buy/Buy_vechile_search/buysearch_bloc.dart';
import 'Bloc/Buy/Buycar_order/buyorder_bloc.dart';
import 'Bloc/Buy/Nearby_Buy_Car_Bloc/nearby_buy_bloc.dart';
import 'Bloc/Profile/Helpcenter/chat/chat_bloc.dart';
import 'Bloc/Profile/Helpcenter/post/helpcenterpost_bloc.dart';
import 'Bloc/Rent/Nearby_Bloc/nearby_car_bloc.dart';
import 'Bloc/Rent/RentOrder_Bloc/rent_car_order_bloc.dart';
import 'Bloc/Rent/Rent_Car_Bloc/rentcar_bloc.dart';
import 'Bloc/Rent/Rentcarsearch_Bloc/reant_search_bloc.dart';
import 'UI/notification_api.dart';
import 'firebase_options.dart';

TextEditingController pickuplocationcontroller = TextEditingController();
TextEditingController returnlocationcontroller = TextEditingController();
final navigatorKey=GlobalKey<NavigatorState>();

Future <void> main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options:
    DefaultFirebaseOptions.currentPlatform,
  );
   await FirebaseApi().initNotificatios();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SignUpBloc(),
              ),
              BlocProvider(
                create: (context) => SignInBloc(),
              ),
              BlocProvider(
                create: (context) => NearbyCarBloc(),
              ),BlocProvider(
                create: (context) => RentcarBloc(),
              ),
              BlocProvider(
                create: (context) => AllcarBloc(),
              ),
              BlocProvider(
                create: (context) => RentCarOrderBloc(),
              ),
              BlocProvider(
                create: (context) => ReantSearchBloc(),
              ),
              BlocProvider(
                create: (context) => NearbyBuyBloc(),
              ),
              BlocProvider(
                create: (context) => AllBuycarBloc(),
              ),
              BlocProvider(
                create: (context) => BuyCreateOrderBloc(),
              ),
              BlocProvider(
                create: (context) => BuyorderBloc(),
              ),
              BlocProvider(
                create: (context) => BuysearchBloc(),
              ),
              BlocProvider(
                create: (context) => HelpcenterpostBloc(),
              ),
              BlocProvider(
                create: (context) => ChatBloc(),
              ),
              BlocProvider(
                create: (context) => FeedbackBloc(),
              ),
            ],
            child: MaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                // This is the theme of your application.
                //
                // TRY THIS: Try running your application with "flutter run". You'll see
                // the application has a purple toolbar. Then, without quitting the app,
                // try changing the seedColor in the colorScheme below to Colors.green
                // and then invoke "hot reload" (save your changes or press the "hot
                // reload" button in a Flutter-supported IDE, or press "r" if you used
                // the command line to start the app).
                //
                // Notice that the counter didn't reset back to zero; the application
                // state is not lost during the reload. To reset the state, use hot
                // restart instead.
                //
                // This works for code too, not just values: Most code changes can be
                // tested with just a hot reload.
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: Splash(),
              routes: {
                NotificationScreen.route:(context)=>NotificationScreen()
              },
            ),
          );
        });
  }
}


