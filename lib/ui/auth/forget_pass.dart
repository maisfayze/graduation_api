import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/ui/auth/code.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../controller/forget_pass_controller.dart';
import '../../provider/localization_provider.dart';
import '../../utiles/helpers.dart';
import '../../widget/customPrimaryButton.dart';
import '../../widget/custom_text_filed.dart';
import '../../widget/loading_custom_button.dart';
import '../../widget/mobile_text_filed.dart';

class ForgotScreen extends StatefulWidget {
  ForgotScreen({Key? key, this.data}) : super(key: key);
  static const id = 'ForgotScreen';
  int? data;

  @override
  State<ForgotScreen> createState() => _ForgotScreenState(data);
}

class _ForgotScreenState extends State<ForgotScreen> with Helpers {
  late TextEditingController _email;
  GlobalKey<FormState> _formKey = GlobalKey();
  int? data;
  _ForgotScreenState(this.data);
  String? _EmailErorr;
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _email = TextEditingController();
  }

  void dispose() {
    _email.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as int;

    return SafeArea(
      child: Scaffold(
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
            horizontal: 20.w,
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
                  ? EdgeInsets.only(left: 12.w, right: 100.w)
                  : EdgeInsets.only(left: 120.w, right: 20.w),
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
                  ? EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h)
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
              child: CustomTextFiled(
                hint: 'email@example.com',
                // prefixIcon: Icon(
                //   Icons.email_outlined,
                // ),
                controller: _email,
                type: TextInputType.emailAddress,
                errorText: _EmailErorr,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            loading
                ? loadingCustomButton()
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.h),
                    child: CustomPrimaryButton(
                        text: AppLocalizations.of(context)!.submit,
                        onPressed: () {
                          performSubmit();
                        }),
                  ),
            SizedBox(
              height: 50.h,
            ),
          ]),
        ),
      ),
    );
  }

  void performSubmit() {
    if (checkData()) {
      setState(() {
        loading = true;
      });
      submit();
    }
  }

  bool checkData() {
    if (_email.text.isNotEmpty) {
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
        if (_email.text.isEmpty) {
          _EmailErorr = AppLocalizations.of(context)!.enter_mobile;
        } else {
          _EmailErorr = null;
        }
      },
    );
  }

  Future<void> submit() async {
    bool status =
        await ForgetPassApiController().forgetPass(email: _email.text);
    if (status) {
      Navigator.push(
        context,
        MaterialPageRoute(
          settings: RouteSettings(arguments: data),
          builder: (context) => CodeScreen(
            email: _email.text,
          ),
        ),
      );
    }
  }
}
