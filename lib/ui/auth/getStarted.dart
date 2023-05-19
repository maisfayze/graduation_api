import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/ui/auth/doc_signup.dart';
import 'package:graduation/ui/auth/doctor_login.dart';
import 'package:graduation/ui/auth/patient_login.dart';
import 'package:graduation/ui/auth/patient_sign_up.dart';
import 'package:provider/provider.dart';

import '../../provider/localization_provider.dart';
import '../../widget/cusomSecondryButton.dart';
import '../../widget/customPrimaryButton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);
  static const id = 'GetStarted';

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as int;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 28.h, left: 28.w, right: 28.w),
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
                FadeInUp(
                  child: Text(
                    AppLocalizations.of(context)!.lets_get_started,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 24.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70.0.w),
                  child: FadeInUp(
                    child: Text(
                      AppLocalizations.of(context)!.get_sub,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: Color(0xffB2B0B0),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 46.w),
                  child: FadeInUp(
                    child: CustomPrimaryButton(
                        text: AppLocalizations.of(context)!.login,
                        onPressed: () {
                          if (data == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                settings: RouteSettings(arguments: 1),
                                builder: (context) => DoctorLoginPage(data: 1),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                settings: RouteSettings(arguments: 2),
                                builder: (context) => PatientLoginPage(data: 2),
                              ),
                            );
                          }
                        }),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 46.w),
                  child: FadeInUp(
                    child: CustomSecondaryButton(
                        text: AppLocalizations.of(context)!.sign_up,
                        onPressed: () {
                          if (data == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                settings: RouteSettings(arguments: 1),
                                builder: (context) => DocSignUp(),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                settings: RouteSettings(arguments: 2),
                                builder: (context) => PatientSignUp(),
                              ),
                            );
                          }
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
