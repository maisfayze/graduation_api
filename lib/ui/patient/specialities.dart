import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(
              height: 34,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SearchBar(
                  type: TextInputType.text,
                  controller: _searchController,
                  hint: AppLocalizations.of(context)!.search_title,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  )),
            ),
            SizedBox(
              height: 27,
            ),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 20,
                    childAspectRatio: .9,
                    crossAxisCount: 3),
                itemCount: _specialities.length,
                itemBuilder: (context, index) {
                  return Container(
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
                          child: Center(
                              child: Image.asset(
                            "${_specialities[index].img}",
                            height: 50,
                            width: 50,
                          )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey)),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          _specialities[index].title,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
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
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
