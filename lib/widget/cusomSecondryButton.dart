import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/constant.dart';

class CustomSecondaryButton extends StatelessWidget {
  const CustomSecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        '$text',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
            color: Constant.primaryColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500),
      ),
      style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          minimumSize: Size(double.infinity, 59.h),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Constant.primaryColor,
            ),
            borderRadius: BorderRadius.circular(60.r),
          )),
    );
  }
}
