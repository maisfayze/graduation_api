import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/models/country.dart';
import 'package:graduation/ui/auth/patient_sign_up.dart';
import 'package:provider/provider.dart';

import '../../provider/localization_provider.dart';
import '../../utiles/helpers.dart';
import '../../widget/customPrimaryButton.dart';
import '../../widget/custom_text_filed.dart';
import '../../widget/mobile_text_filed.dart';
import '../../widget/social.dart';
import 'doc_signup.dart';
import 'forget_pass.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, this.data}) : super(key: key);
  static const id = 'LoginPage';
  int? data;
  @override
  State<LoginPage> createState() => _LoginPageState(data);
}

class _LoginPageState extends State<LoginPage> with Helpers {
  GlobalKey<FormState> _formKey = GlobalKey();
  int? data;
  _LoginPageState(this.data);
  late TapGestureRecognizer _tapGestureRecognizer;
  late TextEditingController _mobile;
  late TextEditingController _pass;
  String? _MobileErorr;
  String? _passwordErorr;
  bool _obsecure = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobile = TextEditingController();
    _pass = TextEditingController();

    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = createNewAccountAction;
  }

  @override
  void dispose() {
    _mobile.dispose();
    _pass.dispose();
    super.dispose();
  }

  void createNewAccountAction() {
    if (data == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          settings: RouteSettings(arguments: 1),
          builder: (context) => DocSignUp(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          settings: RouteSettings(arguments: 2),
          builder: (context) => PatientSignUp(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as int;

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
          AppLocalizations.of(context)!.login,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 46, vertical: 48),
        child: FadeInLeft(
          child: ListView(
            key: _formKey,
            children: [
              Text(
                AppLocalizations.of(context)!.phone_number,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MobileTextFiled(
                type: TextInputType.phone,
                controller: _mobile,
                errorText: _MobileErorr,
                counter: 10,
              ),
              Text(
                AppLocalizations.of(context)!.password,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
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
                    icon: Icon(
                        _obsecure ? Icons.visibility_off : Icons.visibility)),
                obscureText: _obsecure,
              ),
              Align(
                alignment:
                    Provider.of<LocalizationProvider>(context, listen: true)
                                .languages ==
                            'en'
                        ? Alignment.topRight
                        : Alignment.topLeft,
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ForgotScreen.id);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.forgot,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Constant.primaryColor,
                      ),
                    )),
              ),
              SizedBox(
                height: 16,
              ),
              CustomPrimaryButton(
                  text: AppLocalizations.of(context)!.login,
                  onPressed: () {
                    performLogin();
                  }),
              SizedBox(height: 8),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: AppLocalizations.of(context)!.dont_have_an_account,
                      style: GoogleFonts.poppins(
                        color: Colors.black87,
                      ),
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
                height: 75,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Color(0xffD6D6D6),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                height: 37,
              ),
              SocialMediaButton(
                imgName: 'gmail',
                text: AppLocalizations.of(context)!.gmail,
              ),
              SizedBox(
                height: 16,
              ),
              SocialMediaButton(
                imgName: 'facebook',
                text: AppLocalizations.of(context)!.facebook,
              ),
              SizedBox(
                height: 112,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void performLogin() {
    if (checkData()) {
      login();
    }
  }

  bool checkData() {
    if (_mobile.text.isNotEmpty && _pass.text.isNotEmpty) {
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

        _passwordErorr = _pass.text.isEmpty
            ? AppLocalizations.of(context)!.enter_pass
            : null;
      },
    );
  }

  void login() {
    Navigator.pushNamed(context, '');
  }
}
