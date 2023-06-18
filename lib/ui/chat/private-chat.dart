import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';

import '../../models/top_doctors.dart';

class PrivateChat extends StatefulWidget {
  PrivateChat({Key? key, required this.data}) : super(key: key);
  static const id = 'PrivateChat';
  final TopDoctorsModel data;

  @override
  State<PrivateChat> createState() => _PrivateChatState();
}

class _PrivateChatState extends State<PrivateChat> {
  late TopDoctorsModel receivedData;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    receivedData = widget.data;
    controller = TextEditingController();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'http://ac7a1ae098-001-site1.etempurl.com${receivedData.doctorImage}'),
                radius: 18,
              ),
              SizedBox(
                width: 12.w,
              ),
              Text('${receivedData.doctorName}',
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp)),
            ],
          ),
          bottom: PreferredSize(
              child: Container(
                color: Constant.textFiledColor,
                height: 2.0,
              ),
              preferredSize: Size.fromHeight(4.0)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                          hintText: 'Type message..',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 26.w),
                          constraints: BoxConstraints(
                            maxHeight: 65.h,
                            minHeight: 65.h,
                          ),
                          // contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.normal,
                              color: Color(0xffb4b4b4)),
                          filled: false,
                          // fillColor: Constant.textFiledColor,
                          counterText: '',
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffe7e7e7), width: 1),
                            borderRadius: BorderRadius.circular(80.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Constant.primaryColor, width: 1),
                            borderRadius: BorderRadius.circular(80.r),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
                            borderRadius: BorderRadius.circular(80.r),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
                            borderRadius: BorderRadius.circular(80.r),
                          ),
                          errorStyle: GoogleFonts.poppins(fontSize: 12.sp)),

                      // border: InputBorder.none,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.r),
                        color: Constant.primaryColor),
                    child: Center(
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.send,
                            size: 20,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
