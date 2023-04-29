import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constant/constant.dart';
import '../provider/localization_provider.dart';

class BookButton extends StatelessWidget {
  const BookButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width:
          Provider.of<LocalizationProvider>(context, listen: true).languages ==
                  'en'
              ? 60
              : 66,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          '$text',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 9, fontWeight: FontWeight.w600),
        ),
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shadowColor: Colors.transparent,

            // minimumSize: Size(
            //     Provider.of<LocalizationProvider>(context, listen: true)
            //                 .languages ==
            //             'en'
            //         ? 66
            //         : 68,
            //     24),
            backgroundColor: Constant.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            )),
      ),
    );
  }
}
