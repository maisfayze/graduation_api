import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({
    super.key,
    required this.img,
    required this.title,
    required this.sub_title,
    required this.onPresseed,
  });
  final String img;
  final String title;
  final String sub_title;
  final Function() onPresseed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'images/$img.png',
                    width: 22,
                    height: 17,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 36),
                child: SizedBox(
                  width: 220,
                  child: Text(
                    sub_title,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xffABABAB),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          ),
        ],
      ),
      onTap: onPresseed,
    );
  }
}
