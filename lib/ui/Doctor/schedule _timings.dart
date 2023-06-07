import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/get_ScheduletimingsForDocto_controller.dart';
import '../../controller/scheduletiming_api_controller.dart';
import '../../main.dart';
import '../../models/schedual_time.dart';
import '../../models/scheduletimingsForDocto_model.dart';
import '../../models/time_intervel.dart';
import '../../prefs/prefs.dart';

class ScheduleTimings extends StatefulWidget {
  ScheduleTimings({Key? key}) : super(key: key);
  static const id = 'kkk';
  @override
  State<ScheduleTimings> createState() => _ScheduleTimingsState();
}

class _ScheduleTimingsState extends State<ScheduleTimings> {
  //declaration

  // final List<TimeIntervel> _timeInterval = <TimeIntervel>[
  //   TimeIntervel(id: 1, title: '15 mins'),
  //   TimeIntervel(id: 2, title: '30 mins'),
  //   TimeIntervel(id: 2, title: '45 mins'),
  //   TimeIntervel(id: 2, title: '1 hour')
  // ];
  int? _selectedTime;
  String? dropDownValue;
  List<String> timeList = [
    '15',
    '30',
    '45',
  ];
  List<String> days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];
  var ContainerColor = Colors.white;
  setFilters() {
    setState(() {
      dropDownValue = timeList[1];
    });
  }

  bool loading = false;

  int tapped_index = 0;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;

  @override
  void initState() {
    super.initState();
    selectedStartTime = TimeOfDay.now();
    selectedEndTime = TimeOfDay.now();
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedStartTime ?? TimeOfDay.now(),
      // builder: (BuildContext context, Widget? child) {
      //   return MediaQuery(
      //     data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
      //     child: child!,
      //   );
      // },
    );

    if (pickedTime != null && pickedTime != selectedStartTime) {
      setState(() {
        selectedStartTime = pickedTime;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedEndTime ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (pickedTime != null && pickedTime != selectedEndTime) {
      setState(() {
        selectedEndTime = pickedTime;
      });
    }
  }

  DateTime selectedDate = DateTime.now();
  String selectedDay = DateFormat.EEEE().format(DateTime.now());
  DatePickerController _controller = DatePickerController();
  bool _timeSelected = false;
  DateTime _selectedValue = DateTime.now();
  int? _currentIndex;
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //day date
              Container(
                height: 180.h,
                child: Column(
                  children: [
                    SizedBox(
                      height: 14.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        children: [
                          Text(
                            selectedDay == null
                                ? '${DateFormat.EEEE().format(DateTime.now())}'
                                : ' ${DateFormat.EEEE().format(selectedDate!)}',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                            ),
                          ),
                          Spacer(),
                          Text(
                            selectedDate == null
                                ? '${DateFormat('dd-MM-yyyy').format(selectedDate)!}'
                                : ' ${DateFormat('dd-MM-yyyy').format(selectedDate!)}',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      // margin: EdgeInsets.only(left: 24.w, right: 24.w),
                      color: Constant.textFiledColor,
                      child: DatePicker(
                        DateTime.now(),

                        width: 80.w,
                        height: 110.h,
                        controller: _controller,
                        initialSelectedDate: DateTime.timestamp(),
                        // initialSelectedDate: DateTime.now(),
                        selectionColor: Constant.primaryColor,
                        selectedTextColor: Colors.white,
                        monthTextStyle: GoogleFonts.poppins(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                        dateTextStyle: GoogleFonts.poppins(
                            fontSize: 20.sp, fontWeight: FontWeight.w600),
                        onDateChange: (date) {
                          // New date selected
                          setState(() {
                            selectedDate = date;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Divider(color: Colors.grey.shade300, thickness: 1.w),
              SizedBox(
                height: 14.h,
              ),
              //duration
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  'Timing Slot Duration',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                ),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
                      constraints: BoxConstraints(
                          maxHeight: 60.h,
                          minHeight: 60.h,
                          maxWidth: 287.w,
                          minWidth: 287.w),

                      // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 34),
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14.sp,
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
                      .map((time) => DropdownMenuItem(
                          value: time, child: Text("$time mins")))
                      .toList(),
                ),
              ),
              SizedBox(
                height: 21.h,
              ),
              Divider(color: Colors.grey.shade300, thickness: 1.w),
              SizedBox(
                height: 14.h,
              ),
              //start and end
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: Text(
                  'Start time',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: TextField(
                  decoration: InputDecoration(
                      hintText:
                          '${selectedStartTime != null ? DateFormat.Hm().format(DateTime(2021, 1, 1, selectedStartTime!.hour, selectedStartTime!.minute)) : ''}',
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(left: 34.w, top: 0, bottom: 0),
                        child: IconButton(
                            onPressed: () {
                              // _openStartTimePickerSheet(
                              //     context);
                              _selectStartTime(context);
                            },
                            icon: Icon(Icons.access_time_outlined,
                                color: Colors.grey)),
                      ),
                      constraints: BoxConstraints(
                        maxHeight: 60.h,
                        minHeight: 60.h,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                      filled: false,

                      // fillColor: Constant.textFiledColor,
                      counterText: '',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffe7e7e7), width: 1),
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
                        borderRadius: BorderRadius.circular(80.r),
                      ),
                      errorStyle: GoogleFonts.poppins(fontSize: 12.sp)),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: Text(
                  'End time',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: TextField(
                  decoration: InputDecoration(
                      hintText:
                          '${selectedEndTime != null ? DateFormat.Hm().format(DateTime(2021, 1, 1, selectedEndTime!.hour, selectedEndTime!.minute)) : ''}',
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(left: 34.w, top: 0, bottom: 0),
                        child: IconButton(
                            onPressed: () {
                              // _openEndTimePickerSheet(
                              //     context);
                              _selectEndTime(context);
                            },
                            icon: Icon(Icons.access_time_outlined,
                                color: Colors.grey)),
                      ),
                      constraints: BoxConstraints(
                        maxHeight: 60.h,
                        minHeight: 60.h,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                      filled: false,

                      // fillColor: Constant.textFiledColor,
                      counterText: '',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffe7e7e7), width: 1),
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
                        borderRadius: BorderRadius.circular(80.r),
                      ),
                      errorStyle: GoogleFonts.poppins(fontSize: 12.sp)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {});
                        performLogin();
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
                    ),
                  ],
                ),
              ),

              Divider(color: Colors.grey.shade300, thickness: 1.w),
              SizedBox(
                height: 14.h,
              ),

              //time slots
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.h),
                child: Text(
                  'Time Slots',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
              ),

              FutureBuilder(
                future: GetScheduletimingsForDoctor().getScheduletimingsForDoctor(
                    id: SharedPrefController().getValueFor('doctorId'),
                    date:
                        '${DateFormat('yyyy-MM-dd').format(selectedDate!)}T00:00:00.875Z'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Constant.primaryColor,
                      ),
                    );
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return Container(
                      width: 398.w,
                      height: 350.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 14.w,
                          right: 14.w,
                          top: 14.h,
                        ),
                        child: GridView.builder(
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15,
                                  childAspectRatio: 3,
                                  crossAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return Container(
                              width: 60.w,
                              decoration: BoxDecoration(
                                  color: Color(0xffD9534F),
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(
                                      color: Colors.grey.shade300, width: 1)),
                              child: Center(
                                child: Text(
                                  snapshot.data![index].item1,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        'No Time Schedule yet',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Save Changes',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          minimumSize: Size(100.w, 50.h),
                          backgroundColor: Constant.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ));
  }

  void performLogin() {
    login();
  }

  void login() async {
    ScheduleTimingsModel? processResponse = await ScheduletimingApiController()
        .addscheduletiming(
            date:
                '${DateFormat('yyyy-MM-dd').format(selectedDate!)}T00:00:00.875Z',
            day: DateFormat.EEEE().format(selectedDate!),
            Start:
                '${DateFormat('yyyy-MM-dd').format(selectedDate!)}T${DateFormat.Hm().format(DateTime(2021, 1, 1, selectedStartTime!.hour, selectedStartTime!.minute))}:00.875Z',
            End:
                '${DateFormat('yyyy-MM-dd').format(selectedDate!)}T${DateFormat.Hm().format(DateTime(2021, 1, 1, selectedEndTime!.hour, selectedEndTime!.minute))}:00.875Z',
            duration: dropDownValue!);
    // if (processResponse?.doctorId == '4') {
    //   // Navigator.pushNamed(context, Success.id);
    // }
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
