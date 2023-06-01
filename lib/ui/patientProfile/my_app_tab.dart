import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../constant/constant.dart';
import '../../../controller/get_my_appoitment_controller.dart';
import '../../../controller/get_specialities.dart';
import '../../../controller/get_top_doctors_controller.dart';
import '../../../models/my_appoitment.dart';
import '../../../models/specialities_model.dart';
import '../../../models/top_doctors.dart';

class MyAppTab extends StatefulWidget {
  const MyAppTab({Key? key}) : super(key: key);
  static const id = 'MyAppointmentPa';

  @override
  State<MyAppTab> createState() => _MyAppTabState();
}

class _MyAppTabState extends State<MyAppTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<MyAppData>>(
        future: GetMyAppointment().getMyAppointment(),
        builder: (context, snapshot) {
          print('my sna${snapshot.data}');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Constant.primaryColor,
              ),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                String trimmedString = snapshot.data![index].date.trim();
                DateTime dateTime = DateTime.parse(trimmedString);
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  child: Container(
                    height: 200.h,
                    width: 375.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border:
                          Border.all(color: Colors.grey.shade300, width: .5),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 21.w, bottom: 30.h, top: 24.h, right: 0.w),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.network(
                                'http://ac7a1ae098-001-site1.etempurl.com${snapshot.data![index].doctorImage}',
                                height: 148.h,
                                width: 120.w,
                                fit: BoxFit.cover,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 18.w, bottom: 16.h, top: 20.h, right: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${snapshot.data![index].doctorName}',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.date_range,
                                        color: Color(0xff757575),
                                        size: 14,
                                      ),
                                      Text(
                                        ' ${snapshot.data![index].day} ${DateFormat('dd-MM-yyyy').format(dateTime)}',
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey.shade500,
                                            fontSize: 14.sp),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.access_time_outlined,
                                        color: Color(0xff757575),
                                        size: 14,
                                      ),
                                      Text(
                                        ' ${snapshot.data![index].time}',
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey.shade500,
                                            fontSize: 14.sp),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.medical_services_outlined,
                                        color: Color(0xff757575),
                                        size: 14,
                                      ),
                                      SizedBox(
                                        width: 180.w,
                                        child: Text(
                                          ' ${snapshot.data![index].doctorSpecialty}',
                                          style: GoogleFonts.poppins(
                                              color: Colors.grey.shade500,
                                              fontSize: 14.sp),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Container(
                                    height: 29.5.h,
                                    width: 66.w,
                                    decoration: BoxDecoration(
                                        color: Constant.primaryColor
                                            .withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(2.r)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.remove_red_eye_outlined,
                                          size: 13,
                                          color: Constant.primaryColor,
                                        ),
                                        Text(
                                          'View',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13.sp,
                                            color: Constant.primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
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
