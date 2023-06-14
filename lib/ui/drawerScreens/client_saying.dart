import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/constant.dart';

class ClientSaying extends StatelessWidget {
  const ClientSaying({Key? key}) : super(key: key);
  static const id = 'ClientSaying';
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
          'Client Saying',
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
              'What Our Client Says',
              style: GoogleFonts.poppins(
                  fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
          ),
          Center(
            child: Text(
              'Testimonials',
              style: GoogleFonts.poppins(
                  color: Constant.primaryColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 14.0.w,
            ),
            child: Container(
                height: 252.h,
                color: Color(0xfff5fbfb),
                child: Image.asset('images/c1.png')),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 14.0.w,
            ),
            child: Container(
                height: 252.h,
                color: Color(0xfff5fbfb),
                child: Image.asset('images/c2.png')),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 14.0.w,
            ),
            child: Container(
                height: 252.h,
                color: Color(0xfff5fbfb),
                child: Image.asset('images/c3.png')),
          ),
          SizedBox(
            height: 60.h,
          ),
        ],
      ),
    );
  }
}
