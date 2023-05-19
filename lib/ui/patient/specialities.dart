import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/widget/search_bar.dart';

import '../../models/spec.dart';

class Specialities extends StatefulWidget {
  const Specialities({Key? key}) : super(key: key);
  static const id = 'Specialities';

  @override
  State<Specialities> createState() => _SpecialitiesState();
}

class _SpecialitiesState extends State<Specialities> {
  late TextEditingController _searchController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.dispose();
    super.dispose();
  }

  final List<SpecialitiesModel> _specialities = <SpecialitiesModel>[
    SpecialitiesModel(img: 'images/den.png', title: 'Dentist'),
    SpecialitiesModel(img: 'images/cardiology.png', title: 'Cardiology'),
    SpecialitiesModel(img: 'images/Dermatology.png', title: 'Dermatology'),
    SpecialitiesModel(img: 'images/Hematology.png', title: 'Hematology'),
    SpecialitiesModel(img: 'images/Obstetrics.png', title: 'Obstetrics'),
    SpecialitiesModel(img: 'images/Orthopedics.png', title: 'Orthopedics'),
    SpecialitiesModel(img: 'images/Urology.png', title: 'Urology'),
  ];

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
          AppLocalizations.of(context)!.specialities,
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
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            SizedBox(
              height: 34.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: SearchBarWidget(
                  type: TextInputType.text,
                  controller: _searchController,
                  hint: AppLocalizations.of(context)!.search_spec,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  )),
            ),
            SizedBox(
              height: 27.h,
            ),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // crossAxisSpacing: 16,
                    // mainAxisSpacing: 30,
                    childAspectRatio: .8,
                    crossAxisCount: 3),
                itemCount: _specialities.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 80.w,
                    height: 10.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 86.w,
                          height: 86.w,
                          constraints:
                              BoxConstraints(maxHeight: 86.h, maxWidth: 86.w),
                          child: Center(
                              child: Image.asset(
                            "${_specialities[index].img}",
                            height: 36.h,
                            width: 36.w,
                          )),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.r),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff6B7280).withOpacity(0.06),
                                spreadRadius: 3,
                                blurRadius: 3,
                                // changes position of shadow
                              ),
                            ],

                            // border: Border.all(color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          _specialities[index].title,
                          style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 50.h,
            )
          ],
        ),
      ),
    );
  }
}
