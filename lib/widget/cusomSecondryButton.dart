import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            fontSize: 18,
            fontWeight: FontWeight.w500),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 59),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: .5,
              color: Constant.primaryColor,
            ),
            borderRadius: BorderRadius.circular(60),
          )),
    );
  }
}
