import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graduation/provider/localization_provider.dart';
import 'package:graduation/ui/auth/auth.dart';
import 'package:graduation/ui/auth/doc_signup.dart';
import 'package:graduation/ui/auth/forget_pass.dart';
import 'package:graduation/ui/auth/getStarted.dart';
import 'package:graduation/ui/auth/login.dart';
import 'package:graduation/ui/auth/patient_sign_up.dart';
import 'package:graduation/ui/auth/reset.dart';
import 'package:graduation/ui/onBoarding/onboarding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LocalizationProvider>(
      create: (context) => LocalizationProvider(),
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
          initialRoute: OnBoarding.id,
          routes: {
            OnBoarding.id: (context) => OnBoarding(),
            Auth.id: (context) => Auth(),
            GetStarted.id: (context) => GetStarted(),
            LoginPage.id: (context) => LoginPage(),
            PatientSignUp.id: (context) => PatientSignUp(),
            DocSignUp.id: (context) => DocSignUp(),
            ForgotScreen.id: (context) => ForgotScreen(),
            ResetScreen.id: (context) => ResetScreen(),
          },
        );
      },
    );
  }
}
