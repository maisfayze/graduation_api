import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation/prefs/prefs.dart';
import 'package:graduation/ui/patientProfile/patient_dashboard.dart';

import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../provider/localization_provider.dart';
import '../../widget/profile_widget.dart';
import '../patient/my_favourite.dart';
import 'edit_profile.dart';
import 'new_pass.dart';

class PatientProfile extends StatelessWidget {
  const PatientProfile({Key? key}) : super(key: key);
  static const id = 'PatientProfile';

  @override
  Widget build(BuildContext context) {
    String name = '${SharedPrefController().getValueFor('fullName')}';

    return Scaffold(
      backgroundColor: Colors.white,
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
                            name,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            SharedPrefController().getValueFor('email'),
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
                          vertical: 40.h,
                        ),
                        child: Column(
                          children: [
                            ProfileWidget(
                              img: 'dashboard',
                              title: 'Dashboard',
                              // sub_title: AppLocalizations.of(context)!
                              //     .see_your_paid_pending,
                              onPresseed: () {
                                Navigator.pushNamed(
                                    context, PatientDashboard.id);
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Divider(
                                color: Colors.grey.shade400,
                                thickness: .2,
                              ),
                            ),
                            ProfileWidget(
                              img: 'fav',
                              title:
                                  AppLocalizations.of(context)!.my_favourites,
                              // sub_title: AppLocalizations.of(context)!
                              //     .see_your_favorite_doctors,
                              onPresseed: () {
                                Navigator.pushNamed(context, Favourites.id);
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Divider(
                                color: Colors.grey.shade400,
                                thickness: .2,
                              ),
                            ),
                            ProfileWidget(
                              img: 'profile_setting',
                              title:
                                  AppLocalizations.of(context)!.profile_setting,
                              // sub_title: AppLocalizations.of(context)!
                              //     .make_changes_to_your_account,
                              onPresseed: () {
                                Navigator.pushNamed(context, EditProfile.id);
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Divider(
                                color: Colors.grey.shade400,
                                thickness: .2,
                              ),
                            ),
                            ProfileWidget(
                              img: 'chang_pass',
                              title:
                                  AppLocalizations.of(context)!.change_password,
                              // sub_title: AppLocalizations.of(context)!
                              //     .chang_your_password_easily,
                              onPresseed: () {
                                Navigator.pushNamed(context, NewPassword.id);
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Divider(
                                color: Colors.grey.shade400,
                                thickness: .2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40.0.w),
                              child: InkWell(
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
            top: 115.0.h, // (background container size) - (circle height / 2)
            child: Container(
              alignment: Alignment.center,
              width: 110.0.w,
              height: 110.0.h,
              decoration: BoxDecoration(
                image: SharedPrefController().getValueFor('image') == ''
                    ? DecorationImage(
                        image: NetworkImage(
                            'http://painrehabproducts.com/wp-content/uploads/2014/10/facebook-default-no-profile-pic.jpg'),
                        fit: BoxFit.cover)
                    : DecorationImage(
                        image: NetworkImage(
                            'http://ac7a1ae098-001-site1.etempurl.com${SharedPrefController().getValueFor('image')}'),
                        fit: BoxFit.cover),
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(100.r)),
              ),
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
