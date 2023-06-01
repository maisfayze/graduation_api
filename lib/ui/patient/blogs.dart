import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/controller/get_blogs_api_controllers.dart';
import 'package:intl/intl.dart';

import '../../constant/constant.dart';
import '../../widget/bookButton.dart';
import '../../widget/search_bar.dart';
import '../../widget/viewProfileButton.dart';

class Blogs extends StatefulWidget {
  const Blogs({Key? key}) : super(key: key);
  static const id = 'Blogs';

  @override
  State<Blogs> createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
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
          AppLocalizations.of(context)!.blogs,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: SearchBarWidget(
                  type: TextInputType.text,
                  controller: _searchController,
                  hint: AppLocalizations.of(context)!.search_blogs,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  )),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: FutureBuilder(
                future: GetBlogsApiController().getBlogs(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Constant.primaryColor,
                      ),
                    );
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String trimmedString =
                            snapshot.data![index].createdDate.trim();
                        DateTime dateTime = DateTime.parse(trimmedString);
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: Container(
                            height: 220.h,
                            width: 366.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                  color: Colors.grey.shade300, width: .6),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 21.w,
                                      bottom: 38.h,
                                      top: 16.h,
                                      right: 0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.network(
                                        'http://ac7a1ae098-001-site1.etempurl.com${snapshot.data![index].blogImage}',
                                        height: 160.h,
                                        width: 111.w,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 18.w,
                                      bottom: 16.h,
                                      top: 16.h,
                                      right: 0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 204.w,
                                        child: Text(
                                          '${snapshot.data![index].title}',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                  child: Image.network(
                                                    'http://ac7a1ae098-001-site1.etempurl.com${snapshot.data![index].doctorImage}',
                                                    height: 20.h,
                                                    width: 20.w,
                                                    fit: BoxFit.cover,
                                                  )),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                '${snapshot.data![index].name}',
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10.sp,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 28.w,
                                          ),
                                          Text(
                                            '${DateFormat('dd-MM-yyyy').format(dateTime)}',
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10.sp,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      SizedBox(
                                        width: 183.w,
                                        height: 80.h,
                                        child: Text(
                                          overflow: TextOverflow.clip,
                                          '${snapshot.data![index].content}',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: 104.w,
                                          ),
                                          viewProfileButton(
                                            text: AppLocalizations.of(context)!
                                                .read_more,
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text('NO DATA'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
