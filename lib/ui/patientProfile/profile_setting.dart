import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../provider/localization_provider.dart';
import '../../widget/profile_sett.dart';
import '../../widget/profile_widget.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({Key? key}) : super(key: key);
  static const id = 'ProfileSetting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        shape: Border(
          bottom: BorderSide(
            color: Constant.primaryColor,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black,
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Constant.primaryColor,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // background image and bottom contents
          Column(
            children: <Widget>[
              Container(
                height: 10.0.h,
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
                            horizontal: 40.w, vertical: 85.h),
                        child: Column(
                          children: [
                            ProfileSett(
                              img: 'edit',
                              title: AppLocalizations.of(context)!
                                  .edit_personal_information,
                              onPresseed: () {},
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            ProfileSett(
                              img: 'pass',
                              title:
                                  AppLocalizations.of(context)!.change_password,
                              onPresseed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          // ProfileSetting image
          Positioned(
            top: 42.0, // (background container size) - (circle height / 2)
            child: Container(
              height: 110.0.h,
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
}
