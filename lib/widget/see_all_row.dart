import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constant/constant.dart';

class SeeALLRow extends StatelessWidget {
  const SeeALLRow({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: Colors.black,
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(
            AppLocalizations.of(context)!.see_all,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: Constant.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
