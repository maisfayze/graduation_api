import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/controller/patient_auth_api_controller.dart';
import 'package:graduation/models/blood.dart';
import 'package:graduation/utiles/context_extention.dart';
import 'package:provider/provider.dart';

import '../../controller/doctor_auth_api_controller.dart';
import '../../models/api_response.dart';
import '../../provider/localization_provider.dart';
import '../../widget/customPrimaryButton.dart';
import '../../widget/custom_text_filed.dart';
import '../../widget/mobile_text_filed.dart';
import '../../widget/social.dart';
import '../patient/PatientBtn/btn_patient.dart';

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
  bool loading = false;

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
      body: loading
          ? Center(
              child: CircularProgressIndicator(
                color: Constant.primaryColor,
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
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
                      type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 24.h,
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
                      type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 24.h,
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
                      controller: _email,
                      type: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 24.h,
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
                      hint: '● ● ● ● ● ●',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passobsecure = !_passobsecure;
                          });
                        },
                        icon: Icon(_passobsecure
                            ? Icons.visibility_off
                            : Icons.visibility),
                        color: Color(0xffb4b4b4),
                      ),
                      obscureText: _passobsecure,
                    ),
                    SizedBox(
                      height: 24.h,
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
                            : Icons.visibility),
                        color: Color(0xffb4b4b4),
                      ),
                      obscureText: _copassobsecure,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Align(
                      alignment: Provider.of<LocalizationProvider>(context,
                                      listen: true)
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
                        onPressed: () async {
                          await performSignUp();
                        }),
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

  Future<void> performSignUp() async {
    if (checkData()) {
      setState(() {
        loading = true;
      });
      await SignUp();
    }
  }

  bool checkData() {
    if (_fname.text.isNotEmpty &&
        _pass.text.isNotEmpty &&
        _Lname.text.isNotEmpty &&
        _email.text.isNotEmpty) {
      // _controlErrorValue();
      print('dats : ${_fname.text},,,${_pass.text}');

      return true;
    }
    // showSnackBar(context,
    //     message: AppLocalizations.of(context)!.error_message, erorr: true);

    context.showSnakBar(message: 'Enter Required Data !', error: true);

    return false;
  }

  // void _controlErrorValue() {
  //   setState(
  //     () {
  //       if (_email.text.isEmpty) {
  //         _MobileErorr = AppLocalizations.of(context)!.enter_mobile;
  //       } else if (_email.text.isNotEmpty && _mobile.text.length < 9) {
  //         _MobileErorr = AppLocalizations.of(context)!.valid_mobile;
  //       } else {
  //         _MobileErorr = null;
  //       }
  //
  //       _passwordErorr = _pass.text.isEmpty
  //           ? AppLocalizations.of(context)!.enter_pass
  //           : null;
  //     },
  //   );
  // }

  SignUp() async {
    ApiResponse apiResponse = await PatientAuthApiController().patientSignUp(
        firstName: _fname.text,
        lastName: _Lname.text,
        email: _email.text,
        pass: _pass.text);
    print('pass');

    if (apiResponse.sucess) {
      print('pass');
      Navigator.pushReplacementNamed(context, BtnPatient.id);
    }
    context.showSnakBar(message: apiResponse.msg, error: !apiResponse.sucess);
  }
}
