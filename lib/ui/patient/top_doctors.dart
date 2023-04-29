import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/widget/bookButton.dart';
import 'package:graduation/widget/viewProfileButton.dart';

class TopDoctors extends StatelessWidget {
  const TopDoctors({Key? key}) : super(key: key);
  static const id = 'TopDoctors';

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
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Container(
                height: 168,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey, width: .5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'images/doctorw.jpg',
                            height: 138,
                            width: 130,
                            fit: BoxFit.cover,
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 18, bottom: 30, top: 30, right: 0),
                        // padding:
                        //     EdgeInsets.symmetric(horizontal: 18, vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
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
                                        color: Constant.primaryColor,
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
                              width: 14,
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
