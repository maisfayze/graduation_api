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

class MyAppointment extends StatefulWidget {
  const MyAppointment({Key? key}) : super(key: key);
  static const id = 'MyAppointmentPa';

  @override
  State<MyAppointment> createState() => _MyAppointmentState();
}

class _MyAppointmentState extends State<MyAppointment> {
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
          'My Appointment',
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
      // body: Padding(
      //   padding: EdgeInsets.symmetric(
      //     horizontal: 24.w,
      //   ),
      //   child: FadeInLeft(
      //     child: FutureBuilder<List<MyAppData>>(
      //       future: GetMyAppointment().getMyAppointment(),
      //       builder: (context, snapshot) {
      //         if (snapshot.connectionState == ConnectionState.waiting) {
      //           return Center(
      //             child: CircularProgressIndicator(
      //               color: Constant.primaryColor,
      //             ),
      //           );
      //         } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
      //           return ListView.builder(
      //             shrinkWrap: true,
      //             itemCount: snapshot.data!.length,
      //             scrollDirection: Axis.vertical,
      //             itemBuilder: (context, index) {
      //               return Container(
      //                 height: 150,
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.start,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     ClipRRect(
      //                         borderRadius: BorderRadius.circular(10.r),
      //                         child: Image.network(
      //                           'http://ac7a1ae098-001-site1.etempurl.com${snapshot.data![index].doctorImage}',
      //                           height: 95.h,
      //                           width: 185.w,
      //                           fit: BoxFit.fill,
      //                         )),
      //                     SizedBox(
      //                       height: 16.h,
      //                     ),
      //                     Column(
      //                       children: [
      //                         Text(
      //                           'Dr.${snapshot.data![index].doctorName}',
      //                           overflow: TextOverflow.ellipsis,
      //                           style: GoogleFonts.poppins(
      //                             fontWeight: FontWeight.w600,
      //                             fontSize: 14.sp,
      //                             color: Colors.black,
      //                           ),
      //                         ),
      //                         Text(
      //                           '${snapshot.data![index].doctorName}',
      //                           style: GoogleFonts.poppins(
      //                             fontWeight: FontWeight.w400,
      //                             fontSize: 14.sp,
      //                             color: Colors.grey,
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           height: 12.h,
      //                         ),
      //                         Row(
      //                           children: [
      //                             Container(
      //                               height: 23.5.h,
      //                               width: 43.w,
      //                               decoration: BoxDecoration(
      //                                   color: Constant.primaryColor
      //                                       .withOpacity(0.2),
      //                                   borderRadius:
      //                                       BorderRadius.circular(2.r)),
      //                               child: Row(
      //                                 mainAxisAlignment:
      //                                     MainAxisAlignment.spaceEvenly,
      //                                 children: [
      //                                   Icon(
      //                                     Icons.star,
      //                                     size: 12,
      //                                     color: Color(0xffF4C150),
      //                                   ),
      //                                   Text(
      //                                     '4.5',
      //                                     style: GoogleFonts.poppins(
      //                                       fontWeight: FontWeight.w600,
      //                                       fontSize: 12.sp,
      //                                       color: Constant.primaryColor,
      //                                     ),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                             SizedBox(
      //                               width: 30.w,
      //                             ),
      //                             Row(
      //                               mainAxisAlignment:
      //                                   MainAxisAlignment.spaceEvenly,
      //                               children: [
      //                                 Icon(
      //                                   Icons.location_on,
      //                                   size: 12,
      //                                   color: Colors.grey.shade400,
      //                                 ),
      //                                 Text(
      //                                   '${snapshot.data![index].doctorSpecialty}',
      //                                   style: GoogleFonts.poppins(
      //                                     fontWeight: FontWeight.w600,
      //                                     fontSize: 12.sp,
      //                                     color: Colors.grey.shade400,
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                           ],
      //                         ),
      //                       ],
      //                     ),
      //                     SizedBox(
      //                       height: 14.h,
      //                     ),
      //                   ],
      //                 ),
      //               );
      //             },
      //           );
      //         } else {
      //           return Center(
      //             child: Text('NO DATA'),
      //           );
      //         }
      //       },
      //     ),
      //   ),
      // ),

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
                                height: 144.h,
                                width: 120.w,
                                fit: BoxFit.cover,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 18.w, bottom: 16.h, top: 30.h, right: 0),
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
                                    height: 12.h,
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
                                    height: 12.h,
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
                                    height: 12.h,
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
