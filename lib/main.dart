import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/prefs/prefs.dart';
import 'package:graduation/provider/fav_provider.dart';
import 'package:graduation/provider/localization_provider.dart';
import 'package:graduation/ui/Doctor/DocBtn/btn_doc.dart';
import 'package:graduation/ui/Doctor/doctorProfile/my_patient.dart';
import 'package:graduation/ui/Doctor/doctorProfile/doctor_profile.dart';
import 'package:graduation/ui/Doctor/doctorProfile/edit_doctor_profile.dart';
import 'package:graduation/ui/Doctor/doctorProfile/my_appointment.dart';
import 'package:graduation/ui/auth/auth.dart';
import 'package:graduation/ui/auth/doc_signup.dart';
import 'package:graduation/ui/auth/forget_pass.dart';
import 'package:graduation/ui/auth/getStarted.dart';
import 'package:graduation/ui/auth/doctor_login.dart';
import 'package:graduation/ui/auth/patient_login.dart';
import 'package:graduation/ui/auth/patient_sign_up.dart';
import 'package:graduation/ui/auth/reset.dart';
import 'package:graduation/ui/booking/view_doc_profile.dart';
import 'package:graduation/ui/onBoarding/onboarding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation/ui/patient/PatientBtn/btn_patient.dart';
import 'package:graduation/ui/patient/blogs.dart';
import 'package:graduation/ui/Doctor/schedule%20_timings.dart';
import 'package:graduation/ui/patient/my_favourite.dart';
import 'package:graduation/ui/patient/specialities.dart';
import 'package:graduation/ui/patient/top_doctors.dart';
import 'package:graduation/ui/patientProfile/edit_profile.dart';
import 'package:graduation/ui/patientProfile/new_pass.dart';
import 'package:graduation/ui/patientProfile/profile.dart';
import 'package:graduation/ui/patientProfile/profile_setting.dart';
import 'package:graduation/yarab.dart';

import 'package:provider/provider.dart';
import 'dart:io';

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           ((X509Certificate cert, String host, int port) {
//         final isValidHost =
//             ["192.168.1.109"].contains(host); // <-- allow only hosts in array
//         return isValidHost;
//       });
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // HttpOverrides.global = MyHttpOverrides();

  await SharedPrefController().initPreferences();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<FavouriteProvider>(
      create: (context) => FavouriteProvider(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LocalizationProvider>(
      create: (context) => LocalizationProvider(),
      builder: (context, child) {
        return ScreenUtilInit(
          designSize: const Size(414, 896),
          // designSize: const Size(313, 800),

          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              //***************localization**************//
              // localizationsDelegates: [
              //   AppLocalizations.delegate,
              //   GlobalMaterialLocalizations.delegate,
              //   GlobalCupertinoLocalizations.delegate,
              //   GlobalWidgetsLocalizations.delegate,
              // ],
              // supportedLocales: [
              //   Locale('en'),
              //   Locale('ar'),
              // ],
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: Locale(
                  Provider.of<LocalizationProvider>(context, listen: true)
                      .languages),
              title: 'Flutter Demo',
              initialRoute: ViewDoctorProfile.id,
              routes: {
                OnBoarding.id: (context) => OnBoarding(),
                Auth.id: (context) => Auth(),
                GetStarted.id: (context) => GetStarted(),
                DoctorLoginPage.id: (context) => DoctorLoginPage(),
                PatientLoginPage.id: (context) => PatientLoginPage(),
                PatientSignUp.id: (context) => PatientSignUp(),
                DocSignUp.id: (context) => DocSignUp(),
                ForgotScreen.id: (context) => ForgotScreen(),
                ResetScreen.id: (context) => ResetScreen(),
                BtnPatient.id: (context) => BtnPatient(),
                Specialities.id: (context) => Specialities(),
                TopDoctors.id: (context) => TopDoctors(),
                PatientProfile.id: (context) => PatientProfile(),
                ProfileSetting.id: (context) => ProfileSetting(),
                EditProfile.id: (context) => EditProfile(),
                NewPassword.id: (context) => NewPassword(),
                Favourites.id: (context) => Favourites(),
                Blogs.id: (context) => Blogs(),
                BtnDoc.id: (context) => BtnDoc(),
                DoctorProfile.id: (context) => DoctorProfile(),
                MyAppointments.id: (context) => MyAppointments(),
                MyPatients.id: (context) => MyPatients(),
                EditDocProfile.id: (context) => EditDocProfile(),
                ScheduleTimings.id: (context) => ScheduleTimings(),
                IntervalPicker.id: (context) => IntervalPicker(),
                ViewDoctorProfile.id: (context) => ViewDoctorProfile(),
              },
            );
          },
        );
      },
    );
  }
}
