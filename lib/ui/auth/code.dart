import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/ui/auth/reset.dart';
import 'package:graduation/widget/code_text_filed.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../provider/localization_provider.dart';
import '../../utiles/helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widget/customPrimaryButton.dart';

class CodeScreen extends StatefulWidget {
  CodeScreen({Key? key}) : super(key: key);
  // String? phoneNumber;
  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> with Helpers {
  late TextEditingController _one;
  late TextEditingController _two;
  late TextEditingController _three;
  late TextEditingController _four;

  String? _oneErorr;
  String? _twoErorr;
  String? _threeErorr;
  String? _fourErorr;

  @override
  void initState() {
    super.initState();

    _one = TextEditingController();
    _two = TextEditingController();
    _three = TextEditingController();
    _four = TextEditingController();
  }

  @override
  void dispose() {
    _one.dispose();
    _two.dispose();
    _three.dispose();
    _four.dispose();
    super.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as String;
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
          AppLocalizations.of(context)!.forgot_title,
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
          horizontal: 46.w,
        ),
        child: ListView(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 22.h),
            child: Image.asset(
              'images/code.png',
              height: 257.9.h,
              width: 251.36.w,
              matchTextDirection: true,
            ),
          ),
          Padding(
            padding: Provider.of<LocalizationProvider>(context, listen: true)
                        .languages ==
                    'en'
                ? EdgeInsets.only(left: 20.w, right: 50.w)
                : EdgeInsets.only(left: 130.w, right: 20.w),
            child: Text(
              AppLocalizations.of(context)!.code,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 30.sp,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: Provider.of<LocalizationProvider>(context, listen: true)
                        .languages ==
                    'en'
                ? EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h)
                : EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: RichText(
              text: TextSpan(
                  text: AppLocalizations.of(context)!.sent_code,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.grey,
                  ),
                  children: [
                    TextSpan(text: '  '),
                    TextSpan(
                      text: data,
                      style: GoogleFonts.poppins(
                        color: Constant.primaryColor,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CodeTextFiled(controller: _one),
                CodeTextFiled(controller: _two),
                CodeTextFiled(controller: _three),
                CodeTextFiled(controller: _four),
              ],
            ),
          ),
          SizedBox(
            height: 73.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: CustomPrimaryButton(
                text: AppLocalizations.of(context)!.submit,
                onPressed: () {
                  performLogin();
                }),
          ),
        ]),
      ),
    );
  }

  void performLogin() {
    if (checkData()) {
      login();
    }
  }

  bool checkData() {
    if (_one.text.isNotEmpty &&
        _two.text.isNotEmpty &&
        _three.text.isNotEmpty &&
        _four.text.isNotEmpty) {
      _controlErrorValue();
      return true;
    }
    _controlErrorValue();
    showSnackBar(context, message: 'Error,enter required data', erorr: true);

    return false;
  }

  void _controlErrorValue() {
    setState(
      () {
        _oneErorr = _one.text.isEmpty ? 'Error' : null;
        _twoErorr = _two.text.isEmpty ? 'Error' : null;
        _threeErorr = _three.text.isEmpty ? 'Error' : null;
        _fourErorr = _four.text.isEmpty ? 'Error' : null;
      },
    );
  }

  void login() {
    Navigator.pushReplacementNamed(context, ResetScreen.id);
  }
}
