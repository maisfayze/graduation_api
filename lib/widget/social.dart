import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/localization_provider.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.imgName,
    required this.text,
  });
  final String imgName;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provider.of<LocalizationProvider>(context, listen: true)
                  .languages ==
              'en'
          ? Center(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 70.w, right: 10.w, top: 14.h, bottom: 14.h),
                    child: Image.asset(
                      'images/$imgName.png',
                      width: 25.w,
                      height: 24.h,
                    ),
                  ),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
          : Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
                Image.asset(
                  'images/$imgName.png',
                  width: 25.w,
                  height: 24.h,
                ),
              ],
            ),
      height: 59.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffD8D8D8),
        ),
        borderRadius: BorderRadius.circular(50.r),
      ),
    );
  }
}
