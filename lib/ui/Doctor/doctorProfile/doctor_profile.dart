import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';

import '../../../prefs/prefs.dart';
import '../../../widget/profile_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../patientProfile/new_pass.dart';
import '../schedule _timings.dart';
import 'my_appointment.dart';
import 'my_patient.dart';
import 'edit_doctor_profile.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({Key? key}) : super(key: key);
  static const id = "DoctorProfile";
  @override
  Widget build(BuildContext context) {
    String name = '${SharedPrefController().getValueFor('doctorName')}';
    String image = '${SharedPrefController().getValueFor('image')}';
    print('imageData $image');
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 300.h,
            ),
            child: ListView(
              children: [
                ProfileWidget(
                  img: 'dashboard',
                  title: AppLocalizations.of(context)!.dashboard,
                  // sub_title: AppLocalizations.of(context)!
                  //     .see_your_paid_pending,
                  onPresseed: () {},
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Divider(
                    color: Colors.grey.shade400,
                    thickness: .2,
                  ),
                ),
                ProfileWidget(
                  img: 'appo',
                  title: AppLocalizations.of(context)!.appointments,
                  // sub_title: AppLocalizations.of(context)!
                  //     .see_your_paid_pending,
                  onPresseed: () {
                    Navigator.pushNamed(context, MyPatientAppointments.id);
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
                  img: 'myp',
                  title: AppLocalizations.of(context)!.my_patients,
                  // sub_title: AppLocalizations.of(context)!
                  //     .see_your_paid_pending,
                  onPresseed: () {
                    Navigator.pushNamed(context, MyPatients.id);
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
                  img: 'sch',
                  title: AppLocalizations.of(context)!.schedule_timings,
                  // sub_title: AppLocalizations.of(context)!
                  //     .see_your_paid_pending,
                  onPresseed: () {
                    Navigator.pushNamed(context, ScheduleTimings.id);
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
                  img: 'bill',
                  title: AppLocalizations.of(context)!.invoices,
                  // sub_title: AppLocalizations.of(context)!
                  //     .see_your_paid_pending,
                  onPresseed: () {},
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Divider(
                    color: Colors.grey.shade400,
                    thickness: .2,
                  ),
                ),
                ProfileWidget(
                  img: 'rev',
                  title: AppLocalizations.of(context)!.reviews,
                  // sub_title: AppLocalizations.of(context)!
                  //     .see_your_paid_pending,
                  onPresseed: () {},
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Divider(
                    color: Colors.grey.shade400,
                    thickness: .2,
                  ),
                ),
                ProfileWidget(
                  img: 'blbl',
                  title: AppLocalizations.of(context)!.blogs,
                  // sub_title: AppLocalizations.of(context)!
                  //     .see_your_paid_pending,
                  onPresseed: () {},
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Divider(
                    color: Colors.grey.shade400,
                    thickness: .2,
                  ),
                ),
                ProfileWidget(
                  img: 'soci',
                  title: AppLocalizations.of(context)!.social_media,
                  // sub_title: AppLocalizations.of(context)!
                  //     .chang_your_password_easily,
                  onPresseed: () {
                    // Navigator.pushNamed(context, NewPassword.id);
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
                  title: AppLocalizations.of(context)!.profile_setting,
                  // sub_title: AppLocalizations.of(context)!
                  //     .make_changes_to_your_account,
                  onPresseed: () {
                    Navigator.pushNamed(context, EditDocProfile.id);
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
                  title: AppLocalizations.of(context)!.change_password,
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
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ),
          Positioned(
            top: 240.h,
            right: 100.w,
            left: 90.w,
            child: Container(
              alignment: Alignment.center,
              child: Column(
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
            ),
          ),
          Container(
            height: 191.h,
            color: Constant.primaryColor,
          ),
          Positioned(
            top: 120.h,
            right: 155.w,
            left: 155.w,
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
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(100.r)),
              ),
            ),
          ),
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
