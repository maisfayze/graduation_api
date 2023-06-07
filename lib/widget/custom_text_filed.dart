import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constant/constant.dart';
import '../provider/localization_provider.dart';

class CustomTextFiled extends StatelessWidget {
  CustomTextFiled(
      {super.key,
      this.counter,
      this.prefixIcon,
      this.suffixIcon,
      required this.type,
      this.obscureText = false,
      required this.controller,
      this.errorText,
      this.hint});
  int? counter;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool obscureText = false;
  String? hint;
  String? errorText;
  final TextInputType type;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: type,
      obscureText: obscureText,
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
                  padding: EdgeInsets.only(left: 30, right: 12),
                  child: prefixIcon,
                )
              : Padding(
                  padding: EdgeInsets.only(left: 12, right: 37),
                  child: prefixIcon,
                ),
          suffixIcon: Padding(
            padding: Provider.of<LocalizationProvider>(context, listen: true)
                        .languages ==
                    'en'
                ? EdgeInsets.only(right: 34.w, top: 0, bottom: 0)
                : EdgeInsets.only(left: 34.w, top: 0, bottom: 0),
            child: suffixIcon,
          ),
          contentPadding: EdgeInsets.zero,
          constraints: BoxConstraints(
            maxHeight: errorText == null ? 60.h : 85.h,
            minHeight: 60.h,
          ),
          // contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          hintStyle: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: Colors.grey),
          filled: false,
          errorText: errorText,
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
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(80.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(80.r),
          ),
          errorStyle: GoogleFonts.poppins(fontSize: 12.sp)
          // border: UnderlineInputBorder(
          //   borderSide: BorderSide(color: Color(0xffe7e7e7), width: 1),
          // ),
          //     prefix: Row(
          //       children: [
          //         Icon(Icons.expand_more_outlined),
          //         DropdownButton<int>(
          //           isExpanded: false,
          //           underline: Divider(
          //             color: Colors.transparent,
          //             height: 0,
          //           ),
          //           iconSize: 0,
          //           value: _selectedCountry,
          //           items: country
          //               .map((Country) => DropdownMenuItem<int>(
          //                     child: Text(Country.title),
          //                     value: Country.id,
          //                   ))
          //               .toList(),
          //           onChanged: (int? value) {
          //             setState(() => _selectedCountry = value);
          //           },
          //         ),
          //       ],
          //     ),
          //     counterText: ''),
          // maxLength: 9,
          ),
      maxLength: counter,
    );
  }
}
