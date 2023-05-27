import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/widget/search_bar.dart';

import '../../controller/get_specialities.dart';
import '../../models/specialities_model.dart';

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
            FutureBuilder<List<SpecialitiesModel>>(
              future: GetSpecialities().getSpec(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Constant.primaryColor,
                    ),
                  );
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return Expanded(
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              // crossAxisSpacing: 16,
                              // mainAxisSpacing: 30,
                              childAspectRatio: .8,
                              crossAxisCount: 3),
                      itemCount: snapshot.data!.length,
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
                                constraints: BoxConstraints(
                                    maxHeight: 86.h, maxWidth: 86.w),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Color(0xff6B7280).withOpacity(0.06),
                                      spreadRadius: 3,
                                      blurRadius: 3,
                                      // changes position of shadow
                                    ),
                                  ],

                                  // border: Border.all(color: Colors.grey),
                                ),
                                child: Center(
                                    child: Image.network(
                                  "http://ac7a1ae098-001-site1.etempurl.com${snapshot.data![index].image}",
                                  height: 36.h,
                                  width: 36.w,
                                )),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Text(
                                snapshot.data![index].specialtyName,
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
                  );
                  ;
                } else {
                  return Center(
                    child: Text('NO DATA'),
                  );
                }
              },
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
