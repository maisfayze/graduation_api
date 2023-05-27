import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/controller/get_specialities.dart';
import 'package:graduation/models/filtered_result.dart';
import 'package:graduation/models/specialities_model.dart';
import 'package:graduation/ui/search_page.dart';
import 'package:provider/provider.dart';

import '../constant/constant.dart';
import '../controller/filter_api_controller.dart';
import '../provider/search_filter_provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);
  static const id = 'FilterScreen';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // bool checked = true;
  bool value = false;
  bool male = false;
  bool female = false;
  bool Urology = false;
  bool Cardiologist = false;
  bool Neurology = false;
  bool Orthopedic = false;
  bool Dentist = false;
  String? _gender;
  int? _spec;

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
          'Filter Doctors',
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
              onPressed: () {},
              icon: Icon(
                Icons.filter_list_alt,
                size: 24,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gender',
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold), //TextStyle
            ), //Text
            SizedBox(height: 10.h),
            RadioMenuButton(
                value: 'male',
                groupValue: _gender,
                onChanged: (String? value) {
                  setState(() => _gender = value);
                },
                child: Text(
                  'Male',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    color: Color(0xff272B41),
                  ),
                )),
            RadioMenuButton(
                value: 'female',
                groupValue: _gender,
                onChanged: (String? value) {
                  setState(() => _gender = value);
                },
                child: Text(
                  'Female',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    color: Color(0xff272B41),
                  ),
                )),

            Text(
              'Select Specialist',
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold), //TextStyle
            ), //Text
            SizedBox(height: 10.h),
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
                  return SizedBox(
                    height: 350.h,
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return RadioMenuButton(
                            value: snapshot.data![index].id,
                            groupValue: _spec,
                            onChanged: (int? value) {
                              setState(() => _spec = value);
                            },
                            child: Text(
                              snapshot.data![index].specialtyName,
                              style: GoogleFonts.poppins(
                                fontSize: 20.sp,
                                color: Color(0xff272B41),
                              ),
                            ));
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text('NO DATA'),
                  );
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<FilterProvider>(context, listen: false).spec =
                    _spec;
                Provider.of<FilterProvider>(context, listen: false).gender =
                    _gender;

                Navigator.pushNamed(context, SearchPage.id);

                // List<ResultModel> itemList = [];
                //
                // Future<List<ResultModel>> result = FilterApiController()
                //     .getDataFromFilter(gender: _gender, spec: _spec);
                //
                // result.then((value) {
                //   setState(() {
                //     itemList = value;
                //   });
                // });
                // Provider.of<FilterProvider>(context).addDoc(itemList);
              },
              child: Text(
                'Search ',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16.sp,
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
            Spacer(),
            //Row
          ],
        ),
      ),
    );
  }
}
