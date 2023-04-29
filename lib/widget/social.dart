import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
          ? Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  child: Image.asset(
                    'images/$imgName.png',
                    width: 25,
                    height: 24,
                  ),
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
                Image.asset(
                  'images/$imgName.png',
                  width: 25,
                  height: 24,
                ),
              ],
            ),
      height: 59,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffD8D8D8),
        ),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
