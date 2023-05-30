import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/models/filtered_result.dart';
import 'package:graduation/models/top_doctors.dart';
import 'package:graduation/ui/patient/PatientBtn/btn_patient.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../controller/filter_api_controller.dart';
import '../prefs/prefs.dart';
import '../provider/search_filter_provider.dart';
import '../widget/bookButton.dart';
import '../widget/viewProfileButton.dart';
import 'Doctor/DocBtn/btn_doc.dart';
import 'booking/booking.dart';
import 'booking/view_doc_profile.dart';
import 'filter.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  static const id = 'SearchPage';
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
            if (SharedPrefController().getValueFor('userType') == 'Doctor') {
              String rout = BtnDoc.id;
              Navigator.pushNamed(context, rout);
            } else {
              String rout = BtnPatient.id;
              Navigator.pushNamed(context, rout);
            }
          },
        ),
        centerTitle: true,
        title: Text(
          'Search Doctors',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, FilterScreen.id);
              },
              icon: Icon(
                Icons.filter_list_alt,
                size: 24,
                color: Constant.primaryColor,
              ))
        ],
      ),
      body: FutureBuilder<List<ResultModel>>(
        future: FilterApiController().getDataFromFilter(
            gender: Provider.of<FilterProvider>(context, listen: true).gender,
            spec: Provider.of<FilterProvider>(context, listen: true).spec),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: Image.asset(
                    'images/search-doctor.gif',
                    width: 300.w,
                    height: 500.h,
                  ),
                ),
                Spacer(),
              ],
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  TopDoctorsModel tops = TopDoctorsModel(
                      doctorImage: snapshot.data![index].doctorImage,
                      doctorName: snapshot.data![index].doctorName,
                      specialityName: snapshot.data![index].specialityName,
                      doctorId: snapshot.data![index].idDoctor,
                      clinicAddress: snapshot.data![index].clinicAddress);
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Container(
                      height: 180.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: Colors.grey, width: .5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: Image.network(
                                  "http://ac7a1ae098-001-site1.etempurl.com${snapshot.data![index].doctorImage}",
                                  height: 138.h,
                                  width: 130.w,
                                  fit: BoxFit.cover,
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 18.w, top: 24.h, right: 0),
                              // padding:
                              //     EdgeInsets.symmetric(horizontal: 18, vertical: 30),
                              child: Column(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data![index].doctorName,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    snapshot.data![index].specialityName,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14.h,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 23.5.h,
                                        width: 36.w,
                                        decoration: BoxDecoration(
                                            color: Constant.primaryColor
                                                .withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(2.r)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 12,
                                              color: Color(0xffF4C150),
                                            ),
                                            Text(
                                              " 4.5",
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.sp,
                                                color: Constant.primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16.w,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            size: 12,
                                            color: Colors.grey.shade400,
                                          ),
                                          Text(
                                            snapshot.data![index].clinicAddress,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      viewProfileButton(
                                        text: AppLocalizations.of(context)!
                                            .view_profile,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              settings: RouteSettings(
                                                  arguments: tops),
                                              builder: (context) =>
                                                  ViewDoctorProfile(),
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      BookButton(
                                          text: AppLocalizations.of(context)!
                                              .book,
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                settings: RouteSettings(
                                                    arguments: tops),
                                                builder: (context) => Booking(),
                                              ),
                                            );
                                          }),
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
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: Image.asset(
                    'images/search-doctor.gif',
                    width: 300.w,
                    height: 500.h,
                  ),
                ),
                Spacer(),
              ],
            );
          }
        },
      ),
    );
  }
}
