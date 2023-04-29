import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/models/country.dart';
import 'package:provider/provider.dart';

import '../../provider/localization_provider.dart';
import '../../widget/customPrimaryButton.dart';
import '../../widget/custom_text_filed.dart';
import '../../widget/mobile_text_filed.dart';
import '../../widget/social.dart';

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

  late TextEditingController _confirmpass;
  bool _passobsecure = true;
  bool _copassobsecure = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobile = TextEditingController();
    _pass = TextEditingController();
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
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 48),
        child: FadeInLeft(
          child: ListView(
            children: [
              Text(
                AppLocalizations.of(context)!.name,
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
                hint: AppLocalizations.of(context)!.enter_name,
                prefixIcon: Icon(
                  Icons.person_2_outlined,
                ),
                controller: _name,
                type: TextInputType.phone,
              ),
              Text(
                AppLocalizations.of(context)!.email,
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
                hint: AppLocalizations.of(context)!.enter_email,
                prefixIcon: Icon(
                  Icons.email_outlined,
                ),
                controller: _email,
                type: TextInputType.emailAddress,
              ),
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
                // errorText: _MobileErorr,
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
              Text(
                AppLocalizations.of(context)!.confirm,
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
              SizedBox(
                height: 30,
              ),
              CustomPrimaryButton(
                  text: AppLocalizations.of(context)!.next, onPressed: () {}),
              SizedBox(height: 8),
              SizedBox(
                height: 73,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
