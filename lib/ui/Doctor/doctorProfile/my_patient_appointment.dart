import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation/models/my_patient_appoitment.dart';

import '../../../constant/constant.dart';
import '../../../controller/get_my_patient_appoitment_controller.dart';
import '../../../widget/search_bar.dart';
import '../../../widget/viewProfileButton.dart';

class MyPatientAppointments extends StatefulWidget {
  const MyPatientAppointments({Key? key}) : super(key: key);
  static const id = 'MyAppointments';

  @override
  State<MyPatientAppointments> createState() => _MyPatientAppointmentsState();
}

class _MyPatientAppointmentsState extends State<MyPatientAppointments> {
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
          AppLocalizations.of(context)!.appointments,
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 39.h),
            child: SearchBarWidget(
                type: TextInputType.text,
                controller: _searchController,
                hint: AppLocalizations.of(context)!.search_patient,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                )),
          ),
          SizedBox(
            height: 8.h,
          ),
          Expanded(
            child: FutureBuilder<List<MyPatientAppointmentModel>>(
              future: GetMyPatientAppointment().getMyPatientAppointment(),
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
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 20.w),
                        child: Container(
                          height: 193.h,
                          width: 375.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: Colors.grey.shade300, width: .5),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 21.w,
                                    bottom: 38.h,
                                    top: 21.h,
                                    right: 0.w),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Image.network(
                                      'http://ac7a1ae098-001-site1.etempurl.com${snapshot.data![index].patientImage}',
                                      height: 135.h,
                                      width: 120.w,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 18.w,
                                    bottom: 16.h,
                                    top: 16.h,
                                    right: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${snapshot.data![index].patientName}',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.access_time_outlined,
                                              color: Color(0xff757575),
                                              size: 12,
                                            ),
                                            Text(
                                              ' ${snapshot.data![index].day}${snapshot.data![index].date}',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.grey.shade500,
                                                  fontSize: 12.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.location_pin,
                                              color: Color(0xff757575),
                                              size: 12,
                                            ),
                                            Text(
                                              ' ${snapshot.data![index].address}',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.grey.shade500,
                                                  fontSize: 12.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.email,
                                              color: Color(0xff757575),
                                              size: 12,
                                            ),
                                            SizedBox(
                                              width: 180.w,
                                              child: Text(
                                                ' ${snapshot.data![index].email}',
                                                style: GoogleFonts.poppins(
                                                    color: Colors.grey.shade500,
                                                    fontSize: 12.sp),
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
          ),
        ],
      ),
    );
  }
}
