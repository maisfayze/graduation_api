import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constant/constant.dart';
import '../../../widget/bookButton.dart';
import '../../../widget/search_bar.dart';
import '../../../widget/viewProfileButton.dart';

class DocChatScreen extends StatefulWidget {
  const DocChatScreen({Key? key}) : super(key: key);

  @override
  State<DocChatScreen> createState() => _DocChatScreenState();
}

class _DocChatScreenState extends State<DocChatScreen> {
  late TextEditingController _searchController;
  bool _fav = false;

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
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w),
            child: Image.asset(
              'images/chat.png',
              width: 24.w,
              height: 24.h,
            ),
          ),
        ],
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
          AppLocalizations.of(context)!.chat,
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
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: SearchBarWidget(
                type: TextInputType.text,
                controller: _searchController,
                hint: AppLocalizations.of(context)!.search_title,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade400,
                )),
          ),
          SizedBox(
            height: 50.h,
          ),
          // Container(
          //   alignment: Alignment.center,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       FadeInDown(
          //         child: Center(
          //             child: Image.asset(
          //           'images/Messaging.gif',
          //           width: 310.w,
          //           height: 310.h,
          //         )),
          //       ),
          //       FadeInUp(
          //         child: SizedBox(
          //           width: 280.w,
          //           child: Text(
          //             'There is no messages to display at the moment , start a new chat with doctors',
          //             textAlign: TextAlign.center,
          //             style: GoogleFonts.poppins(
          //                 fontSize: 16.sp, fontWeight: FontWeight.w400),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
