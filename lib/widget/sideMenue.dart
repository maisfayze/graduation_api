import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../constant/constant.dart';
import '../prefs/prefs.dart';
import '../provider/localization_provider.dart';
import '../ui/drawerScreens/search_page.dart';
import 'drawer_widget.dart';

class SideMenue extends StatelessWidget {
  const SideMenue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 266.w,
      backgroundColor: Constant.primaryColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: Column(
          // Important: Remove any padding from the ListView.
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerWidget(
              img: 'images/search.png',
              onPressed: () {
                Navigator.pushNamed(context, SearchPage.id);
              },
              title: AppLocalizations.of(context)!.search_doctor,
            ),
            DrawerWidget(
              img: 'images/Blo.png',
              onPressed: () {},
              title: AppLocalizations.of(context)!.blogs,
            ),
            DrawerWidget(
              img: 'images/about.png',
              onPressed: () {},
              title: AppLocalizations.of(context)!.about_Us,
            ),
            DrawerWidget(
              img: 'images/price.png',
              onPressed: () {},
              title: AppLocalizations.of(context)!.pricing_plan,
            ),
            DrawerWidget(
              img: 'images/faqs.png',
              onPressed: () {},
              title: AppLocalizations.of(context)!.asked_questions,
            ),
            DrawerWidget(
              img: 'images/client.png',
              onPressed: () {},
              title: AppLocalizations.of(context)!.client_Sayings,
            ),
            DrawerWidget(
              img: 'images/trans.png',
              onPressed: () {
                Provider.of<LocalizationProvider>(context, listen: false)
                    .changLang();
              },
              title: AppLocalizations.of(context)!.change_Language,
            ),
            DrawerWidget(
              img: 'images/comp.png',
              onPressed: () {},
              title: AppLocalizations.of(context)!.complaints_box,
            ),
            SizedBox(
              height: 50.h,
            ),
            ElevatedButton(
              onPressed: () {
                buildShowDialog(context);
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  minimumSize: Size(131.w, 53.h),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.r),
                  )),
              child: Text(
                AppLocalizations.of(context)!.log_out,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // titlePadding: EdgeInsets.symmetric(horizontal: 34),
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.log_out_of_your_account,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0.r)),
            // actionsPadding: EdgeInsets.only(bottom: 34),
            actions: [
              Column(
                children: [
                  Divider(),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    onTap: () {
                      SharedPrefController().clear();

                      SystemNavigator.pop();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.log_out,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: Color(0xffDE1C1C),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.cancel,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ],
          );
        });
  }
}
