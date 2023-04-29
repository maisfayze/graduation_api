import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/ui/auth/code.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../provider/localization_provider.dart';
import '../../utiles/helpers.dart';
import '../../widget/customPrimaryButton.dart';
import '../../widget/mobile_text_filed.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);
  static const id = 'ForgotScreen';

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> with Helpers {
  late TextEditingController _mobile;
  GlobalKey<FormState> _formKey = GlobalKey();

  String? _MobileErorr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobile = TextEditingController();
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
        child: ListView(key: _formKey, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 22.h),
            child: Image.asset(
              'images/forgot.png',
              height: 257.9.h,
              width: 251.36.w,
              matchTextDirection: true,
            ),
          ),
          Padding(
            padding: Provider.of<LocalizationProvider>(context, listen: true)
                        .languages ==
                    'en'
                ? EdgeInsets.only(left: 12, right: 50)
                : EdgeInsets.only(left: 120, right: 20),
            child: Text(
              AppLocalizations.of(context)!.forgot,
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
                ? EdgeInsets.symmetric(horizontal: 12.w, vertical: 25.h)
                : EdgeInsets.symmetric(horizontal: 12.w, vertical: 25.h),
            child: Text(
              AppLocalizations.of(context)!.forgot_sub,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            child: MobileTextFiled(
              type: TextInputType.phone,
              controller: _mobile,
              errorText: _MobileErorr,
              counter: 10,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            child: CustomPrimaryButton(
                text: AppLocalizations.of(context)!.submit,
                onPressed: () {
                  performSubmit();
                }),
          ),
        ]),
      ),
    );
  }

  void performSubmit() {
    if (checkData()) {
      submit();
    }
  }

  bool checkData() {
    if (_mobile.text.isNotEmpty) {
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
        if (_mobile.text.isEmpty) {
          _MobileErorr = AppLocalizations.of(context)!.enter_mobile;
        } else if (_mobile.text.isNotEmpty && _mobile.text.length < 9) {
          _MobileErorr = AppLocalizations.of(context)!.valid_mobile;
        } else {
          _MobileErorr = null;
        }
      },
    );
  }

  void submit() {
    Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(arguments: _mobile.text),
        builder: (context) => CodeScreen(),
      ),
    );
  }
}
