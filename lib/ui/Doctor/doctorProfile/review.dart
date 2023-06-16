import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/constant.dart';
import '../../../controller/get_review_for_doctor.dart';
import '../../../controller/write_review.dart';
import '../../../models/review_model.dart';
import '../../../models/top_doctors.dart';
import '../../../prefs/prefs.dart';

class Review extends StatefulWidget {
  const Review({Key? key}) : super(key: key);
  static const id = 'Review';

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
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
          'Review',
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
      body: ListView(
        children: [
          FutureBuilder<List<ReviewModel>>(
            future: GetReview()
                .getReView(id: SharedPrefController().getValueFor('doctorId')),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Constant.primaryColor,
                  ),
                );
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                  ),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 220.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.r),
                            border: Border.all(
                                color: Colors.grey.shade300, width: .6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'http://ac7a1ae098-001-site1.etempurl.com${snapshot.data![index].patientImage}'),
                                        radius: 20.r),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            '${snapshot.data![index].creatdDate}',
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
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: Text(''),
                );
              }
            },
          ),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
