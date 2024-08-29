import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCar extends StatefulWidget {
  const MyCar({super.key});

  @override
  State<MyCar> createState() => _MyCarState();
}

class _MyCarState extends State<MyCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // backgroundColor: Color(0xFF000B17),
        appBar: AppBar(
          backgroundColor: Color(0xFF000B17),
          leading: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        body: DefaultTabController(
            length: 2,
            child: Column(children: [
              Container(
                width: 350,
                height: 50,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerHeight: 0,
                  indicator: BoxDecoration(
                    color: Color(0xFFFF0083),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelColor: Colors.white,
                  dividerColor: Colors.white,
                  tabs: [
                    Tab(
                      child: Text(
                        "Full Repayment",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Partial Repayment",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(children: [
                Container(
                 color: Colors.red,
                ),Container(
                      color: Colors.yellow,
                    ),
              ]))
            ])));
  }
}
