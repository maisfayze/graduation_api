import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);
  static const id = 'AboutUs';
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
          'About Us',
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
            height: 24.h,
          ),
          FadeInLeft(
            child: Center(
              child: Image.asset(
                'images/logo.png',
                width: 300.w,
                height: 120.h,
              ),
            ),
          ),
          SizedBox(
            height: 36.h,
          ),
          FadeInLeft(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    'About Our Platform',
                    style: GoogleFonts.poppins(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Constant.primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    'We are an advanced platform designed to revolutionize the way doctors and patients communicate and manage appointments. With our seamless online booking system, we aim to simplify the process of scheduling appointments, with a user-friendly interface that allows you to search for and book healthcare professionals based on various criteria while providing effective tools to physicians to streamline their processes and manage their practices efficiently.',
                    style: GoogleFonts.poppins(
                      color: Color(0xff6B7280),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 36.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    'Contact Us',
                    style: GoogleFonts.poppins(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Constant.primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 18,
                        color: Color(0xff6B7280),
                      ),
                      Text(
                        '  Palestine,Gaza City Al-Quds Street ,12',
                        style: GoogleFonts.poppins(
                          color: Color(0xff6B7280),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 18,
                        color: Color(0xff6B7280),
                      ),
                      Text(
                        ' +1 315 369 5943',
                        style: GoogleFonts.poppins(
                          color: Color(0xff6B7280),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.email,
                        size: 18,
                        color: Color(0xff6B7280),
                      ),
                      Text(
                        ' CliniPlus@example.com',
                        style: GoogleFonts.poppins(
                          color: Color(0xff6B7280),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
