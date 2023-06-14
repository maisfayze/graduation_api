import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/ui/auth/code.dart';
import 'package:graduation/ui/auth/patient_login.dart';
import 'package:graduation/utiles/context_extention.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../controller/forget_pass_controller.dart';
import '../../models/api_response.dart';
import '../../provider/localization_provider.dart';
import '../../utiles/helpers.dart';
import '../../widget/customPrimaryButton.dart';
import '../../widget/custom_text_filed.dart';
import '../../widget/loading_custom_button.dart';
import '../../widget/mobile_text_filed.dart';
import '../booking/success.dart';
import 'doctor_login.dart';

class ResetScreen extends StatefulWidget {
  ResetScreen({Key? key, required this.email, this.data}) : super(key: key);
  static const id = 'ResetScreen';
  final String email;
  int? data;

  @override
  State<ResetScreen> createState() => _ResetScreenState(data);
}

class _ResetScreenState extends State<ResetScreen> with Helpers {
  late TextEditingController _pass;
  int? data;
  _ResetScreenState(this.data);
  late TextEditingController _confirmpass;
  bool _passobsecure = true;
  bool _copassobsecure = true;
  String? _NewErorr;
  String? _ConfNewErorr;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pass = TextEditingController();

    _confirmpass = TextEditingController();
  }

  bool agree = false;
  bool loading = false;

  @override
  void dispose() {
    _pass.dispose();

    _confirmpass.dispose();
    super.dispose();
  }

  void createNewAccountAction() {
    // print('createNewAccountAction');
    // Navigator.pushNamed(context, '/RegisterScreen');
  }

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
          AppLocalizations.of(context)!.reset_title,
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
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: ListView(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 22.h),
            child: Image.asset(
              'images/reset.png',
              height: 257.9.h,
              width: 251.36.w,
              matchTextDirection: true,
            ),
          ),
          Padding(
            padding: Provider.of<LocalizationProvider>(context, listen: true)
                        .languages ==
                    'en'
                ? EdgeInsets.only(left: 20.w, right: 100.w)
                : EdgeInsets.only(left: 55.w, right: 20.w),
            child: Text(
              AppLocalizations.of(context)!.reset,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 30.sp,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              AppLocalizations.of(context)!.new_pass,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomTextFiled(
              controller: _pass,
              type: TextInputType.text,
              errorText: _NewErorr,
              hint: '● ● ● ● ● ●',
              // prefixIcon: Icon(
              //   Icons.lock_outlined,
              // ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _passobsecure = !_passobsecure;
                  });
                },
                icon: Icon(
                    _passobsecure ? Icons.visibility_off : Icons.visibility),
                color: Color(0xffb4b4b4),
              ),
              obscureText: _passobsecure,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              AppLocalizations.of(context)!.confirm_new,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomTextFiled(
              controller: _confirmpass,
              type: TextInputType.text,
              errorText: _ConfNewErorr,
              hint: '● ● ● ● ● ●',
              // prefixIcon: Icon(
              //   Icons.lock_outlined,
              // ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _copassobsecure = !_copassobsecure;
                  });
                },
                icon: Icon(
                    _copassobsecure ? Icons.visibility_off : Icons.visibility),
                color: Color(0xffb4b4b4),
              ),
              obscureText: _copassobsecure,
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          loading
              ? loadingCustomButton()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomPrimaryButton(
                      text: AppLocalizations.of(context)!.submit,
                      onPressed: () {
                        performSubmit();
                      }),
                ),
          SizedBox(
            height: 66.h,
          ),
        ]),
      ),
    );
  }

  void performSubmit() {
    if (checkData()) {
      setState(() {
        loading = true;
      });
      login();
    }
  }

  bool checkData() {
    if (_confirmpass.text.isNotEmpty && _pass.text.isNotEmpty) {
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
        _ConfNewErorr = _confirmpass.text.isEmpty
            ? AppLocalizations.of(context)!.enter_pass
            : null;
        _NewErorr = _pass.text.isEmpty
            ? AppLocalizations.of(context)!.enter_pass
            : null;

        if (_pass.text != _confirmpass.text) {
          _NewErorr = AppLocalizations.of(context)!.not_match;
          _ConfNewErorr = AppLocalizations.of(context)!.not_match;
        }
      },
    );
  }

  void login() async {
    ApiResponse processResponse = await ForgetPassApiController().ResetPass(
        email: widget.email,
        newpass: _pass.text,
        confirmpass: _confirmpass.text);
    if (processResponse!.sucess) {
      buildShowDialog(context);
    }
    context.showSnakBar(
      message: processResponse.msg,
      error: !processResponse.sucess,
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // titlePadding: EdgeInsets.symmetric(horizontal: 34),
            title: Column(
              children: [
                Center(
                  child: Lottie.asset('images/succes.json',
                      width: 200.w, height: 200.h),
                ),
                Text(
                  'Your password has been changed successfully',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    color: Color(0xff272B41),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 39.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (data == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          settings: RouteSettings(arguments: 1),
                          builder: (context) => DoctorLoginPage(data: 1),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          settings: RouteSettings(arguments: 2),
                          builder: (context) => PatientLoginPage(data: 2),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'LOGIN ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      minimumSize: Size(155.w, 44.h),
                      backgroundColor: Constant.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r),
                      )),
                ),
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0.r)),
            // actionsPadding: EdgeInsets.only(bottom: 34),
          );
        });
  }
}
