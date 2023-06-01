import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/controller/get_top_doctors_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../controller/get_blogs_api_controllers.dart';
import '../../../controller/get_specialities.dart';
import '../../../models/specialities_model.dart';
import '../../../models/top_doctors.dart';
import '../../../prefs/prefs.dart';
import '../../../provider/localization_provider.dart';
import '../../../widget/bookButton.dart';
import '../../../widget/drawer_widget.dart';
import '../../../widget/search_bar.dart';
import '../../../widget/see_all_row.dart';
import '../../../widget/viewProfileButton.dart';
import '../../booking/booking.dart';
import '../../booking/view_doc_profile.dart';
import '../../search_page.dart';
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
        padding: EdgeInsets.symmetric(
          horizontal: 32.w,
        ),
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
                    onPressed: () {
                      Navigator.pushNamed(context, SearchPage.id);
                    },
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
                FutureBuilder<List<SpecialitiesModel>>(
                  future: GetSpecialities().getSpec(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Constant.primaryColor,
                        ),
                      );
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return ConstrainedBox(
                        constraints:
                            BoxConstraints(maxHeight: 112.h, minWidth: 112.w),
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
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
                                      borderRadius:
                                          BorderRadius.circular(100.r),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xff6B7280)
                                              .withOpacity(0.06),
                                          spreadRadius: 3,
                                          blurRadius: 3,
                                          // changes position of shadow
                                        ),
                                      ],

                                      // border: Border.all(color: Colors.grey),
                                    ),
                                    child: Center(
                                        child: snapshot
                                                .data![index].image.isNotEmpty
                                            ? Image.network(
                                                "http://ac7a1ae098-001-site1.etempurl.com${snapshot.data![index].image}",
                                                height: 33.h,
                                                width: 33.w,
                                              )
                                            : null),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    snapshot.data![index].specialtyName,
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
                      );
                    } else {
                      return Center(
                        child: Text('NO DATA'),
                      );
                    }
                  },
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
                FutureBuilder<List<TopDoctorsModel>>(
                  future: GetTopDoctors().getTops(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Constant.primaryColor,
                        ),
                      );
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 280.h),
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 12),
                              width: 210.w,
                              height: 250.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                      color: Colors.grey.shade400,
                                      width: .5.w)),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: 16.w,
                                    top: 16.h,
                                    left: 16.w,
                                    bottom: 16.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        child: Image.network(
                                          'http://ac7a1ae098-001-site1.etempurl.com${snapshot.data![index].doctorImage}',
                                          height: 95.h,
                                          width: 185.w,
                                          fit: BoxFit.fill,
                                        )),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    Text(
                                      'Dr.${snapshot.data![index].doctorName}',
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      '${snapshot.data![index].specialityName}',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 23.5.h,
                                          width: 43.w,
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
                                                size: 12,
                                                color: Color(0xffF4C150),
                                              ),
                                              Text(
                                                '4.5',
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12.sp,
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
                                              size: 12,
                                              color: Colors.grey.shade400,
                                            ),
                                            Text(
                                              '${snapshot.data![index].clinicAddress}',
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.sp,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        viewProfileButton(
                                          text: AppLocalizations.of(context)!
                                              .view_profile,
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                settings: RouteSettings(
                                                    arguments:
                                                        snapshot.data![index]),
                                                builder: (context) =>
                                                    ViewDoctorProfile(),
                                              ),
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        BookButton(
                                            text: AppLocalizations.of(context)!
                                                .book,
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  settings: RouteSettings(
                                                      arguments: snapshot
                                                          .data![index]),
                                                  builder: (context) => Booking(
                                                      data: snapshot
                                                          .data![index]
                                                          .doctorId),
                                                ),
                                              );
                                            }),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: Text('NO DATA'),
                      );
                    }
                  },
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
                FutureBuilder(
                  future: GetBlogsApiController().getBlogs(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Constant.primaryColor,
                        ),
                      );
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 340.h),
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            String trimmedString =
                                snapshot.data![index].createdDate.trim();
                            DateTime dateTime = DateTime.parse(trimmedString);

                            return Container(
                              margin: EdgeInsets.only(right: 12.w),
                              width: 218.w,
                              height: 320.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                      color: Colors.grey.shade400,
                                      width: .5.w)),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: 16.w,
                                    top: 16.h,
                                    left: 16.w,
                                    bottom: 16.h),
                                // padding: EdgeInsets.all(14.r),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        child: Image.network(
                                          'http://ac7a1ae098-001-site1.etempurl.com${snapshot.data![index].blogImage}',
                                          height: 95.h,
                                          width: 185.w,
                                          fit: BoxFit.cover,
                                        )),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    Text(
                                      '${snapshot.data![index].title}',
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                child: Image.network(
                                                  'http://ac7a1ae098-001-site1.etempurl.com${snapshot.data![index].doctorImage}',
                                                  height: 20.h,
                                                  width: 20.w,
                                                  fit: BoxFit.cover,
                                                )),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(
                                              'Dr.${snapshot.data![index].name}',
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
                                              '${DateFormat('dd-MM-yyyy').format(dateTime)}',
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
                                      height: 50.h,
                                      child: Text(
                                        overflow: TextOverflow.fade,
                                        '${snapshot.data![index].content}',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    viewProfileButton(
                                      text: AppLocalizations.of(context)!
                                          .read_more,
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: Text('NO DATA'),
                      );
                    }
                  },
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
                      SharedPrefController().clear();

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
