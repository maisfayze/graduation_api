import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constant/constant.dart';
import '../../../controller/chat_api_controller.dart';
import '../../../widget/bookButton.dart';
import '../../../widget/search_bar.dart';
import '../../../widget/viewProfileButton.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
      body: Column(
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
            height: 12.h,
          ),
          FutureBuilder(
            future: chatApiController().getListChat(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Constant.primaryColor,
                  ),
                );
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data![index].createdDate;
                    String extractedString = data.substring(11, 16);
                    print('image is${snapshot.data![index].user.image}');
                    return Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 29.r,
                            backgroundImage: NetworkImage(
                                'http://ac7a1ae098-001-site1.etempurl.com${snapshot.data![index].user.image}'),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${snapshot.data![index].user.name}',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp)),
                                  SizedBox(
                                    width: 170.w,
                                  ),
                                  Text('${extractedString}',
                                      style: GoogleFonts.poppins(
                                          color: Colors.grey.shade400,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp)),
                                ],
                              ),
                              Text('${snapshot.data![index].lastMessage}',
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp)),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FadeInDown(
                        child: Center(
                            child: Image.asset(
                          'images/Messaging.gif',
                          width: 310.w,
                          height: 310.h,
                        )),
                      ),
                      FadeInUp(
                        child: SizedBox(
                          width: 280.w,
                          child: Text(
                            'There is no messages to display at the moment , start a new chat',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 16.sp, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
