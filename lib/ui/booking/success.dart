import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../constant/constant.dart';
import '../../models/invoice_data.dart';
import '../patient/PatientBtn/my_appoitment_for_patient.dart';
import 'invoice.dart';

class Success extends StatefulWidget {
  Success({Key? key, this.invoice}) : super(key: key);
  static const id = 'Success';
  Invoice? invoice;

  @override
  State<Success> createState() => _SuccessState(invoice);
}

class _SuccessState extends State<Success> {
  String? _payment = 'Cash';
  Invoice? invoice;

  _SuccessState(this.invoice);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
          'Booking',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Lottie.asset('images/succes.json', width: 300.w, height: 200.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 80.h),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Your appointment has been successfully selected',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  color: Color(0xff272B41),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.h),
            child: Text(
              'To complete the process, please select a payment method',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff6B7280)),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 125.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RadioMenuButton(
                    value: 'Cash',
                    groupValue: _payment,
                    onChanged: (String? value) {
                      setState(() => _payment = value);
                    },
                    child: Text(
                      'Cash',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Color(0xff272B41),
                      ),
                    )),
                RadioMenuButton(
                    value: 'jawal Pay',
                    groupValue: _payment,
                    onChanged: (String? value) {
                      setState(() => _payment = value);
                    },
                    child: Text(
                      'jawal Pay',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Color(0xff272B41),
                      ),
                    )),
                RadioMenuButton(
                    value: 'Credit card',
                    groupValue: _payment,
                    onChanged: (String? value) {
                      setState(() => _payment = value);
                    },
                    child: Text(
                      'Credit card',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Color(0xff272B41),
                      ),
                    )),
                SizedBox(
                  height: 33.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    buildShowDialog(context);
                  },
                  child: Text(
                    'confirm',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      minimumSize: Size(100.w, 44.h),
                      backgroundColor: Constant.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r),
                      )),
                ),
              ],
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Spacer(),
        ],
      ),
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
                  'Appointment booked successfully!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    color: Color(0xff272B41),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Appointment booked with Dr.${widget.invoice!.docName} on ${widget.invoice!.data} ${widget.invoice!.time}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff6B7280)),
                ),
                SizedBox(
                  height: 35.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        settings: RouteSettings(),
                        builder: (context) => InvoiceScreen(invoice: invoice),
                      ),
                    );
                  },
                  child: Text(
                    'View Invoice ',
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyAppointment.id);
                  },
                  child: Text(
                    'View Appointment',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Constant.primaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    minimumSize: Size(160.w, 44.h),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      side: BorderSide(
                        width: 1,
                        color: Constant.primaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 58.h,
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
