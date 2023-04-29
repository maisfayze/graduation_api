import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation/models/doctor.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../provider/fav_provider.dart';
import '../../widget/bookButton.dart';
import '../../widget/search_bar.dart';
import '../../widget/viewProfileButton.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);
  static const id = 'Favourites';

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
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
          AppLocalizations.of(context)!.favourites,
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
              height: 21.h,
            ),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 30,
                    childAspectRatio: .65,
                    crossAxisCount: 2),
                itemCount: Provider.of<FavouriteProvider>(
                  context,
                ).listLength,
                itemBuilder: (context, index) {
                  return Container(
                    width: 163.w,
                    height: 253.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Colors.grey, width: .5)),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Stack(
                              children: [
                                Image.asset(
                                  Provider.of<FavouriteProvider>(context,
                                          listen: false)
                                      .FavList[index]
                                      .img,
                                  height: 95.h,
                                  width: 131.w,
                                  fit: BoxFit.cover,
                                ),
                                IconButton(
                                    onPressed: () {
                                      Provider.of<FavouriteProvider>(context,
                                              listen: false)
                                          .remove(
                                              Provider.of<FavouriteProvider>(
                                                      context,
                                                      listen: false)
                                                  .FavList[index]);

                                      // setState(() {
                                      //   _fav = Provider.of<FavouriteProvider>(
                                      //           context,
                                      //           listen: false)
                                      //       .getData(id: index)
                                      //       .isfav;
                                      // });
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            Provider.of<FavouriteProvider>(context,
                                    listen: false)
                                .getData(id: index)
                                .name,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            Provider.of<FavouriteProvider>(context,
                                    listen: false)
                                .getData(id: index)
                                .spec,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 13.5.h,
                                width: 33.w,
                                decoration: BoxDecoration(
                                    color:
                                        Constant.primaryColor.withOpacity(0.2),
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
                                      '${Provider.of<FavouriteProvider>(context, listen: false).getData(id: index).rate}',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 8.sp,
                                        color: Constant.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 30.w,
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
                                      fontSize: 10.sp,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              viewProfileButton(
                                text:
                                    AppLocalizations.of(context)!.view_profile,
                                onPressed: () {},
                              ),
                              SizedBox(
                                width: 5.w,
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
              height: 50.h,
            )
          ],
        ),
      ),
    );
  }
}
