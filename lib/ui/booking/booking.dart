import 'package:animate_do/animate_do.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/ui/booking/success.dart';
import 'package:graduation/utiles/context_extention.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';

import '../../controller/create_appoitment_api_controller.dart';
import '../../controller/get_ScheduletimingsForDocto_controller.dart';
import '../../main.dart';
import '../../models/api_response.dart';
import '../../models/create_app_model.dart';
import '../../models/invoice_data.dart';
import '../../models/scheduletimingsForDocto_model.dart';
import '../../models/top_doctors.dart';

class Booking extends StatefulWidget {
  Booking({Key? key, this.data}) : super(key: key);
  static const id = 'Booking';
  int? data;

  @override
  State<Booking> createState() => _BookingState(data);
}

class _BookingState extends State<Booking> {
  int? data;
  _BookingState(this.data);
  DateTime selectedDate = DateTime.now();
  String selectedDay = DateFormat.EEEE().format(DateTime.now());
  int tapped_index = 0;
  DatePickerController _controller = DatePickerController();
  bool _timeSelected = false;
  DateTime _selectedValue = DateTime.now();
  int? _currentIndex;

  bool loading = false;

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

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as TopDoctorsModel;
    print(DateTime.now());
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
      body: loading
          ? Center(
              child: CircularProgressIndicator(
                color: Constant.primaryColor,
              ),
            )
          : FadeInLeft(
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                        child: Row(
                          children: [
                            Text(
                              selectedDay == null
                                  ? '${DateFormat.EEEE().format(DateTime.now())}'
                                  : ' ${DateFormat.EEEE().format(selectedDate!)}',
                              style: GoogleFonts.poppins(
                                  color: Color(0xff757575),
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Text(
                              selectedDate == null
                                  ? '${DateFormat('dd-MM-yyyy').format(selectedDate)!}'
                                  : ' ${DateFormat('dd-MM-yyyy').format(selectedDate!)}',
                              style: GoogleFonts.poppins(
                                  color: Color(0xff757575),
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600),
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0.w, vertical: 16.h),
                        child: Text(
                          'Available Time',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  FutureBuilder(
                    future: GetScheduletimingsForDoctor()
                        .getScheduletimingsForDoctor(
                            id: data.doctorId,
                            date:
                                ' ${DateFormat('yyyy-MM-dd').format(selectedDate!)}T00:00:00.875Z'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Constant.primaryColor,
                          ),
                        );
                      } else if (snapshot.hasData &&
                          snapshot.data!.isNotEmpty) {
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
                            height: 800.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 1.w),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.r)),
                            child: ListView(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 10.h),
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    itemCount: time.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 3),
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
                                            borderRadius:
                                                BorderRadius.circular(5.r),
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
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.0.w),
                                  child: Text(
                                    'Start time',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 10.h),
                                  child: Expanded(
                                      child: TextField(
                                    decoration: InputDecoration(
                                        hintText:
                                            '${selectedStartTime != null ? DateFormat.Hm().format(DateTime(2021, 1, 1, selectedStartTime!.hour, selectedStartTime!.minute)) : ''}',
                                        suffixIcon: Padding(
                                          padding: EdgeInsets.only(
                                              left: 34.w, top: 0, bottom: 0),
                                          child: IconButton(
                                              onPressed: () {
                                                // _openStartTimePickerSheet(
                                                //     context);
                                                _selectStartTime(context);
                                              },
                                              icon: Icon(
                                                  Icons.access_time_outlined,
                                                  color: Colors.grey)),
                                        ),
                                        constraints: BoxConstraints(
                                          maxHeight: 60.h,
                                          minHeight: 60.h,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16.w),
                                        hintStyle: GoogleFonts.poppins(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey),
                                        filled: false,

                                        // fillColor: Constant.textFiledColor,
                                        counterText: '',
                                        border: InputBorder.none,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffe7e7e7),
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Constant.primaryColor,
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                        ),
                                        errorStyle: GoogleFonts.poppins(
                                            fontSize: 12.sp)),
                                  )),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.0.w),
                                  child: Text(
                                    'End time',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 10.h),
                                  child: Expanded(
                                      child: TextField(
                                    decoration: InputDecoration(
                                        hintText:
                                            '${selectedEndTime != null ? DateFormat.Hm().format(DateTime(2021, 1, 1, selectedEndTime!.hour, selectedEndTime!.minute)) : ''}',
                                        suffixIcon: Padding(
                                          padding: EdgeInsets.only(
                                              left: 34.w, top: 0, bottom: 0),
                                          child: IconButton(
                                              onPressed: () {
                                                // _openEndTimePickerSheet(
                                                //     context);
                                                _selectEndTime(context);
                                              },
                                              icon: Icon(
                                                  Icons.access_time_outlined,
                                                  color: Colors.grey)),
                                        ),
                                        constraints: BoxConstraints(
                                          maxHeight: 60.h,
                                          minHeight: 60.h,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16.w),
                                        hintStyle: GoogleFonts.poppins(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey),
                                        filled: false,

                                        // fillColor: Constant.textFiledColor,
                                        counterText: '',
                                        border: InputBorder.none,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffe7e7e7),
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Constant.primaryColor,
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(80.r),
                                        ),
                                        errorStyle: GoogleFonts.poppins(
                                            fontSize: 12.sp)),
                                  )),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.w, vertical: 16.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
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
                                            backgroundColor:
                                                Constant.primaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: Column(children: [
                            FadeInLeft(
                              child: Image.asset(
                                'images/no_time.gif',
                                width: 350.w,
                                height: 250.h,
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 80.w),
                              child: FadeInRight(
                                child: Text(
                                  'No Available Time pick another date and day',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      color: Constant.primaryColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ]),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
    );
  }

  void performLogin() {
    setState(() {
      loading = true;
    });
    login();
  }

  void login() async {
    CreateAppModel? processResponse = await CreateAppointments().createAppointments(
        id: widget.data!.toString(),
        date: '${DateFormat('yyyy-MM-dd').format(selectedDate!)}T00:00:00.875Z',
        day: DateFormat.EEEE().format(selectedDate!),
        Start:
            '${DateFormat('yyyy-MM-dd').format(selectedDate!)}T${DateFormat.Hm().format(DateTime(2021, 1, 1, selectedStartTime!.hour, selectedStartTime!.minute))}:00.875Z',
        End:
            '${DateFormat('yyyy-MM-dd').format(selectedDate!)}T${DateFormat.Hm().format(DateTime(2021, 1, 1, selectedEndTime!.hour, selectedEndTime!.minute))}:00.875Z');
    if (processResponse?.doctorId == widget.data!) {
      Invoice invoice = Invoice();
      invoice.docName = processResponse!.doctorName;
      invoice.data = '${DateFormat('dd-MM-yyyy').format(selectedDate!)}';
      invoice.day = processResponse!.day;

      invoice.time =
          '${DateFormat.Hm().format(DateTime(2021, 1, 1, selectedStartTime!.hour, selectedStartTime!.minute))} -'
          '${DateFormat.Hm().format(DateTime(2021, 1, 1, selectedEndTime!.hour, selectedEndTime!.minute))}';
      Navigator.push(
        context,
        MaterialPageRoute(
          settings: RouteSettings(),
          builder: (context) => Success(invoice: invoice),
        ),
      );

      // Navigator.pushNamed(context, Success.id);
    }
  }

  // Invoice get invoice {
  //   Invoice invoice = Invoice();
  //   invoice.docName=
  //
  //   return invoice;
  // }
  Widget NameContainer(int index) {
    bool tapped = index == tapped_index;
    // String current_name = event[index];
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
            '',
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
