import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({
    super.key,
    required this.img,
    required this.onPressed,
    required this.title,
  });
  final String img;
  final String title;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          img,
          width: 24.w,
          height: 24.h,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp),
          ),
        ),
      ],
    );
  }
}
