import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/models/blood.dart';
import 'package:provider/provider.dart';

import '../../provider/localization_provider.dart';
import '../../widget/customPrimaryButton.dart';
import '../../widget/custom_text_filed.dart';
import '../../widget/mobile_text_filed.dart';
import '../../widget/social.dart';

class PatientSignUp extends StatefulWidget {
  const PatientSignUp({Key? key}) : super(key: key);
  static const id = 'PatientSignUp';

  @override
  State<PatientSignUp> createState() => _PatientSignUpState();
}

class _PatientSignUpState extends State<PatientSignUp> {
  late TapGestureRecognizer _tapGestureRecognizer;
  late TextEditingController _mobile;
  late TextEditingController _pass;
  late TextEditingController _name;
  late TextEditingController _fname;
  late TextEditingController _Lname;
  late TextEditingController _confirmpass;
  late TextEditingController _email;

  bool _passobsecure = true;
  bool _copassobsecure = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobile = TextEditingController();
    _pass = TextEditingController();
    _fname = TextEditingController();
    _Lname = TextEditingController();
    _name = TextEditingController();
    _email = TextEditingController();

    _confirmpass = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = createNewAccountAction;
  }

  bool agree = false;

  @override
  void dispose() {
    _mobile.dispose();
    _pass.dispose();
    _name.dispose();
    _confirmpass.dispose();
    _fname.dispose();
    _Lname.dispose();
    _email.dispose();

    super.dispose();
  }

  void createNewAccountAction() {
    // print('createNewAccountAction');
    // Navigator.pushNamed(context, '/RegisterScreen');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.sign_up,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 48.h),
        child: FadeInLeft(
          child: ListView(
            children: [
              Text(
                AppLocalizations.of(context)!.first_name,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextFiled(
                hint: AppLocalizations.of(context)!.enter_first_name,
                // prefixIcon: Icon(
                //   Icons.person_2_outlined,
                // ),
                controller: _fname,
                type: TextInputType.phone,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                AppLocalizations.of(context)!.last_name,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextFiled(
                hint: AppLocalizations.of(context)!.enter_last_name,
                // prefixIcon: Icon(
                //   Icons.person_2_outlined,
                // ),
                controller: _Lname,
                type: TextInputType.phone,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                AppLocalizations.of(context)!.email,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextFiled(
                hint: AppLocalizations.of(context)!.enter_email,
                prefixIcon: Icon(
                  Icons.email_outlined,
                ),
                controller: _email,
                type: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 16.h,
              ),
              // Text(
              //   AppLocalizations.of(context)!.phone_number,
              //   style: GoogleFonts.poppins(
              //     fontWeight: FontWeight.w600,
              //     fontSize: 18.sp,
              //     color: Colors.black,
              //   ),
              // ),
              // SizedBox(
              //   height: 10.h,
              // ),
              // MobileTextFiled(
              //   type: TextInputType.phone,
              //   controller: _mobile,
              //   // errorText: _MobileErorr,
              //   counter: 10,
              // ),
              Text(
                AppLocalizations.of(context)!.password,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextFiled(
                controller: _pass,
                type: TextInputType.text,
                prefixIcon: Icon(
                  Icons.lock_outlined,
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _passobsecure = !_passobsecure;
                      });
                    },
                    icon: Icon(_passobsecure
                        ? Icons.visibility_off
                        : Icons.visibility)),
                obscureText: _passobsecure,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                AppLocalizations.of(context)!.confirm,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextFiled(
                controller: _confirmpass,
                type: TextInputType.text,
                prefixIcon: Icon(
                  Icons.lock_outlined,
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _copassobsecure = !_copassobsecure;
                      });
                    },
                    icon: Icon(_copassobsecure
                        ? Icons.visibility_off
                        : Icons.visibility)),
                obscureText: _copassobsecure,
              ),

              Align(
                alignment:
                    Provider.of<LocalizationProvider>(context, listen: true)
                                .languages ==
                            'en'
                        ? Alignment.topRight
                        : Alignment.topLeft,
                child: Container(
                  child: RichText(
                    text: TextSpan(
                        text: AppLocalizations.of(context)!.i_agree,
                        style: GoogleFonts.poppins(
                          color: Colors.black87,
                        ),
                        children: [
                          TextSpan(text: '  '),
                          TextSpan(
                            text: AppLocalizations.of(context)!.terms,
                            style: GoogleFonts.poppins(
                              color: Constant.primaryColor,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              fontSize: 14.sp,
                            ),
                          ),
                          TextSpan(text: '  '),
                          TextSpan(
                            text: AppLocalizations.of(context)!.and,
                            style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontSize: 14.sp,
                            ),
                          ),
                          TextSpan(text: '  '),
                          TextSpan(
                            text: AppLocalizations.of(context)!.privacy,
                            style: GoogleFonts.poppins(
                              color: Constant.primaryColor,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              fontSize: 14.sp,
                            ),
                          ),
                        ]),
                  ),
                ),

                // child: Row(
                //   children: [
                //     Checkbox(
                //       value: agree,
                //       onChanged: (value) {
                //         setState(() {
                //           agree = value ?? false;
                //         });
                //       },
                //     ),
                //     Container(
                //       child: RichText(
                //         text: TextSpan(
                //             text: AppLocalizations.of(context)!.i_agree,
                //             style: GoogleFonts.poppins(
                //               color: Colors.black87,
                //             ),
                //             children: [
                //               TextSpan(text: '  '),
                //               TextSpan(
                //                 text: AppLocalizations.of(context)!.terms,
                //                 style: GoogleFonts.poppins(
                //                     color: Constant.primaryColor,
                //                     fontWeight: FontWeight.bold,
                //                     decoration: TextDecoration.none,
                //                     fontSize: 14.sp,),
                //               ),
                //               TextSpan(text: '  '),
                //               TextSpan(
                //                 text: AppLocalizations.of(context)!.and,
                //                 style: GoogleFonts.poppins(
                //                     color: Colors.black87, fontSize: 14.sp,),
                //               ),
                //               TextSpan(text: '  '),
                //               TextSpan(
                //                 text: AppLocalizations.of(context)!.privacy,
                //                 style: GoogleFonts.poppins(
                //                     color: Constant.primaryColor,
                //                     fontWeight: FontWeight.bold,
                //                     decoration: TextDecoration.none,
                //                     fontSize: 14.sp,),
                //               ),
                //             ]),
                //       ),
                //     ),
                //   ],
                // ),
              ),
              SizedBox(
                height: 43.h,
              ),
              CustomPrimaryButton(
                  text: AppLocalizations.of(context)!.sign_up,
                  onPressed: () {}),
              SizedBox(height: 8.h),
              SizedBox(
                height: 85.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
