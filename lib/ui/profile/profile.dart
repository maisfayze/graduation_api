import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation/ui/profile/new_pass.dart';
import 'package:graduation/ui/profile/profile_setting.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../provider/localization_provider.dart';
import '../../widget/profile_widget.dart';
import '../patient/my_favourite.dart';
import 'edit_profile.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  static const id = 'Profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   shadowColor: Colors.transparent,
      //   shape: Border(
      //     bottom: BorderSide(
      //       color: Constant.primaryColor,
      //
      //     ),
      //   ),
      //   foregroundColor: Constant.primaryColor,
      //   surfaceTintColor: Constant.primaryColor,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back_ios_sharp,
      //       color: Colors.black,
      //       size: 24,
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   backgroundColor: Constant.primaryColor,
      // ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // background image and bottom contents

          ListView(
            children: <Widget>[
              Container(
                height: 150.0.h,
                color: Constant.primaryColor,
              ),
              SizedBox(
                height: 54.h,
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Ahmad hamad',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'ahmad.188@hotmail.com',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 40.h, horizontal: 40.w),
                        child: Column(
                          children: [
                            ProfileWidget(
                              img: 'bill',
                              title: AppLocalizations.of(context)!.my_billing,
                              sub_title: AppLocalizations.of(context)!
                                  .see_your_paid_pending,
                              onPresseed: () {},
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            ProfileWidget(
                              img: 'fav',
                              title:
                                  AppLocalizations.of(context)!.my_favourites,
                              sub_title: AppLocalizations.of(context)!
                                  .see_your_favorite_doctors,
                              onPresseed: () {
                                Navigator.pushNamed(context, Favourites.id);
                              },
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            ProfileWidget(
                              img: 'profile_setting',
                              title:
                                  AppLocalizations.of(context)!.profile_setting,
                              sub_title: AppLocalizations.of(context)!
                                  .make_changes_to_your_account,
                              onPresseed: () {
                                Navigator.pushNamed(context, EditProfile.id);
                              },
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            ProfileWidget(
                              img: 'chang_pass',
                              title:
                                  AppLocalizations.of(context)!.change_password,
                              sub_title: AppLocalizations.of(context)!
                                  .chang_your_password_easily,
                              onPresseed: () {
                                Navigator.pushNamed(context, NewPassword.id);
                              },
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            InkWell(
                              onTap: () {
                                buildShowDialog(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.logout,
                                    color: Color(0xffDE1C1C),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.log_out,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
                                      color: Color(0xffDE1C1C),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          // Profile image
          Positioned(
            top: 110.0.h, // (background container size) - (circle height / 2)
            child: Container(
              height: 110.0.h.h,
              width: 110.0.w,
              child: CircleAvatar(
                radius: 55.r,
                backgroundImage: AssetImage('images/profile.jpg'),
              ),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            ),
          )
        ],
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
// actions: [
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// SizedBox(
// height: 36,
// width: 94,
// child: ElevatedButton(
// onPressed: () {
//
// },
// child: Text(
// AppLocalizations.of(context)!.save,
// textAlign: TextAlign.center,
// style: GoogleFonts.poppins(
// color: Colors.white,
// fontSize: 14,
// fontWeight: FontWeight.w600),
// ),
// style: ElevatedButton.styleFrom(
// padding: EdgeInsets.zero,
// shadowColor: Colors.transparent,
// backgroundColor: Constant.primaryColor,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10.r),
// )),
// ),
// ),
// SizedBox(
// width: 16.w,
// ),
// SizedBox(
// height: 36,
// width: 94,
// child: ElevatedButton(
// onPressed: () {},
// child: Text(
// AppLocalizations.of(context)!.not_now,
// textAlign: TextAlign.center,
// style: GoogleFonts.poppins(
// color: Color(0xffA2ABAB),
// fontSize: 14,
// fontWeight: FontWeight.w600),
// ),
// style: ElevatedButton.styleFrom(
// padding: EdgeInsets.zero,
// shadowColor: Colors.transparent,
// backgroundColor: Colors.white,
// shape: RoundedRectangleBorder(
// side: BorderSide(
// width: 1.5,
// color: Color(0xffA2ABAB),
// ),
// borderRadius: BorderRadius.circular(10.r),
// )),
// ),
// ),
// ],
// ),
// ],
