import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/constant.dart';
import '../../../controller/get_review_for_doctor.dart';
import '../../../controller/write_review.dart';
import '../../../models/review_model.dart';
import '../../../models/top_doctors.dart';

class ReviewTab extends StatefulWidget {
  const ReviewTab({Key? key, required this.data}) : super(key: key);
  static const id = 'ReviewTab';
  final TopDoctorsModel data;

  @override
  State<ReviewTab> createState() => _ReviewTabState();
}

class _ReviewTabState extends State<ReviewTab> {
  late TopDoctorsModel receivedData;
  late TextEditingController _review;

  @override
  void initState() {
    super.initState();
    receivedData = widget.data;
    _review = TextEditingController();
  }

  void dispose() {
    _review.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: true,
      body: ListView(
        children: [
          FutureBuilder<List<ReviewModel>>(
            future: GetReview().getReView(id: receivedData.doctorId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                print('my data no ');

                return Center(
                  child: CircularProgressIndicator(
                    color: Constant.primaryColor,
                  ),
                );
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                print('my data${snapshot.data}');

                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 22.h),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'http://ac7a1ae098-001-site1.etempurl.com${snapshot.data![index].patientImage}'),
                                  radius: 20.r),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 10.0.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index].patientName,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.sp,
                                        color: Color(0xff272B41),
                                      ),
                                    ),
                                    Text(
                                      '${snapshot.data![index].created}',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.sp,
                                        color: Color(0xff757575),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            width: 350.w,
                            child: Text(
                              '${snapshot.data![index].review}',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                color: Color(0xff757575),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: Text('error'),
                );
              }
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 22.h),
            child: Text(
              'Write a review for dr.${receivedData.doctorName}',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                color: Color(0xff272B41),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Text(
              'Your Review',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                color: Color(0xff6B7280),
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: TextField(
              controller: _review,
              keyboardType: TextInputType.text,
              minLines: 5,
              maxLines: 5,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 26.w, vertical: 12.h),
                  constraints: BoxConstraints(
                    maxHeight: 130.h,
                    minHeight: 130.h,
                  ),
                  // contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                      color: Color(0xffb4b4b4)),
                  filled: false,
                  // fillColor: Constant.textFiledColor,
                  counterText: '',
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffe7e7e7), width: 1),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Constant.primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  errorStyle: GoogleFonts.poppins(fontSize: 12.sp)),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    bool processResponse = await WriteReview().writeComment(
                        id: receivedData.doctorId, comment: _review.text);
                    if (processResponse) {
                      setState(() {});
                      _review.clear();
                    } else
                      (print('falied sorry'));
                  },
                  child: Text(
                    'Add Review',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      minimumSize: Size(150.w, 60.h),
                      maximumSize: Size(150.w, 60.h),
                      backgroundColor: Constant.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r),
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80.h,
          ),
        ],
      ),
    );
  }
}
