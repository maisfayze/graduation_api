import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/models/doctor.dart';
import 'package:graduation/provider/fav_provider.dart';
import 'package:graduation/widget/bookButton.dart';
import 'package:graduation/widget/viewProfileButton.dart';
import 'package:provider/provider.dart';

class TopDoctors extends StatefulWidget {
  TopDoctors({Key? key}) : super(key: key);
  static const id = 'TopDoctors';

  @override
  State<TopDoctors> createState() => _TopDoctorsState();
}

class _TopDoctorsState extends State<TopDoctors> {
  final List<DoctorModel> _doctors = <DoctorModel>[
    DoctorModel(
        img: 'images/doctorw.jpg', spec: 'Dentist', rate: 4.5, name: 'meme'),
    DoctorModel(
        img: 'images/blogs.jpg', spec: 'Cardiology', rate: 4.5, name: 'meme'),
    DoctorModel(
        img: 'images/doctorw.jpg',
        spec: 'Dermatology',
        rate: 4.5,
        name: 'meme'),
    DoctorModel(
        img: 'images/blogs.jpg', spec: 'Hematology', rate: 4.5, name: 'meme'),
    DoctorModel(
        img: 'images/doctorw.jpg', spec: 'Obstetrics', rate: 4.5, name: 'meme'),
    DoctorModel(
        img: 'images/blogs.jpg', spec: 'Orthopedics', rate: 4.5, name: 'meme'),
    DoctorModel(
        img: 'images/doctorw.jpg', spec: 'Urology', rate: 4.5, name: 'meme'),
  ];

  bool _fav = false;

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
          AppLocalizations.of(context)!.top,
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
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView.builder(
          itemCount: _doctors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Container(
                height: 168,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: Colors.grey, width: .5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: Stack(
                            children: [
                              Image.asset(
                                _doctors![index].img,
                                height: 138.h,
                                width: 130.w,
                                fit: BoxFit.cover,
                              ),
                              IconButton(
                                  onPressed: () {
                                    if (Provider.of<FavouriteProvider>(context,
                                            listen: false)
                                        .FavList
                                        .contains(_doctors[index])) {
                                      Provider.of<FavouriteProvider>(context,
                                              listen: false)
                                          .RemoveDoc(_doctors[index]);
                                    } else {
                                      Provider.of<FavouriteProvider>(context,
                                              listen: false)
                                          .addDoc(_doctors[index]);
                                    }
                                  },
                                  icon: Provider.of<FavouriteProvider>(context)
                                          .FavList
                                          .contains(_doctors[index])
                                      ? Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                      : Icon(
                                          Icons.favorite_outline,
                                        )),
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 18.w, bottom: 30.h, top: 30.h, right: 0),
                        // padding:
                        //     EdgeInsets.symmetric(horizontal: 18, vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _doctors![index].name,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              _doctors![index].spec,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 13.5.h,
                                  width: 33.w,
                                  decoration: BoxDecoration(
                                      color: Constant.primaryColor
                                          .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(2.r)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 8,
                                        color: Constant.primaryColor,
                                      ),
                                      Text(
                                        " ${_doctors![index].rate}",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 8.sp,
                                          color: Constant.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 10,
                                      color: Colors.grey.shade400,
                                    ),
                                    Text(
                                      'Gaza',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 14.w,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                viewProfileButton(
                                  text: AppLocalizations.of(context)!
                                      .view_profile,
                                  onPressed: () {},
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                BookButton(
                                    text: AppLocalizations.of(context)!.book,
                                    onPressed: () {}),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
