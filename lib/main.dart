import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/prefs/prefs.dart';
import 'package:graduation/provider/fav_provider.dart';
import 'package:graduation/provider/localization_provider.dart';
import 'package:graduation/provider/search_filter_provider.dart';
import 'package:graduation/search_home.dart';
import 'package:graduation/ui/Doctor/DocBtn/btn_doc.dart';
import 'package:graduation/ui/Doctor/doctorProfile/my_patient.dart';
import 'package:graduation/ui/Doctor/doctorProfile/doctor_profile.dart';
import 'package:graduation/ui/Doctor/doctorProfile/edit_doctor_profile.dart';
import 'package:graduation/ui/Doctor/doctorProfile/my_patient_appointment.dart';
import 'package:graduation/ui/Doctor/doctorProfile/review.dart';
import 'package:graduation/ui/Doctor/doctorProfile/social_media.dart';
import 'package:graduation/ui/auth/auth.dart';
import 'package:graduation/ui/auth/doc_signup.dart';
import 'package:graduation/ui/auth/forget_pass.dart';
import 'package:graduation/ui/auth/getStarted.dart';
import 'package:graduation/ui/auth/doctor_login.dart';
import 'package:graduation/ui/auth/patient_login.dart';
import 'package:graduation/ui/auth/patient_sign_up.dart';
import 'package:graduation/ui/auth/reset.dart';
import 'package:graduation/ui/booking/booking.dart';
import 'package:graduation/ui/booking/success.dart';
import 'package:graduation/ui/booking/view_doc_profile.dart';
import 'package:graduation/ui/chat/private-chat.dart';
import 'package:graduation/ui/drawerScreens/about_us.dart';
import 'package:graduation/ui/drawerScreens/asked_questions.dart';
import 'package:graduation/ui/drawerScreens/client_saying.dart';
import 'package:graduation/ui/drawerScreens/filter.dart';
import 'package:graduation/ui/onBoarding/onboarding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation/ui/patient/PatientBtn/btn_patient.dart';
import 'package:graduation/ui/patient/PatientBtn/my_appoitment_for_patient.dart';
import 'package:graduation/ui/patient/blogs.dart';
import 'package:graduation/ui/Doctor/schedule%20_timings.dart';
import 'package:graduation/ui/patient/my_favourite.dart';
import 'package:graduation/ui/patient/specialities.dart';
import 'package:graduation/ui/patient/top_doctors.dart';
import 'package:graduation/ui/patientProfile/edit_profile.dart';
import 'package:graduation/ui/patientProfile/new_pass.dart';
import 'package:graduation/ui/patientProfile/patient_dashboard.dart';
import 'package:graduation/ui/patientProfile/profile.dart';
import 'package:graduation/ui/patientProfile/profile_setting.dart';
import 'package:graduation/ui/drawerScreens/search_page.dart';
import 'package:graduation/ui/splach.dart';
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
    ),
    ChangeNotifierProvider<FilterProvider>(
      create: (context) => FilterProvider(),
    ),
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
              theme: ThemeData(
                primarySwatch: Colors.teal,
                radioTheme: RadioThemeData(
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => Constant.primaryColor),
                ),
              ),
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
              initialRoute: SplashScreen.id,
              routes: {
                SplashScreen.id: (context) => SplashScreen(),
                OnBoarding.id: (context) => OnBoarding(),
                SearchPage.id: (context) => SearchPage(),
                FilterScreen.id: (context) => FilterScreen(),
                Auth.id: (context) => Auth(),
                GetStarted.id: (context) => GetStarted(),
                DoctorLoginPage.id: (context) => DoctorLoginPage(),
                PatientLoginPage.id: (context) => PatientLoginPage(),
                PatientSignUp.id: (context) => PatientSignUp(),
                DocSignUp.id: (context) => DocSignUp(),
                ForgotScreen.id: (context) => ForgotScreen(),
                // ResetScreen.id: (context) => ResetScreen(),
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
                MyPatientAppointments.id: (context) => MyPatientAppointments(),
                MyPatients.id: (context) => MyPatients(),
                EditDocProfile.id: (context) => EditDocProfile(),
                ScheduleTimings.id: (context) => ScheduleTimings(),
                IntervalPicker.id: (context) => IntervalPicker(),
                ViewDoctorProfile.id: (context) => ViewDoctorProfile(),
                Booking.id: (context) => Booking(),
                Success.id: (context) => Success(),
                MyAppointment.id: (context) => MyAppointment(),
                PatientDashboard.id: (context) => PatientDashboard(),
                SearchHome.id: (context) => SearchHome(),
                AskedQuestions.id: (context) => AskedQuestions(),
                ClientSaying.id: (context) => ClientSaying(),
                AboutUs.id: (context) => AboutUs(),
                SocialMedia.id: (context) => SocialMedia(),
                Review.id: (context) => Review(),
                // PrivateChat.id: (context) => PrivateChat(),
              },
            );
          },
        );
      },
    );
  }
}
