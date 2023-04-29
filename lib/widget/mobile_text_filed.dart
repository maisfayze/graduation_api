import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import '../constant/constant.dart';
import '../provider/localization_provider.dart';

class MobileTextFiled extends StatelessWidget {
  MobileTextFiled(
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
    return IntlPhoneField(
      dropdownIconPosition:
          Provider.of<LocalizationProvider>(context, listen: true).languages ==
                  'en'
              ? IconPosition.leading
              : IconPosition.trailing,
      invalidNumberMessage: errorText,
      flagsButtonPadding:
          Provider.of<LocalizationProvider>(context, listen: true).languages ==
                  'en'
              ? EdgeInsets.only(left: 34)
              : EdgeInsets.only(right: 34),
      controller: controller,
      keyboardType: type,
      obscureText: obscureText,
      textAlign:
          Provider.of<LocalizationProvider>(context, listen: true).languages ==
                  'en'
              ? TextAlign.left
              : TextAlign.right,
      onChanged: (phone) {
        print(phone.completeNumber);
      },
      onCountryChanged: (country) {
        print('Country changed to: ' + country.name);
      },
      initialValue: '+970',
      decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Provider.of<LocalizationProvider>(context, listen: true)
                      .languages ==
                  'en'
              ? Padding(
                  padding: EdgeInsets.only(left: 37, right: 12),
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
                ? EdgeInsets.only(right: 34, top: 0, bottom: 0)
                : EdgeInsets.only(left: 34, top: 0, bottom: 0),
            child: suffixIcon,
          ),
          contentPadding: EdgeInsets.zero,
          constraints: BoxConstraints(
            maxHeight: errorText == null ? 60 : 85,
            minHeight: 60,
          ),

          // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 34),
          hintStyle: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey),
          filled: true,
          errorText: errorText,
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
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(80),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(80),
          ),
          errorStyle: GoogleFonts.poppins(fontSize: 12)),
    );
  }
}
