import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    super.key,
    required this.img,
    required this.title,
    required this.subTitle,
  });
  final String img;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Lottie.network(
        //   'https://assets3.lottiefiles.com/packages/lf20_0fhlytwe.json',
        //   height: 300,
        //   width: 400,
        // ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Image.asset(
            img,
            height: 300,
            matchTextDirection: true,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInUp(
                child: Text(
                  '$title',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 24.sp, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              FadeInUp(
                child: Text(
                  '$subTitle',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
