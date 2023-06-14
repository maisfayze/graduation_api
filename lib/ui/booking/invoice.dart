import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';

import '../../models/invoice_data.dart';
import '../patient/PatientBtn/btn_patient.dart';
import '../patient/PatientBtn/my_appoitment_for_patient.dart';

class InvoiceScreen extends StatefulWidget {
  InvoiceScreen({Key? key, this.invoice}) : super(key: key);
  static const id = 'InvoiceScreen';

  Invoice? invoice;

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState(invoice);
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  Invoice? invoice;

  _InvoiceScreenState(this.invoice);

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
          'Invoices',
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
        padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 16.h),
        child: Column(
          children: [
            FadeInLeft(
              child: Image.asset(
                'images/logo.png',
                width: 300.w,
                height: 90.h,
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Divider(color: Colors.grey.shade300, thickness: 1.w),
            SizedBox(
              height: 14.h,
            ),
            InvoiceWidget(
              title: 'DoctorName',
              data: '${invoice!.docName}',
            ),
            SizedBox(
              height: 14.h,
            ),
            InvoiceWidget(
              title: 'Invoice',
              data: '100 ',
            ),
            SizedBox(
              height: 14.h,
            ),
            InvoiceWidget(
              title: 'Date',
              data: '${invoice!.data}',
            ),
            SizedBox(
              height: 14.h,
            ),
            InvoiceWidget(
              title: 'Day',
              data: '${invoice!.day}',
            ),
            SizedBox(
              height: 14.h,
            ),
            InvoiceWidget(
              title: 'Time',
              data: '${invoice!.time}',
            ),
            SizedBox(
              height: 14.h,
            ),
            InvoiceWidget(
              title: 'PaymentMethod',
              data: 'Cash',
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, BtnPatient.id);
                  },
                  child: Text(
                    'Go to Home',
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InvoiceWidget extends StatelessWidget {
  InvoiceWidget({
    super.key,
    required this.title,
    required this.data,
  });

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title :',
          style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp),
        ),
        Text(
          '${data}',
          style: GoogleFonts.poppins(
              color: Constant.primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp),
        ),
      ],
    );
  }
}
