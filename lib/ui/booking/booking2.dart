import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/ui/booking/success.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../controller/get_ScheduletimingsForDocto_controller.dart';
import '../../main.dart';
import '../../models/scheduletimingsForDocto_model.dart';
import '../../models/top_doctors.dart';

class Booking2 extends StatefulWidget {
  const Booking2({Key? key}) : super(key: key);
  static const id = 'Booking';

  @override
  State<Booking2> createState() => _Booking2State();
}

class _Booking2State extends State<Booking2> {
  DateTime? selectedDate;
  String selectedDay = DateFormat.EEEE().format(DateTime.now());
  int tapped_index = 0;

  List<String> event = [
    '9:00 AM',
    '9:00 AM',
    '9:00 AM',
    '9:00 AM',
    '9:00 AM',
    '9:00 AM',
    '9:00 AM',
  ];
  int? _currentIndex;
  bool _timeSelected = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        selectedDay = DateFormat.EEEE()
            .format(picked); // Format the date to get the day of the week
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as TopDoctorsModel;
    print(selectedDay);
    print(data.doctorId);

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
          'Booking',
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
      body: FadeInLeft(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 20.h, left: 24.w, right: 24.w, bottom: 15.h),
              child: Container(
                height: 132.h,
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
                          child: Image.network(
                            'http://ac7a1ae098-001-site1.etempurl.com${data.doctorImage}',
                            height: 80.h,
                            width: 80.w,
                            fit: BoxFit.cover,
                          )),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 18.w, top: 25.h, right: 0),
                        // padding:
                        //     EdgeInsets.symmetric(horizontal: 18, vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${data.doctorName}',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            RatingBar.builder(
                              initialRating: 3.5,
                              minRating: 1,
                              itemSize: 16,
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
                              height: 8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 12,
                                  color: Colors.grey.shade400,
                                ),
                                Text(
                                  '${data.clinicAddress}',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
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
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        selectedDate == null
                            ? '${DateFormat('dd-MM-yyyy').format(DateTime.now())}'
                            : ' ${DateFormat('dd-MM-yyyy').format(selectedDate!)}',
                        style: GoogleFonts.poppins(
                            color: Color(0xff272B41),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () => _selectDate(context),
                        child: Container(
                          height: 33.h,
                          width: 55.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.calendar_month_rounded,
                                size: 14,
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                size: 14,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(color: Colors.black38)),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    selectedDay == null
                        ? '${DateFormat.EEEE().format(DateTime.now())}'
                        : ' $selectedDay',
                    style: GoogleFonts.poppins(
                        color: Color(0xff757575),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            FutureBuilder(
              future: GetScheduletimingsForDoctor().getScheduletimingsForDoctor(
                  id: data.doctorId, date: selectedDay),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Constant.primaryColor,
                    ),
                  );
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  List<ScheduletimingsForDoctor> time = [];
                  for (int i = 0; i < snapshot.data!.length; i++) {
                    if (snapshot.data![i].item2 == 0) {
                      time.add((snapshot.data![i]));
                    }
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Container(
                      width: 398.w,
                      height: 300.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1.w),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: GridView.builder(
                          itemCount: time.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 3),
                          itemBuilder: (context, index) {
                            return InkWell(
                              splashColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  _currentIndex = index;
                                  _timeSelected = true;
                                });
                              },
                              child: Container(
                                width: 120.w,
                                height: 33.h,
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  // border: Border.all(
                                  //   color: _currentIndex == index
                                  //       ? Color(0xffE9E9E9)
                                  //       : Colors.black,
                                  // ),
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: _currentIndex == index
                                      ? Constant.primaryColor
                                      : Color(0xffE9E9E9),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '${time[index].item1}',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.normal,
                                      color: _currentIndex == index
                                          ? Colors.white
                                          : null,
                                      fontSize: 12.sp),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: Text('NO DATA'),
                  );
                }
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Success.id);
                    },
                    child: Text(
                      'confirm',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        minimumSize: Size(100.w, 44.h),
                        backgroundColor: Constant.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget NameContainer(int index) {
    bool tapped = index == tapped_index;
    String current_name = event[index];
    return GestureDetector(
      onTap: () {
        setState(() {
          print("Tapped index: ${index}");
          tapped_index = index;
        });
      },
      child: Container(
        width: 60.w,
        decoration: BoxDecoration(
            color: tapped ? Color(0xffD9534F) : Colors.white,
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: Colors.grey.shade300, width: 1)),
        child: Center(
          child: Text(
            '$current_name',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 15.sp,
              color: tapped ? Colors.white : Color(0xff888888),
            ),
          ),
        ),
      ),
    );
  }
}
