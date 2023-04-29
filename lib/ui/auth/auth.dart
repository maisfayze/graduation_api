import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/ui/auth/getStarted.dart';
import 'package:graduation/ui/auth/login.dart';
import 'package:graduation/widget/customPrimaryButton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../provider/localization_provider.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);
  static const id = 'Auth';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 28, left: 28, right: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () async {
                    Provider.of<LocalizationProvider>(context, listen: false)
                        .changLang();
                  },
                  child: Text(
                    Provider.of<LocalizationProvider>(context, listen: true)
                        .languagesText,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Color(0xff8B8989),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.skip,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Color(0xff8B8989),
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeInLeft(
                  child: Text(
                    AppLocalizations.of(context)!.welcome,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 24.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                FadeInLeft(
                  child: Text(
                    AppLocalizations.of(context)!.are_you,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 18.sp, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 46.w),
                  child: FadeInUp(
                    child: CustomPrimaryButton(
                        text: AppLocalizations.of(context)!.doctor,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              settings: RouteSettings(arguments: 1),
                              builder: (context) => GetStarted(),
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 46.w),
                  child: FadeInUp(
                    child: CustomPrimaryButton(
                        text: AppLocalizations.of(context)!.patient,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              settings: RouteSettings(arguments: 2),
                              builder: (context) => GetStarted(),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
