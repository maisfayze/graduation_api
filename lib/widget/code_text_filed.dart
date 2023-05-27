import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';
import 'package:provider/provider.dart';

import '../provider/localization_provider.dart';

class CodeTextFiled extends StatelessWidget {
  CodeTextFiled({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: 46,
      child: Padding(
        padding: Provider.of<LocalizationProvider>(context, listen: true)
                    .languages ==
                'en'
            ? EdgeInsets.only(left: 4)
            : EdgeInsets.only(right: 4),
        child: TextField(
          controller: controller,
          autofocus: true,
          obscureText: true,
          style: GoogleFonts.poppins(fontSize: 16),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffe7e7e7), width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Constant.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            filled: true,
            fillColor: Color(0xffD9D9D9),
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(5),
            // ),
          ),
        ),
      ),
    );
  }
}
