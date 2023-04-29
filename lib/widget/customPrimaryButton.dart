import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/constant.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
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
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
      ),
      style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          minimumSize: Size(double.infinity, 59),
          backgroundColor: Constant.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          )),
    );
  }
}
