import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/constant.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({Key? key}) : super(key: key);
  static const id = 'SocialMedia';
  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  late TextEditingController _facebook;
  late TextEditingController _twitter;
  late TextEditingController _insta;
  late TextEditingController _linked;
  late TextEditingController _website;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _facebook = TextEditingController();
    _twitter = TextEditingController();
    _linked = TextEditingController();
    _website = TextEditingController();
    _insta = TextEditingController();
  }

  bool agree = false;

  @override
  void dispose() {
    _facebook.dispose();
    _twitter.dispose();
    _insta.dispose();
    _linked.dispose();
    _website.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Social Media',
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
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Social Media',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 18.sp),
            ),
            SizedBox(
              height: 12.h,
            ),
            CustomSocialfiled(
              controller: _facebook,
              title: 'Facebook URL',
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomSocialfiled(
              controller: _twitter,
              title: 'Twitter URL',
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomSocialfiled(
              controller: _insta,
              title: 'Instagram URL',
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomSocialfiled(
              controller: _linked,
              title: 'Linkedin URL',
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomSocialfiled(
              controller: _website,
              title: 'Website URL',
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 190.w),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Save Changes',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    maximumSize: Size(100.w, 50.h),
                    minimumSize: Size(100.w, 50.h),
                    backgroundColor: Constant.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    )),
              ),
            ),
            SizedBox(
              height: 80.h,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSocialfiled extends StatelessWidget {
  CustomSocialfiled(
      {super.key,
      this.counter,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false,
      required this.controller,
      this.errorText,
      this.hint,
      required this.title});
  int? counter;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool obscureText = false;
  String? hint;
  String? errorText;
  final String title;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title',
          style: GoogleFonts.poppins(
              fontSize: 16.sp,
              color: Color(0xff6B7280),
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 12.h,
        ),
        TextField(
          controller: controller,
          keyboardType: TextInputType.text,
          obscureText: obscureText,
          minLines: 1,
          maxLines: 1,
          decoration: InputDecoration(
              hintText: hint,
              contentPadding: EdgeInsets.symmetric(horizontal: 26.w),
              constraints: BoxConstraints(
                maxHeight: errorText == null ? 60.h : 85.h,
                minHeight: 60.h,
              ),
              // contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              hintStyle: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                  color: Color(0xffb4b4b4)),
              filled: false,
              errorText: errorText,
              // fillColor: Constant.textFiledColor,
              counterText: '',
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe7e7e7), width: 1.5),
                borderRadius: BorderRadius.circular(10.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Constant.primaryColor, width: 1.5),
                borderRadius: BorderRadius.circular(10.r),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.5),
                borderRadius: BorderRadius.circular(10.r),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.5),
                borderRadius: BorderRadius.circular(10.r),
              ),
              errorStyle: GoogleFonts.poppins(fontSize: 12.sp)),
          maxLength: counter,
        ),
      ],
    );
  }
}
