import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';
import 'package:provider/provider.dart';

import '../../../models/spec.dart';
import '../../../provider/localization_provider.dart';
import '../../../widget/bookButton.dart';
import '../../../widget/drawer_widget.dart';
import '../../../widget/search_bar.dart';
import '../../../widget/see_all_row.dart';
import '../../../widget/viewProfileButton.dart';
import '../blogs.dart';
import '../specialities.dart';
import '../top_doctors.dart';

class PatientHome extends StatefulWidget {
  const PatientHome({Key? key}) : super(key: key);

  @override
  State<PatientHome> createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {
  late TextEditingController _searchController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.dispose();
    super.dispose();
  }

  final List<SpecialitiesModel> _specialities = <SpecialitiesModel>[
    SpecialitiesModel(img: 'images/den.png', title: 'Dentist'),
    SpecialitiesModel(img: 'images/cardiology.png', title: 'Cardiology'),
    SpecialitiesModel(img: 'images/Dermatology.png', title: 'Dermatology'),
    SpecialitiesModel(img: 'images/Hematology.png', title: 'Hematology'),
    SpecialitiesModel(img: 'images/Obstetrics.png', title: 'Obstetrics'),
    SpecialitiesModel(img: 'images/Orthopedics.png', title: 'Orthopedics'),
    SpecialitiesModel(img: 'images/Urology.png', title: 'Urology'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w),
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 24,
                ),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 23.w,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
                size: 24,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: FadeInLeft(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 214.w,
                  child: Text(
                    AppLocalizations.of(context)!
                        .find_the_best_clinic_and_doctor,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SearchBarWidget(
                    type: TextInputType.text,
                    controller: _searchController,
                    hint: AppLocalizations.of(context)!.search_clinic_doctor,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    )),
                SizedBox(
                  height: 16.h,
                ),
                SeeALLRow(
                  title: AppLocalizations.of(context)!.specialities,
                  onPressed: () {
                    Navigator.pushNamed(context, Specialities.id);
                  },
                ),
                ConstrainedBox(
                  constraints:
                      BoxConstraints(maxHeight: 108.h, minWidth: 108.h),
                  child: ListView.builder(
                    itemCount: _specialities.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 15.w),
                        width: 80.w,
                        height: 15.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 77.w,
                              height: 77.h,
                              constraints: BoxConstraints(
                                  maxHeight: 77.h, maxWidth: 77.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff6B7280).withOpacity(0.06),
                                    spreadRadius: 3,
                                    blurRadius: 3,
                                    // changes position of shadow
                                  ),
                                ],

                                // border: Border.all(color: Colors.grey),
                              ),
                              child: Center(
                                  child: Image.asset(
                                "${_specialities[index].img}",
                                height: 33.h,
                                width: 33.w,
                              )),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              _specialities[index].title,
                              style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                //top
                SeeALLRow(
                  title: AppLocalizations.of(context)!.top,
                  onPressed: () {
                    Navigator.pushNamed(context, TopDoctors.id);
                  },
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 260.h),
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 12),
                        width: 163.w,
                        height: 250.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                                color: Colors.grey.shade400, width: .5.w)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: 16.w, top: 16.h, left: 16.w, bottom: 16.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Image.asset(
                                    'images/doctorw.jpg',
                                    height: 95.h,
                                    width: 131.w,
                                    fit: BoxFit.cover,
                                  )),
                              SizedBox(
                                height: 16.h,
                              ),
                              Text(
                                'Dr.Ruby Perin',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Dentist',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 13.5.h,
                                    width: 33.w,
                                    decoration: BoxDecoration(
                                        color: Constant.primaryColor
                                            .withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(2.r)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 8,
                                          color: Color(0xffF4C150),
                                        ),
                                        Text(
                                          '4.7',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 8.sp,
                                            color: Constant.primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                              SizedBox(
                                height: 14.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  viewProfileButton(
                                    text: AppLocalizations.of(context)!
                                        .view_profile,
                                    onPressed: () {},
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  BookButton(
                                      text: AppLocalizations.of(context)!.book,
                                      onPressed: () {}),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                //blogs
                SeeALLRow(
                  title: AppLocalizations.of(context)!.blogs,
                  onPressed: () {
                    Navigator.pushNamed(context, Blogs.id);
                  },
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 340.h),
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 12.w),
                        width: 211,
                        height: 326,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                                color: Colors.grey.shade400, width: .5.w)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: 16.w, top: 16.h, left: 16.w, bottom: 16.h),
                          // padding: EdgeInsets.all(14.r),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Image.network(
                                    'https://blog.feedspot.com/wp-content/uploads/2018/04/Doctor-Blogs.jpg',
                                    height: 95.h,
                                    width: 179.w,
                                    fit: BoxFit.cover,
                                  )),
                              SizedBox(
                                height: 16.h,
                              ),
                              Text(
                                'What We Know So Far About COVID-19 Transmission ?',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          child: Image.asset(
                                            'images/doctorw.jpg',
                                            height: 20.h,
                                            width: 20.w,
                                            fit: BoxFit.cover,
                                          )),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        'Dr. Linda toben',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10.sp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.watch_later_outlined,
                                        size: 10,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        '3. Jan .2023',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10.sp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              SizedBox(
                                width: 183.w,
                                height: 70.h,
                                child: Text(
                                  overflow: TextOverflow.fade,
                                  'Many of us woke up today to the shocking news that the President Donald Trump and first ',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              viewProfileButton(
                                text: AppLocalizations.of(context)!.read_more,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        width: 266.w,
        backgroundColor: Constant.primaryColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Column(
            // Important: Remove any padding from the ListView.
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerWidget(
                img: 'images/Blo.png',
                onPressed: () {},
                title: AppLocalizations.of(context)!.blogs,
              ),
              DrawerWidget(
                img: 'images/about.png',
                onPressed: () {},
                title: AppLocalizations.of(context)!.about_Us,
              ),
              DrawerWidget(
                img: 'images/price.png',
                onPressed: () {},
                title: AppLocalizations.of(context)!.pricing_plan,
              ),
              DrawerWidget(
                img: 'images/faqs.png',
                onPressed: () {},
                title: AppLocalizations.of(context)!.asked_questions,
              ),
              DrawerWidget(
                img: 'images/client.png',
                onPressed: () {},
                title: AppLocalizations.of(context)!.client_Sayings,
              ),
              DrawerWidget(
                img: 'images/trans.png',
                onPressed: () {
                  Provider.of<LocalizationProvider>(context, listen: false)
                      .changLang();
                },
                title: AppLocalizations.of(context)!.change_Language,
              ),
              DrawerWidget(
                img: 'images/comp.png',
                onPressed: () {},
                title: AppLocalizations.of(context)!.complaints_box,
              ),
              SizedBox(
                height: 50.h,
              ),
              ElevatedButton(
                onPressed: () {
                  buildShowDialog(context);
                },
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    minimumSize: Size(131.w, 53.h),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.r),
                    )),
                child: Text(
                  AppLocalizations.of(context)!.log_out,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // titlePadding: EdgeInsets.symmetric(horizontal: 34),
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.log_out_of_your_account,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0.r)),
            // actionsPadding: EdgeInsets.only(bottom: 34),
            actions: [
              Column(
                children: [
                  Divider(),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    onTap: () {
                      SystemNavigator.pop();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.log_out,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: Color(0xffDE1C1C),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.cancel,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ],
          );
        });
  }
}
