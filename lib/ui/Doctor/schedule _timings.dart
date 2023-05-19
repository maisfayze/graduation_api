import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../../models/time_intervel.dart';

class ScheduleTimings extends StatefulWidget {
  ScheduleTimings({Key? key}) : super(key: key);
  static const id = 'kkk';
  @override
  State<ScheduleTimings> createState() => _ScheduleTimingsState();
}

class _ScheduleTimingsState extends State<ScheduleTimings> {
  //declaration

  @override
  void initState() {
    super.initState();
  }

  // final List<TimeIntervel> _timeInterval = <TimeIntervel>[
  //   TimeIntervel(id: 1, title: '15 mins'),
  //   TimeIntervel(id: 2, title: '30 mins'),
  //   TimeIntervel(id: 2, title: '45 mins'),
  //   TimeIntervel(id: 2, title: '1 hour')
  // ];
  int? _selectedTime;
  String? dropDownValue;
  List<String> timeList = [
    '15 mins',
    '30 mins',
    'Dubai',
    '45 mins',
    '1 hour',
  ];
  List<String> days = [
    'SUNDAY',
    'MONDAY',
    'TUESDAY',
    'WEDNESDAY',
    'THURSDAY',
    'FRIDAY',
    'SATURDAY',
  ];
  var ContainerColor = Colors.white;
  setFilters() {
    setState(() {
      dropDownValue = timeList[1];
    });
  }

  int tapped_index = 0;

  @override
  Widget build(BuildContext context) {
    // Config().init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Schedule Timings',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              color: Colors.black,
            ),
          ),
          elevation: 0,
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
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Schedule Timings',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: Color(0xff6B7280),
                ),
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 35),
                    constraints: BoxConstraints(
                        maxHeight: 60.h,
                        minHeight: 60.h,
                        maxWidth: 287.w,
                        minWidth: 287.w),

                    // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 34),
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                    // filled: true,
                    // fillColor: Constant.textFiledColor,
                    counterText: '',
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade300, width: 1.w),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Constant.primaryColor, width: 1),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    errorStyle: GoogleFonts.poppins(fontSize: 12.sp)),
                value: dropDownValue,
                onChanged: (String? Value) {
                  setState(() {
                    dropDownValue = Value!;
                  });
                },
                items: timeList
                    .map((cityTitle) => DropdownMenuItem(
                        value: cityTitle, child: Text("$cityTitle")))
                    .toList(),
              ),
              SizedBox(
                height: 21.h,
              ),
              Container(
                width: 398.w,
                height: 270.h,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300, width: 1.w),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 14.w, right: 14.w, top: 14.h, bottom: 14.h),
                  child: GridView.builder(
                    itemCount: 7,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 15,
                        childAspectRatio: 1.9,
                        crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return NameContainer(index);
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget NameContainer(int index) {
    bool tapped = index == tapped_index;
    String current_name = days[index];
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
