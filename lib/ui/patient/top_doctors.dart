import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/controller/get_top_doctors_controller.dart';
import 'package:graduation/models/doctor.dart';
import 'package:graduation/models/top_doctors.dart';
import 'package:graduation/provider/fav_provider.dart';
import 'package:graduation/widget/bookButton.dart';
import 'package:graduation/widget/viewProfileButton.dart';
import 'package:provider/provider.dart';

import '../booking/booking.dart';
import '../booking/view_doc_profile.dart';

class TopDoctors extends StatefulWidget {
  TopDoctors({Key? key}) : super(key: key);
  static const id = 'TopDoctors';

  @override
  State<TopDoctors> createState() => _TopDoctorsState();
}

class _TopDoctorsState extends State<TopDoctors> {
  bool _fav = false;

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
          AppLocalizations.of(context)!.top,
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
      body: FutureBuilder<List<TopDoctorsModel>>(
        future: GetTopDoctors().getTops(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Constant.primaryColor,
              ),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Container(
                      height: 168.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: Colors.grey, width: .5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20.r),
                                child: Stack(
                                  children: [
                                    Image.network(
                                      "http://ac7a1ae098-001-site1.etempurl.com${snapshot.data![index].doctorImage}",
                                      height: 138.h,
                                      width: 130.w,
                                      fit: BoxFit.cover,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          if (Provider.of<FavouriteProvider>(
                                                  context,
                                                  listen: false)
                                              .FavList
                                              .contains(
                                                  snapshot.data![index])) {
                                            Provider.of<FavouriteProvider>(
                                                    context,
                                                    listen: false)
                                                .RemoveDoc(
                                                    snapshot.data![index]);
                                          } else {
                                            Provider.of<FavouriteProvider>(
                                                    context,
                                                    listen: false)
                                                .addDoc(snapshot.data![index]);
                                          }
                                        },
                                        icon: Container(
                                          width: 21.w,
                                          height: 21.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3.r),
                                            color: Colors.white,
                                          ),
                                          child: Provider.of<FavouriteProvider>(
                                                      context)
                                                  .FavList
                                                  .contains(
                                                      snapshot.data![index])
                                              ? Icon(
                                                  Icons.bookmark,
                                                  size: 16,
                                                  color: Color(0xffF4C150),
                                                )
                                              : Icon(
                                                  Icons.bookmark_border,
                                                  size: 16,
                                                  color: Colors.grey,
                                                ),
                                        )),
                                  ],
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 18.w,
                                  bottom: 15.h,
                                  top: 30.h,
                                  right: 0),
                              // padding:
                              //     EdgeInsets.symmetric(horizontal: 18, vertical: 30),
                              child: Column(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data![index].doctorName,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    snapshot.data![index].specialityName,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14.h,
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
                                              " 4.5",
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
                                            snapshot.data![index].clinicAddress,
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
                                                    arguments:
                                                        snapshot.data![index]),
                                                builder: (context) => Booking(),
                                              ),
                                            );
                                          }),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
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
    );
  }
}
