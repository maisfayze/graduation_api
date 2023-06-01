import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/constant.dart';
import '../../provider/fav_provider.dart';
import '../patient/PatientBtn/my_appoitment_for_patient.dart';
import 'my_app_tab.dart';

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({Key? key}) : super(key: key);
  static const id = 'PatientDashboard';

  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black,
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Dashboard',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FadeIn(
        child: Column(
          children: [
            //profile card
            TabBar(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0.w,
              ),
              indicatorPadding:
                  EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 5.h),
              labelPadding:
                  EdgeInsets.symmetric(horizontal: 50.0.w, vertical: 10.h),
              isScrollable: true,

              // labelPadding: EdgeInsets.symmetric(horizontal: 0.0.w),
              unselectedLabelColor: Colors.black,
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 2,
                    color: Constant.primaryColor,
                  ),
                  insets:
                      EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 0.h)),
              indicatorColor: Constant.primaryColor,
              labelStyle: GoogleFonts.poppins(
                  fontSize: 18.sp, fontWeight: FontWeight.bold),
              labelColor: Constant.primaryColor,
              unselectedLabelStyle: GoogleFonts.poppins(
                  fontSize: 18.sp, fontWeight: FontWeight.normal),
              tabs: [
                Tab(
                  text: 'Appoitments',
                ),
                Tab(
                  text: 'Invoices',
                ),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            SizedBox(
              height: 12.h,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  MyAppTab(),
                  Text('two'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
