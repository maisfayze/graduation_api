import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/models/LogedUser.dart';
import 'package:graduation/models/blood.dart';
import 'package:graduation/ui/Doctor/DocBtn/btn_doc.dart';
import 'package:graduation/ui/auth/patient_sign_up.dart';
import 'package:graduation/utiles/context_extention.dart';
import 'package:provider/provider.dart';

import '../../controller/doctor_auth_api_controller.dart';
import '../../models/api_response.dart';
import '../../provider/localization_provider.dart';
import '../../utiles/helpers.dart';
import '../../widget/customPrimaryButton.dart';
import '../../widget/custom_text_filed.dart';
import '../../widget/mobile_text_filed.dart';
import '../../widget/social.dart';
import '../patient/PatientBtn/btn_patient.dart';
import 'doc_signup.dart';
import 'forget_pass.dart';

class DoctorLoginPage extends StatefulWidget {
  DoctorLoginPage({Key? key, this.data}) : super(key: key);
  static const id = 'DoctorLoginPage';
  int? data;
  @override
  State<DoctorLoginPage> createState() => _DoctorLoginPageState(data);
}

class _DoctorLoginPageState extends State<DoctorLoginPage> with Helpers {
  GlobalKey<FormState> _formKey = GlobalKey();
  int? data;
  _DoctorLoginPageState(this.data);
  late TapGestureRecognizer _tapGestureRecognizer;
  late TextEditingController _mobile;
  late TextEditingController _pass;
  bool loading = false;

  String? _EmailErorr;
  String? _passwordErorr;
  bool _obsecure = true;
  late TextEditingController _email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobile = TextEditingController();
    _pass = TextEditingController();
    _email = TextEditingController();

    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = createNewAccountAction;
  }

  @override
  void dispose() {
    _mobile.dispose();
    _pass.dispose();
    _email.dispose();

    super.dispose();
  }

  void createNewAccountAction() {
    Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(arguments: 1),
        builder: (context) => DocSignUp(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          AppLocalizations.of(context)!.login,
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
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              child: FadeInLeft(
                child: ListView(
                  key: _formKey,
                  children: [
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
                      errorText: _EmailErorr,
                      hint: AppLocalizations.of(context)!.enter_email,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                      ),
                      controller: _email,
                      type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
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
                      errorText: _passwordErorr,
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obsecure = !_obsecure;
                            });
                          },
                          icon: Icon(_obsecure
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      obscureText: _obsecure,
                    ),
                    Align(
                      alignment: Provider.of<LocalizationProvider>(context,
                                      listen: true)
                                  .languages ==
                              'en'
                          ? Alignment.topRight
                          : Alignment.topLeft,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                settings: RouteSettings(arguments: 1),
                                builder: (context) => ForgotScreen(data: 1),
                              ),
                            );
                          },
                          child: Text(
                            AppLocalizations.of(context)!.forgot,
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Constant.primaryColor,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomPrimaryButton(
                        text: AppLocalizations.of(context)!.login,
                        onPressed: () {
                          performLogin();
                        }),
                    SizedBox(height: 8.h),
                    Center(
                      child: RichText(
                        text: TextSpan(
                            text: AppLocalizations.of(context)!
                                .dont_have_an_account,
                            style: GoogleFonts.poppins(
                                color: Colors.black87, fontSize: 16.sp),
                            children: [
                              TextSpan(text: '  '),
                              TextSpan(
                                text: AppLocalizations.of(context)!.sign_up,
                                recognizer: _tapGestureRecognizer,
                                style: GoogleFonts.poppins(
                                  color: Constant.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 75.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Color(0xffD6D6D6),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.h),
                          child: Text(
                            AppLocalizations.of(context)!.or,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffB9B5B5),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color(0xffD6D6D6),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 37.h,
                    ),
                    SocialMediaButton(
                      imgName: 'gmail',
                      text: AppLocalizations.of(context)!.gmail,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SocialMediaButton(
                      imgName: 'facebook',
                      text: AppLocalizations.of(context)!.facebook,
                    ),
                    SizedBox(
                      height: 112.h,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void performLogin() {
    if (checkData()) {
      setState(() {
        loading = true;
      });
      login();
    }
  }

  bool checkData() {
    if (_email.text.isNotEmpty && _pass.text.isNotEmpty) {
      _controlErrorValue();
      return true;
    }
    _controlErrorValue();
    showSnackBar(context,
        message: AppLocalizations.of(context)!.error_message, erorr: true);

    return false;
  }

  void _controlErrorValue() {
    setState(
      () {
        _EmailErorr = _email.text.isEmpty
            ? AppLocalizations.of(context)!.enter_email
            : null;

        _passwordErorr = _pass.text.isEmpty
            ? AppLocalizations.of(context)!.enter_pass
            : null;
      },
    );
  }

  void login() async {
    ApiResponse processResponse =
        await DoctorAuthApiController().docLogin(user: user);
    if (processResponse.sucess) {
      Navigator.pushNamed(context, BtnDoc.id);
    }
    context.showSnakBar(
      message: processResponse.msg,
      error: !processResponse.sucess,
    );
  }

  LogedUser get user {
    LogedUser user = LogedUser();
    user.email = _email.text;
    user.password = _pass.text;

    return user;
  }
}
