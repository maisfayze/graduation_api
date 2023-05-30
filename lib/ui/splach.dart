import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/ui/Doctor/DocBtn/btn_doc.dart';
import 'package:graduation/ui/onBoarding/onboarding.dart';
import 'package:graduation/ui/patient/PatientBtn/btn_patient.dart';

import '../prefs/prefs.dart';

class SplachScreen extends StatefulWidget {
  static const String id = 'SplachScreen';

  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
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
    print(SharedPrefController().getValueFor('userType'));

    return Scaffold(
      body: Container(
        color: Constant.primaryColor,
        child: Column(
          children: [
            SizedBox(
              height: 292.h,
            ),
            Center(
              child: Image.network(
                'https://t3.ftcdn.net/jpg/01/01/10/44/360_F_101104446_ng7NrzPCRCN6yb5O7QVE050Vn5YWZnbC.jpg',
                width: 300.w,
                height: 300.h,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            // Center(
            //     child: Text(
            //   'ديوان رئيس الوزراء',
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 31.sp,
            //     fontWeight: FontWeight.w400,
            //   ),
            // )),
          ],
        ),
      ),
    );
  }
}
