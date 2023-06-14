import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';

class AskedQuestions extends StatelessWidget {
  const AskedQuestions({Key? key}) : super(key: key);
  static const id = 'AskedQuestions';
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
          'Asked Questions ',
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
      body: ListView(
        children: [
          SizedBox(
            height: 32.h,
          ),
          Center(
            child: Text(
              'Frequently Asked Questions',
              style: GoogleFonts.poppins(
                  fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
          ),
          Center(
            child: Text(
              'Get Your Answer',
              style: GoogleFonts.poppins(
                  color: Constant.primaryColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          //q1
          Padding(
            padding: EdgeInsets.only(left: 14.w, right: 14.w, bottom: 24.h),
            child: Container(
              height: 80.h,
              color: Color(0xffF7F7F7),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 330.w,
                      child: Text(
                        ' What information do I need to provide when booking an appointment ?',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      height: 32.h,
                      width: 32.w,
                      child: Icon(
                        Icons.add,
                        color: Constant.primaryColor,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              // child: Theme(
              //   data: ThemeData().copyWith(dividerColor: Colors.transparent),
              //   child: ExpansionTile(
              //
              //     trailing: Container(
              //       height: 32.h,
              //       width: 32.w,
              //       child: Icon(
              //         Icons.add,
              //         color: Constant.primaryColor,
              //       ),
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(5.r),
              //           color: Colors.white),
              //     ),
              //     initiallyExpanded: false,
              //     title: Text(
              //       ' What information do I need to provide when booking an appointment ?',
              //       style: GoogleFonts.poppins(
              //           color: Colors.black,
              //           fontSize: 16.0.sp,
              //           fontWeight: FontWeight.w500),
              //     ),
              //   ),
              // ),
            ),
          ),
          //q2
          Padding(
            padding: EdgeInsets.only(left: 14.w, right: 14.w, bottom: 24.h),
            child: Container(
              height: 80.h,
              color: Color(0xffF7F7F7),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 330.w,
                      child: Text(
                        'Can I book appointments for different types of medical services ?',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      height: 32.h,
                      width: 32.w,
                      child: Icon(
                        Icons.add,
                        color: Constant.primaryColor,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              // child: Theme(
              //   data: ThemeData().copyWith(dividerColor: Colors.transparent),
              //   child: ExpansionTile(
              //
              //     trailing: Container(
              //       height: 32.h,
              //       width: 32.w,
              //       child: Icon(
              //         Icons.add,
              //         color: Constant.primaryColor,
              //       ),
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(5.r),
              //           color: Colors.white),
              //     ),
              //     initiallyExpanded: false,
              //     title: Text(
              //       ' What information do I need to provide when booking an appointment ?',
              //       style: GoogleFonts.poppins(
              //           color: Colors.black,
              //           fontSize: 16.0.sp,
              //           fontWeight: FontWeight.w500),
              //     ),
              //   ),
              // ),
            ),
          ),
          //q3
          Padding(
            padding: EdgeInsets.only(left: 14.w, right: 14.w, bottom: 24.h),
            child: Container(
              height: 80.h,
              color: Color(0xffF7F7F7),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 330.w,
                      child: Text(
                        ' What information do I need to provide when booking an appointment ?',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      height: 32.h,
                      width: 32.w,
                      child: Icon(
                        Icons.add,
                        color: Constant.primaryColor,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              // child: Theme(
              //   data: ThemeData().copyWith(dividerColor: Colors.transparent),
              //   child: ExpansionTile(
              //
              //     trailing: Container(
              //       height: 32.h,
              //       width: 32.w,
              //       child: Icon(
              //         Icons.add,
              //         color: Constant.primaryColor,
              //       ),
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(5.r),
              //           color: Colors.white),
              //     ),
              //     initiallyExpanded: false,
              //     title: Text(
              //       ' What information do I need to provide when booking an appointment ?',
              //       style: GoogleFonts.poppins(
              //           color: Colors.black,
              //           fontSize: 16.0.sp,
              //           fontWeight: FontWeight.w500),
              //     ),
              //   ),
              // ),
            ),
          ),
          //q4
          Padding(
            padding: EdgeInsets.only(left: 14.w, right: 14.w, bottom: 24.h),
            child: Container(
              height: 80.h,
              color: Color(0xffF7F7F7),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 330.w,
                      child: Text(
                        'Is my personal information secure when using this platform ?',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      height: 32.h,
                      width: 32.w,
                      child: Icon(
                        Icons.add,
                        color: Constant.primaryColor,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              // child: Theme(
              //   data: ThemeData().copyWith(dividerColor: Colors.transparent),
              //   child: ExpansionTile(
              //
              //     trailing: Container(
              //       height: 32.h,
              //       width: 32.w,
              //       child: Icon(
              //         Icons.add,
              //         color: Constant.primaryColor,
              //       ),
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(5.r),
              //           color: Colors.white),
              //     ),
              //     initiallyExpanded: false,
              //     title: Text(
              //       ' What information do I need to provide when booking an appointment ?',
              //       style: GoogleFonts.poppins(
              //           color: Colors.black,
              //           fontSize: 16.0.sp,
              //           fontWeight: FontWeight.w500),
              //     ),
              //   ),
              // ),
            ),
          ),
          //q5
          Padding(
            padding: EdgeInsets.only(left: 14.w, right: 14.w, bottom: 24.h),
            child: Container(
              height: 80.h,
              color: Color(0xffF7F7F7),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 330.w,
                      child: Text(
                        'Can I cancel or reschedule an appointment booked ?',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      height: 32.h,
                      width: 32.w,
                      child: Icon(
                        Icons.add,
                        color: Constant.primaryColor,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              // child: Theme(
              //   data: ThemeData().copyWith(dividerColor: Colors.transparent),
              //   child: ExpansionTile(
              //
              //     trailing: Container(
              //       height: 32.h,
              //       width: 32.w,
              //       child: Icon(
              //         Icons.add,
              //         color: Constant.primaryColor,
              //       ),
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(5.r),
              //           color: Colors.white),
              //     ),
              //     initiallyExpanded: false,
              //     title: Text(
              //       ' What information do I need to provide when booking an appointment ?',
              //       style: GoogleFonts.poppins(
              //           color: Colors.black,
              //           fontSize: 16.0.sp,
              //           fontWeight: FontWeight.w500),
              //     ),
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
