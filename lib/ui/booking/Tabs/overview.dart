import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/models/top_doctors.dart';
import 'package:graduation/ui/chat/private-chat.dart';
import 'package:graduation/widget/customPrimaryButton.dart';

import '../../../constant/constant.dart';
import '../../../controller/get_overview.dart';
import '../../../models/ChatDataModel.dart';
import '../../../models/overview.dart';
import '../booking.dart';
import '../booking2.dart';

class OverViewTab extends StatefulWidget {
  OverViewTab({Key? key, required this.data}) : super(key: key);
  final TopDoctorsModel data;
  @override
  State<OverViewTab> createState() => _OverViewTabState();
}

class _OverViewTabState extends State<OverViewTab> {
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
      body: FutureBuilder<List<OverviewModel>>(
        future: GetOverview().getOverView(id: receivedData.doctorId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Constant.primaryColor,
              ),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 22.h),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //about
                        Text(
                          'About Me',
                          style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff272B41)),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        //data from api
                        Text(
                          snapshot.data![index].aboutMe,
                          style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff6B7280)),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        //edu
                        Text(
                          'Education',
                          style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff272B41)),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        //data from api
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data![index].college,
                              style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff2E3842)),
                            ),
                            Text(
                              '${snapshot.data![index].degree}',
                              style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff6B7280)),
                            ),
                            Text(
                              '${snapshot.data![index].yearOfCompletion}',
                              style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff6B7280)),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'Work & Experience',
                          style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff272B41)),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        //data from api
                        Text(
                          '${snapshot.data![index].hospitalName}',
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff2E3842)),
                        ),
                        Text(
                          '${snapshot.data![index].hospitalFrom}-${snapshot.data![index].hospitalTo}',
                          style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff6B7280)),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'Awards',
                          style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff272B41)),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        //data from api
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${snapshot.data![index].awards}',
                              style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff6B7280)),
                            ),
                            Text(
                              '${snapshot.data![index].awardsYear}',
                              style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff20C0F3)),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'Services',
                          style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff272B41)),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        //data from api
                        Text(
                          '${snapshot.data![index].doctorServices}',
                          style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff6B7280)),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        // Text(
                        //   'Specializations',
                        //   style: GoogleFonts.poppins(
                        //       fontSize: 18.sp,
                        //       fontWeight: FontWeight.bold,
                        //       color: Color(0xff272B41)),
                        // ),
                        // SizedBox(
                        //   height: 10.h,
                        // ),
                        // //data from api
                        // Text(
                        //   '${snapshot.data![index].specialtyName}',
                        //   style: GoogleFonts.poppins(
                        //       fontSize: 14.sp,
                        //       fontWeight: FontWeight.normal,
                        //       color: Color(0xff6B7280)),
                        // ),
                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        Text(
                          'Specializations',
                          style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff272B41)),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        //data from api
                        Text(
                          '${snapshot.data![index].specialtyName} - ${snapshot.data![index].designation}',
                          style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff6B7280)),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),

                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0.w, right: 50.w),
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  ChatDataModel model = ChatDataModel();
                                  model.image = receivedData.doctorImage;
                                  model.name = receivedData.doctorName;
                                  model.Id = snapshot.data![index].userId;
                                  //go to chat
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      settings: RouteSettings(),
                                      builder: (context) => PrivateChat(
                                        data: model,
                                      ),
                                    ),
                                  );
                                },
                                child: Icon(Icons.chat,
                                    color: Constant.primaryColor),
                                style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.transparent,
                                    minimumSize: Size(50.w, 59.h),
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side:
                                          BorderSide(color: Color(0xffDFDFDF)),
                                      borderRadius: BorderRadius.circular(10.r),
                                    )),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      settings: RouteSettings(
                                          arguments: receivedData),
                                      builder: (context) => Booking(
                                        data: receivedData.doctorId,
                                      ),
                                    ),
                                  );
                                  // Navigator.pushNamed(context, Colors.grey.id);
                                },
                                child: Text(
                                  'Book Appointment',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.transparent,
                                    minimumSize: Size(100.w, 59.h),
                                    backgroundColor: Constant.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.r),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                      ]);
                },
              ),
            );
            ;
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
