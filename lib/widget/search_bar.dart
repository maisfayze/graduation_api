import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constant/constant.dart';
import '../provider/localization_provider.dart';

class SearchBar extends StatelessWidget {
  SearchBar(
      {super.key,
      this.counter,
      this.prefixIcon,
      this.suffixIcon,
      required this.type,
      required this.controller,
      this.hint});
  int? counter;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String? hint;

  final TextInputType type;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
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
                padding: EdgeInsets.only(left: 24, right: 8),
                child: prefixIcon,
              )
            : Padding(
                padding: EdgeInsets.only(left: 8, right: 24),
                child: prefixIcon,
              ),
        contentPadding: EdgeInsets.zero,
        constraints: BoxConstraints(
          maxHeight: 57,
          minHeight: 57,
        ),

        // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 34),
        hintStyle: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey),
        filled: true,
        fillColor: Constant.textFiledColor,
        counterText: '',
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffe7e7e7), width: 1),
          borderRadius: BorderRadius.circular(80),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Constant.primaryColor, width: 1),
          borderRadius: BorderRadius.circular(80),
        ),
        // focusedErrorBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.red, width: 1),
        //   borderRadius: BorderRadius.circular(80),
        // ),
        // errorBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.red, width: 1),
        //   borderRadius: BorderRadius.circular(80),
        // ),
        // errorStyle: GoogleFonts.poppins(fontSize: 12)
      ),
      // maxLength: counter,
    );
  }
}
