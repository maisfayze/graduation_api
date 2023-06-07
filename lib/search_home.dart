import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/ui/booking/booking.dart';
import 'package:graduation/ui/booking/view_doc_profile.dart';
import 'package:graduation/ui/search_page.dart';
import 'package:graduation/widget/bookButton.dart';
import 'package:graduation/widget/search_bar.dart';
import 'package:graduation/widget/viewProfileButton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'constant/constant.dart';
import 'controller/home_search_controller.dart';
import 'models/top_doctors.dart';

class SearchHome extends StatefulWidget {
  const SearchHome({Key? key}) : super(key: key);
  static const id = 'SearchHome';
  @override
  State<SearchHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<SearchHome> {
  late TextEditingController _searchLocationController;
  late TextEditingController _searchClinicNameController;

  late String _selectedItem;

  List<String> _dropdownItems = ['Location', 'ClinicName'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchLocationController = TextEditingController();
    _searchClinicNameController = TextEditingController();
    _selectedItem = _dropdownItems[0];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchLocationController.dispose();
    _searchClinicNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Search',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              color: Colors.black,
            ),
          ),
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 24,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: FadeInLeft(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12.h,
                ),
                Container(
                  height: 60.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.grey.shade400, width: .4.w)),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 145.w,
                          height: 60.h,
                          color: Constant.primaryColor,
                          child: DropdownButton<String>(
                            alignment: Alignment.center,
                            underline: Text(''),
                            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                            style: GoogleFonts.poppins(
                              fontSize: 16.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                            value: _selectedItem,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedItem = newValue!;
                              });
                            },
                            items: _dropdownItems.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                          ),
                        ),
                        _selectedItem == 'Location'
                            ? TextField(
                                onChanged: (value) {
                                  setState(() {
                                    _searchLocationController.text = value;
                                  });
                                },
                                controller: _searchLocationController,
                                keyboardType: TextInputType.text,
                                minLines: 1,
                                maxLines: 1,

                                decoration: InputDecoration(
                                  hintText: ' Search City',

                                  contentPadding: EdgeInsets.zero,
                                  constraints: BoxConstraints(
                                      maxHeight: 60.h,
                                      minHeight: 60.h,
                                      maxWidth: 100.w,
                                      minWidth: 100.w),

                                  // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 34),
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey.shade400),
                                  // filled: true,
                                  // fillColor: Constant.textFiledColor,
                                  counterText: '',
                                  border: InputBorder.none,
                                  // enabledBorder: OutlineInputBorder(
                                  //   borderSide: BorderSide(
                                  //       color: Color(0xffe7e7e7), width: 1),
                                  //   borderRadius: BorderRadius.circular(80.r),
                                  // ),
                                  // focusedBorder: OutlineInputBorder(
                                  //   borderSide: BorderSide(
                                  //       color: Constant.primaryColor, width: 1),
                                  //   borderRadius: BorderRadius.circular(80.r),
                                  // ),
                                ),
                                // maxLength: counter,
                              )
                            : TextField(
                                onChanged: (value) {
                                  setState(() {
                                    _searchClinicNameController.text = value;
                                  });
                                },
                                onTap: () {},
                                controller: _searchLocationController,
                                keyboardType: TextInputType.text,
                                minLines: 1,
                                maxLines: 1,

                                decoration: InputDecoration(
                                  hintText: 'Search Clinic',

                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  constraints: BoxConstraints(
                                      maxHeight: 60.h,
                                      minHeight: 60.h,
                                      maxWidth: 150.w,
                                      minWidth: 150.w),

                                  // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 34),
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey.shade400),
                                  // filled: true,
                                  // fillColor: Constant.textFiledColor,
                                  counterText: '',
                                  border: InputBorder.none,
                                ),
                                // maxLength: counter,
                              ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: _selectedItem == 'Location'
                        ? HomeSearchControllerApi().getLocationData(
                            clinicAddress: _searchLocationController.text)
                        : HomeSearchControllerApi().getClinicNameData(
                            clinicName: _searchClinicNameController.text),
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
                      } else if (snapshot.hasData &&
                          snapshot.data!.isNotEmpty) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            TopDoctorsModel tops = TopDoctorsModel(
                                doctorImage: snapshot.data![index].doctorImage,
                                doctorName: snapshot.data![index].doctorName,
                                specialityName:
                                    snapshot.data![index].specialityName,
                                doctorId: snapshot.data![index].idDoctor,
                                clinicAddress: 'Gaza');
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Container(
                                height: 180.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border.all(
                                      color: Colors.grey.shade400, width: .4),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 14.w),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          child: Image.network(
                                            "http://ac7a1ae098-001-site1.etempurl.com${snapshot.data![index].doctorImage}",
                                            height: 138.h,
                                            width: 128.w,
                                            fit: BoxFit.cover,
                                          )),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 16.w, top: 24.h, right: 3.w),
                                        // padding:
                                        //     EdgeInsets.symmetric(horizontal: 18, vertical: 30),
                                        child: Column(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                              snapshot
                                                  .data![index].specialityName,
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
                                                      color: Constant
                                                          .primaryColor
                                                          .withOpacity(0.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.r)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        size: 12,
                                                        color:
                                                            Color(0xffF4C150),
                                                      ),
                                                      Text(
                                                        " 4.5",
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12.sp,
                                                          color: Constant
                                                              .primaryColor,
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
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Icon(
                                                      Icons.location_on,
                                                      size: 12,
                                                      color:
                                                          Colors.grey.shade400,
                                                    ),
                                                    Text(
                                                      'Gaza',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12.sp,
                                                        color: Colors
                                                            .grey.shade400,
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
                                                  text: AppLocalizations.of(
                                                          context)!
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
                                                  width: 4.w,
                                                ),
                                                BookButton(
                                                    text: AppLocalizations.of(
                                                            context)!
                                                        .book,
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          settings: RouteSettings(
                                                              arguments:
                                                                  snapshot.data![
                                                                      index]),
                                                          builder: (context) =>
                                                              Booking(
                                                                  data: snapshot
                                                                      .data![
                                                                          index]
                                                                      .idDoctor),
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
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 34.0.w, vertical: 130.h),
                          child: Column(
                            children: [
                              Image.asset('images/search_e.gif'),
                              Center(
                                child: Text(
                                  'There are no search results , please select what you want to search for',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
