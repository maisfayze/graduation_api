import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/controller/doctor_auth_api_controller.dart';
import 'package:graduation/models/api_response.dart';
import 'package:graduation/models/blood.dart';
import 'package:graduation/ui/auth/doctor_login.dart';
import 'package:graduation/ui/patient/PatientBtn/btn_patient.dart';
import 'package:graduation/utiles/context_extention.dart';
import 'package:provider/provider.dart';

import '../../provider/localization_provider.dart';
import '../../widget/customPrimaryButton.dart';
import '../../widget/custom_text_filed.dart';
import '../../widget/loading_custom_button.dart';
import '../../widget/mobile_text_filed.dart';
import '../../widget/social.dart';
import '../Doctor/DocBtn/btn_doc.dart';

class DocSignUp extends StatefulWidget {
  const DocSignUp({Key? key}) : super(key: key);
  static const id = 'DocSignUp';

  @override
  State<DocSignUp> createState() => _DocSignUpState();
}

class _DocSignUpState extends State<DocSignUp> {
  late TapGestureRecognizer _tapGestureRecognizer;
  late TextEditingController _mobile;
  late TextEditingController _pass;
  late TextEditingController _email;
  late TextEditingController _name;
  late TextEditingController _fname;
  late TextEditingController _Lname;
  late TextEditingController _confirmpass;
  bool _passobsecure = true;
  bool _copassobsecure = true;
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobile = TextEditingController();
    _pass = TextEditingController();
    _fname = TextEditingController();
    _Lname = TextEditingController();
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
    _email.dispose();
    _fname.dispose();
    _Lname.dispose();
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
      resizeToAvoidBottomInset: true,
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
              //fname
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
                type: TextInputType.name,
              ),
              //lsname
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
                type: TextInputType.name,
              ),
              SizedBox(
                height: 16.h,
              ),
              //email
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
              //pass
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
                hint: '● ● ● ● ● ●',
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
              SizedBox(
                height: 30.h,
              ),
              loading
                  ? loadingCustomButton()
                  : CustomPrimaryButton(
                      text: AppLocalizations.of(context)!.submit,
                      onPressed: () async {
                        await performSignUp();
                      }),
              SizedBox(height: 8.h),
              Container(
                height: MediaQuery.of(context).viewInsets.bottom,
              ),
              SizedBox(
                height: 73.h,
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
    ApiResponse processResponse = await DoctorAuthApiController().docSignUp(
        firstName: _fname.text,
        lastName: _Lname.text,
        email: _email.text,
        pass: _pass.text);

    if (processResponse.sucess) {
      print('pass2');
      Navigator.pushReplacementNamed(context, BtnDoc.id);
    } else {
      context.showSnakBar(
        message: processResponse.msg,
        error: !processResponse.sucess,
      );
    }
  }
}
