import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({
    super.key,
    required this.img,
    required this.title,
    // required this.sub_title,
    required this.onPresseed,
  });

  final String img;
  final String title;
  // final String sub_title;
  final Function() onPresseed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.0.w),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'images/$img.png',
                      width: 24.w,
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.shade500,
              size: 16,
            ),
          ],
        ),
        onTap: onPresseed,
      ),
    );
  }
}
