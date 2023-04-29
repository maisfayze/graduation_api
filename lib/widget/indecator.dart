import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/constant/constant.dart';

class Indecator extends StatelessWidget {
  Indecator({super.key, required this.isCurrentPage, this.marginEnd = 0});
  final bool isCurrentPage;
  double marginEnd;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      height: 10.h,
      width: 10.w,
      decoration: BoxDecoration(
        color: isCurrentPage ? Constant.primaryColor : Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
