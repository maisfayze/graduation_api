import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/models/top_doctors.dart';
import 'package:graduation/widget/customPrimaryButton.dart';

import '../../../constant/constant.dart';
import '../booking.dart';

class OverViewTab extends StatefulWidget {
  OverViewTab({Key? key, required this.data}) : super(key: key);
  final TopDoctorsModel data;
  @override
  State<OverViewTab> createState() => _OverViewTabState();
}

class _OverViewTabState extends State<OverViewTab> {
  late TopDoctorsModel receivedData;

  @override
  void initState() {
    super.initState();
    receivedData = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 22.h),
        child: ListView(children: [
          Text(
            'About Me',
            style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff272B41)),
          ),
          SizedBox(
            height: 10.h,
          ),
          //data from api
          Text(
            'I’m Dentist Dareen Elder , '
            'Dental Surgeon, Invisalign® Certified Provider, '
            'and your go-to for a perfect smile.'
            ' I have nearly 4 years of experience in the field of Dental Services.',
            style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: Color(0xff6B7280)),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Education',
            style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff272B41)),
          ),
          SizedBox(
            height: 10.h,
          ),
          //data from api
          Text(
            'American Dental Medical University',
            style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: Color(0xff6B7280)),
          ),

          SizedBox(
            height: 20.h,
          ),
          Text(
            'Work & Experience',
            style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff272B41)),
          ),
          SizedBox(
            height: 10.h,
          ),
          //data from api
          Text(
            'Glowing Smiles Family Dental Clinic',
            style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: Color(0xff6B7280)),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Awards',
            style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff272B41)),
          ),
          SizedBox(
            height: 10.h,
          ),
          //data from api
          Text(
            'Humanitarian Award',
            style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: Color(0xff6B7280)),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Services',
            style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff272B41)),
          ),
          SizedBox(
            height: 10.h,
          ),
          //data from api
          Text(
            'Children Care',
            style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: Color(0xff6B7280)),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Equipments',
            style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff272B41)),
          ),
          SizedBox(
            height: 10.h,
          ),
          //data from api
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.network(
                  'https://www.solvay.com/sites/g/files/srpend221/files/styles/header/https/media.solvay.com/medias/domain1446/media691/105853-icsk55gsky.jpg?itok=yUPrgF8p',
                  fit: BoxFit.cover,
                  width: 63.w,
                  height: 63.h,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpRm0B3x7lImqnHxybdDsZuzQYBOugOWyoMJ5fslgVGPwvYS778Ok2rABUUXjdpgdYYeA&usqp=CAU',
                  fit: BoxFit.cover,
                  width: 63.w,
                  height: 63.h,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.0.w),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: RouteSettings(arguments: receivedData),
                    builder: (context) => Booking(),
                  ),
                );
                // Navigator.pushNamed(context, Booking.id);
              },
              child: Text(
                'Book Appointment',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              ),
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  minimumSize: Size(100.w, 59.h),
                  backgroundColor: Constant.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  )),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
        ]),
      ),
    );
  }
}
