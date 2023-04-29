import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';

import '../../../models/spec.dart';
import '../../../widget/bookButton.dart';
import '../../../widget/search_bar.dart';
import '../../../widget/see_all_row.dart';
import '../../../widget/viewProfileButton.dart';

class PatientHome extends StatefulWidget {
  const PatientHome({Key? key}) : super(key: key);

  @override
  State<PatientHome> createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {
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
          icon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Icon(
              Icons.menu,
              color: Colors.black,
              size: 24,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 23,
            ),
            child: IconButton(
              icon: Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
                size: 24,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 214,
                child: Text(
                  AppLocalizations.of(context)!.find_the_best_clinic_and_doctor,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SearchBar(
                  type: TextInputType.text,
                  controller: _searchController,
                  hint: AppLocalizations.of(context)!.search_title,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  )),
              SizedBox(
                height: 24,
              ),
              SeeALLRow(
                title: AppLocalizations.of(context)!.specialities,
                onPressed: () {},
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 108),
                child: ListView.builder(
                  itemCount: _specialities.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 12),
                      width: 80,
                      height: 108,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            constraints:
                                BoxConstraints(maxHeight: 80, maxWidth: 80),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: Colors.grey, width: .5)),
                            child: Center(
                                child: Image.asset(
                              "${_specialities[index].img}",
                              height: 50,
                              width: 50,
                            )),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            _specialities[index].title,
                            style: GoogleFonts.poppins(
                                fontSize: 12,
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
                height: 22,
              ),
              //top
              SeeALLRow(
                title: AppLocalizations.of(context)!.top,
                onPressed: () {},
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 260),
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 12),
                      width: 163,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey, width: .5)),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'images/doctorw.jpg',
                                  height: 95,
                                  width: 131,
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Dr.Ruby Perin',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Dentist',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 13.5,
                                  width: 33,
                                  decoration: BoxDecoration(
                                      color: Constant.primaryColor
                                          .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 8,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        '4.7',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 8,
                                          color: Constant.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
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
                                        fontSize: 10,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 14,
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
                                  width: 5,
                                ),
                                BookButton(
                                    text: AppLocalizations.of(context)!.book,
                                    onPressed: () {}),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 22,
              ),
              //blogs
              SeeALLRow(
                title: AppLocalizations.of(context)!.blogs,
                onPressed: () {},
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 340),
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 12),
                      width: 211,
                      height: 326,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey, width: .5)),
                      child: Padding(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'images/blogs2.jpg',
                                  height: 95,
                                  width: 179,
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'What We Know So Far About COVID-19 Transmission ?',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'images/doctorw.jpg',
                                          height: 20,
                                          width: 20,
                                          fit: BoxFit.cover,
                                        )),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Dr. Linda toben',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.watch_later_outlined,
                                      size: 10,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '3. Jan .2023',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              width: 183,
                              height: 70,
                              child: Text(
                                overflow: TextOverflow.fade,
                                'Many of us woke up today to the shocking news that the President Donald Trump and first ',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            viewProfileButton(
                              text: AppLocalizations.of(context)!.read_more,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
