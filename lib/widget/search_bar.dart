import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constant/constant.dart';
import '../provider/localization_provider.dart';

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget(
      {super.key,
      this.counter,
        this.onPressed,
      this.prefixIcon,
      this.suffixIcon,
      required this.type,
      required this.controller,
      this.hint});

  int? counter;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String? hint;
  Function()? onPressed;

  final TextInputType type;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onPressed,
      controller: controller,
      keyboardType: type,
      minLines: 1,
      maxLines: 1,
      textDirection:
          Provider.of<LocalizationProvider>(context, listen: true).languages ==
                  'en'
              ? TextDirection.ltr
              : TextDirection.rtl,
      decoration: InputDecoration(
        hintText: hint,

        prefixIcon: Provider.of<LocalizationProvider>(context, listen: true)
                    .languages ==
                'en'
            ? Padding(
                padding: EdgeInsets.only(left: 24.w, right: 8.w),
                child: prefixIcon,
              )
            : Padding(
                padding: EdgeInsets.only(left: 8.w, right: 24.w),
                child: prefixIcon,
              ),
        contentPadding: EdgeInsets.zero,
        constraints: BoxConstraints(
          maxHeight: 57.h,
          minHeight: 57.h,
        ),

        // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 34),
        hintStyle: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: Colors.grey.shade400),
        // filled: true,
        // fillColor: Constant.textFiledColor,
        counterText: '',
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffe7e7e7), width: 1),
          borderRadius: BorderRadius.circular(80.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Constant.primaryColor, width: 1),
          borderRadius: BorderRadius.circular(80.r),
        ),
        // focusedErrorBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.red, width: 1),
        //   borderRadius: BorderRadius.circular(80.r),
        // ),
        // errorBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.red, width: 1),
        //   borderRadius: BorderRadius.circular(80.r),
        // ),
        // errorStyle: GoogleFonts.poppins(fontSize: 12.sp)
      ),
      // maxLength: counter,
    );
  }
}
