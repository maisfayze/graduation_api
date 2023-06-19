import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/ui/Doctor/DocBtn/btn_doc.dart';
import 'package:graduation/ui/onBoarding/onboarding.dart';
import 'package:graduation/ui/patient/PatientBtn/btn_patient.dart';

import '../prefs/prefs.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'SplachScreen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 4),
      () {
        if (SharedPrefController().getValueFor('userType') == 'Doctor') {
          String rout =
              SharedPrefController().LoggedIn ? BtnDoc.id : OnBoarding.id;
          Navigator.pushReplacementNamed(context, rout);
        } else {
          String rout =
              SharedPrefController().LoggedIn ? BtnPatient.id : OnBoarding.id;
          Navigator.pushReplacementNamed(context, rout);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('${SharedPrefController().getValueFor('id')}');

    return Scaffold(
      body: Container(
        color: Constant.primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInLeftBig(
              child: Center(
                child: Image.asset(
                  'images/test_Splach.gif',
                  width: 500.w,
                  height: 800.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
