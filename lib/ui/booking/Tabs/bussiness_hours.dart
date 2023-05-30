import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/constant.dart';
import '../../../controller/get_business_hours_api.dart';
import '../../../models/business_hours_model.dart';
import '../../../models/top_doctors.dart';

class BusinessHoursTabs extends StatefulWidget {
  BusinessHoursTabs({Key? key, required this.data}) : super(key: key);
  final TopDoctorsModel data;

  @override
  State<BusinessHoursTabs> createState() => _BusinessHoursTabsState();
}

class _BusinessHoursTabsState extends State<BusinessHoursTabs> {
  late TopDoctorsModel receivedData;
  @override
  void initState() {
    super.initState();
    receivedData = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.h),
            child: Container(
              height: 300.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.grey.shade400, width: .5),
              ),
              child: FutureBuilder<List<BusinessHoursModel>>(
                future: GetBusinessHours().getHours(id: receivedData.doctorId),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Constant.primaryColor,
                          ),
                        );
                      } else if (snapshot.hasData &&
                          snapshot.data!.isNotEmpty) {
                        return Padding(
                            padding: EdgeInsets.only(
                                top: 20.h,
                                left: 24.w,
                                right: 24.w,
                                bottom: 15.h),
                            child: Row(
                              children: [
                                Text(
                                  '${snapshot.data![index].day}',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.sp),
                                ),
                                Spacer(),
                                Text(
                                  '${snapshot.data![index].availableTime}',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff757575),
                                      fontSize: 18.sp),
                                ),
                              ],
                            ));
                      } else {
                        return Center(
                          child: Text('NO DATA'),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      // body: Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.h),
      //   child: Container(
      //     height: 500.h,
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(10.r),
      //       border: Border.all(color: Colors.grey.shade400, width: .5),
      //     ),
      //     child: FutureBuilder<List<BusinessHoursModel>>(
      //       future: GetBusinessHours().getHours(),
      //       builder: (context, snapshot) {
      //         return ListView.builder(
      //           itemCount: snapshot.data!.length,
      //           itemBuilder: (context, index) {
      //             if (snapshot.connectionState == ConnectionState.waiting) {
      //               return Center(
      //                 child: CircularProgressIndicator(
      //                   color: Constant.primaryColor,
      //                 ),
      //               );
      //             } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
      //               return Padding(
      //                   padding: EdgeInsets.only(
      //                       top: 20.h, left: 24.w, right: 24.w, bottom: 15.h),
      //                   child: Row(
      //                     children: [
      //                       Text(
      //                         '${snapshot.data![index].day}',
      //                         style: GoogleFonts.poppins(
      //                             fontWeight: FontWeight.w600, fontSize: 18.sp),
      //                       ),
      //                       Spacer(),
      //                       Text(
      //                         '${snapshot.data![index].availableTime}',
      //                         style: GoogleFonts.poppins(
      //                             fontWeight: FontWeight.normal,
      //                             color: Color(0xff757575),
      //                             fontSize: 18.sp),
      //                       ),
      //                     ],
      //                   ));
      //             } else {
      //               return Center(
      //                 child: Text('NO DATA'),
      //               );
      //             }
      //           },
      //         );
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}
