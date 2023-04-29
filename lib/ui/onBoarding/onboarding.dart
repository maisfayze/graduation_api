import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/ui/auth/auth.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../provider/localization_provider.dart';
import '../../widget/customPrimaryButton.dart';
import '../../widget/indecator.dart';
import '../../widget/onBoardingContent.dart';
import '../auth/doc_signup.dart';
import '../auth/forget_pass.dart';
import '../auth/getStarted.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../auth/login.dart';
import '../auth/patient_sign_up.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);
  static const id = 'OnBoarding';

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 28, left: 28, right: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async {
                      Provider.of<LocalizationProvider>(context, listen: false)
                          .changLang();
                    },
                    child: Text(
                      Provider.of<LocalizationProvider>(context, listen: true)
                          .languagesText,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: Color(0xff8B8989),
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Visibility(
                    visible: _currentPage < 2,
                    child: Text(
                      AppLocalizations.of(context)!.skip,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: Color(0xff8B8989),
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int currentPage) {
                  setState(() {
                    _currentPage = currentPage;
                  });
                },
                children: [
                  OnBoardingContent(
                    img: 'images/1.gif',
                    title: AppLocalizations.of(context)!.on1_title,
                    subTitle: AppLocalizations.of(context)!.on1_Subtitle,
                  ),
                  OnBoardingContent(
                    img: 'images/2.gif',
                    title: AppLocalizations.of(context)!.on2_title,
                    subTitle: AppLocalizations.of(context)!.on2_Subtitle,
                  ),
                  OnBoardingContent(
                    img: 'images/3.gif',
                    title: AppLocalizations.of(context)!.on3_title,
                    subTitle: AppLocalizations.of(context)!.on3_Subtitle,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 82,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Indecator(
                  isCurrentPage: _currentPage == 0,
                  marginEnd: 8,
                ),
                Indecator(
                  isCurrentPage: _currentPage == 1,
                  marginEnd: 8,
                ),
                Indecator(
                  isCurrentPage: _currentPage == 2,
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 46),
              child: CustomPrimaryButton(
                text: _currentPage < 2
                    ? AppLocalizations.of(context)!.next
                    : AppLocalizations.of(context)!.get_Started,
                onPressed: () {
                  // Navigator.pushNamed(context, DocSignUp.id);

                  Navigator.pushNamed(context, Auth.id);
                },
              ),
            ),
            SizedBox(
              height: 66,
            ),
          ],
        ),
      ),
    );
  }
}
