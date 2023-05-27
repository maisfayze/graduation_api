import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';

import 'Tabs/overview.dart';

class ViewDoctorProfile extends StatefulWidget {
  const ViewDoctorProfile({Key? key}) : super(key: key);
  static const id = 'ViewDoctorProfile';

  @override
  State<ViewDoctorProfile> createState() => _ViewDoctorProfileState();
}

class _ViewDoctorProfileState extends State<ViewDoctorProfile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
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
          'Doctor Profile',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
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
            Padding(
              padding: EdgeInsets.only(
                  top: 20.h, left: 24.w, right: 24.w, bottom: 15.h),
              child: Container(
                height: 168.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Colors.grey.shade400, width: .5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Stack(
                            children: [
                              Image.network(
                                'https://images.pexels.com/photos/5327585/pexels-photo-5327585.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                height: 138.h,
                                width: 141.w,
                                fit: BoxFit.cover,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Container(
                                    width: 21.w,
                                    height: 21.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.r),
                                      color: Colors.white,
                                    ),
                                    child: Icon(
                                      Icons.bookmark_border,
                                      size: 16,
                                      color: Colors.black45,
                                    ),
                                  )),
                            ],
                          )),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 18.w, top: 14.h, right: 0),
                        // padding:
                        //     EdgeInsets.symmetric(horizontal: 18, vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'mais',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'Dentist',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                color: Color(0xff20C0F3),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            RatingBar.builder(
                              initialRating: 3.5,
                              minRating: 1,
                              itemSize: 14,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 2.0.w),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Color(0xffF4C150),
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 10,
                                  color: Colors.grey.shade400,
                                ),
                                Text(
                                  'Gaza',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.sp,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 42.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RowWidget(
                    first: '99%',
                    icons: Icons.bookmark_border,
                  ),
                  RowWidget(
                    first: '35 Feedback',
                    icons: Icons.messenger_outline,
                  ),
                  RowWidget(
                    first: '100\$ per hour',
                    icons: Icons.money,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            TabBar(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              indicatorPadding: EdgeInsets.symmetric(horizontal: 10.0.w),
              // labelPadding: EdgeInsets.symmetric(horizontal: 10.0.w),
              isScrollable: true,
              // labelPadding: EdgeInsets.symmetric(horizontal: 0.0.w),
              unselectedLabelColor: Colors.black,
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 1,
                    color: Constant.primaryColor,
                  ),
                  insets:
                      EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h)),
              indicatorColor: Constant.primaryColor,
              labelStyle:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              labelColor: Constant.primaryColor,
              tabs: [
                Tab(
                  text: 'Overview',
                ),
                Tab(
                  text: 'Reviews',
                ),
                Tab(
                  text: 'Business Hours',
                ),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [OverViewTab(), Text('two'), Text('three')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({
    super.key,
    required this.first,
    required this.icons,
  });

  final String first;

  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icons,
          color: Color(0xff4E4852),
          size: 12,
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          '$first',
          style: GoogleFonts.poppins(color: Color(0xff4E4852), fontSize: 13.sp),
        )
      ],
    );
  }
}
