import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/constant.dart';

class loadingCustomButton extends StatelessWidget {
  loadingCustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Center(
        child: SizedBox(
          height: 30.h,
          child: CircularProgressIndicator(
            color: Constant.primaryColor,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          minimumSize: Size(double.infinity, 60.h),
          backgroundColor: Color(0xffD8D8D8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60.r),
          )),
    );
  }
}
