import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import '../../../constant/constant.dart';
import '../../../models/blood.dart';
import '../../../models/gender.dart';
import '../../../provider/localization_provider.dart';
import '../../../widget/customPrimaryButton.dart';
import '../../../widget/custom_text_filed.dart';
import '../../../widget/mobile_text_filed.dart';

class EditDocProfile extends StatefulWidget {
  const EditDocProfile({Key? key}) : super(key: key);
  static const id = 'EditDocProfile';
  @override
  State<EditDocProfile> createState() => _EditDocProfileState();
}

class _EditDocProfileState extends State<EditDocProfile> {
  late TextEditingController _mobile;
  late TextEditingController _pass;
  late TextEditingController _fname;
  late TextEditingController _Lname;
  late TextEditingController _confirmpass;
  late TextEditingController _email;
  late TextEditingController _date;
  late TextEditingController _address;
  late TextEditingController _state;
  late TextEditingController _city;
  late TextEditingController _country;
  bool _passobsecure = true;
  bool _copassobsecure = true;
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobile = TextEditingController();
    _pass = TextEditingController();
    _fname = TextEditingController();
    _Lname = TextEditingController();
    _email = TextEditingController();
    _date = TextEditingController();
    _confirmpass = TextEditingController();
    _address = TextEditingController();
    _city = TextEditingController();
    _state = TextEditingController();
    _country = TextEditingController();
  }

  bool agree = false;

  @override
  void dispose() {
    _mobile.dispose();
    _pass.dispose();
    _fname.dispose();
    _Lname.dispose();
    _date.dispose();
    _email.dispose();
    _confirmpass.dispose();
    _address.dispose();
    _state.dispose();
    _city.dispose();
    _country.dispose();
    super.dispose();
  }

  int? _selectedBlood;
  int? _selectedGender;

  final List<Blood> _blood = <Blood>[
    Blood(id: 1, title: 'A-'),
    Blood(id: 2, title: 'A+'),
    Blood(id: 3, title: 'B-'),
    Blood(id: 4, title: 'B+'),
    Blood(id: 5, title: 'O-'),
    Blood(id: 6, title: 'O+'),
    Blood(id: 7, title: 'AB-'),
    Blood(id: 8, title: 'AB+'),
  ];
  String? _price = 'Free';

  final List<Gender> _gender = <Gender>[
    Gender(id: 1, title: 'Male'),
    Gender(id: 2, title: 'Female')
  ];
  DateTime date = DateTime.now();
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  void _pickImage() async {
    try {
      final pickedFile = await _picker.getImage(source: ImageSource.gallery);
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      print("Image picker error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
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
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 150.h,
              right: 46.w,
              left: 46.w,
              bottom: 16.h,
            ),
            child: ListView(
              key: _formKey,
              children: [
                Text(
                  'Basic Information',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),

                //User name
                Row(
                  children: [
                    Text(
                      'Username',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.normal,
                        fontSize: 15.sp,
                        color: Color(0xff6B7280),
                      ),
                    ),
                    Text(
                      '*',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 10.h,
                ),
                DocCustomTextFiled(
                  controller: _fname,
                  type: TextInputType.text,
                ),
                //-------------------------------------------------------------------------------------------
                SizedBox(
                  height: 20.h,
                ),
                //Email
                Row(
                  children: [
                    Text(
                      'Email',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.normal,
                        fontSize: 15.sp,
                        color: Color(0xff6B7280),
                      ),
                    ),
                    Text(
                      '*',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 10.h,
                ),
                DocCustomTextFiled(
                  controller: _Lname,
                  type: TextInputType.text,
                ),
                //-------------------------------------------------------------------------------------------

                SizedBox(
                  height: 20.h,
                ),

                //first name
                Row(
                  children: [
                    Text(
                      'First Name',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.normal,
                        fontSize: 15.sp,
                        color: Color(0xff6B7280),
                      ),
                    ),
                    Text(
                      '*',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                DocCustomTextFiled(
                  controller: _date,
                  type: TextInputType.text,
                ),
                //-------------------------------------------------------------------------------------------

                SizedBox(
                  height: 20.h,
                ),
                //first name
                Row(
                  children: [
                    Text(
                      'Last Name',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.normal,
                        fontSize: 15.sp,
                        color: Color(0xff6B7280),
                      ),
                    ),
                    Text(
                      '*',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                DocCustomTextFiled(
                  controller: _date,
                  type: TextInputType.text,
                ),
                //-------------------------------------------------------------------------------------------

                SizedBox(
                  height: 20.h,
                ),
                //phone
                Text(
                  'Phone Number',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp,
                    color: Color(0xff6B7280),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                DocCustomTextFiled(
                  controller: _date,
                  type: TextInputType.text,
                ),

                //-------------------------------------------------------------------------------------------

                SizedBox(
                  height: 20.h,
                ),

                //date
                Text(
                  'Date of Birth',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp,
                    color: Color(0xff6B7280),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                DocCustomTextFiled(
                  controller: _date,
                  type: TextInputType.text,
                ),
                //-------------------------------------------------------------------------------------------

                SizedBox(
                  height: 20.h,
                ),

                //date
                Text(
                  'Date of Birth',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp,
                    color: Color(0xff6B7280),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                DocCustomTextFiled(
                  controller: _date,
                  type: TextInputType.text,
                ),
                //-------------------------------------------------------------------------------------------

                SizedBox(
                  height: 20.h,
                ),

                //date
                Text(
                  'Gender',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp,
                    color: Color(0xff6B7280),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                DropdownButtonFormField(
                  elevation: 20,

                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 35),
                      constraints: BoxConstraints(
                        maxHeight: 60.h,
                        minHeight: 60.h,
                      ),

                      // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 34),
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                      // filled: true,
                      // fillColor: Constant.textFiledColor,
                      counterText: '',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffe7e7e7), width: 1.w),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Constant.primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      errorStyle: GoogleFonts.poppins(fontSize: 12.sp)),

                  isExpanded: true,
                  hint: Text('Select '),
                  borderRadius: BorderRadius.circular(10.r),
                  dropdownColor: Colors.white,
                  itemHeight: 48,
                  focusColor: Colors.pink,
                  // underline: Divider(
                  //   color: Colors.transparent,
                  //   height: 0,
                  // ),
                  value: _selectedGender,
                  items: _gender
                      .map((Gender) => DropdownMenuItem<int>(
                            child: Text(Gender.title),
                            value: Gender.id,
                          ))
                      .toList(),
                  onChanged: (int? value) {
                    setState(() => _selectedGender = value);
                  },
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Divider(
                    color: Colors.grey.shade500,
                    thickness: .2,
                  ),
                ),

                Text(
                  'About Me',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Biography',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp,
                    color: Color(0xff6B7280),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),

                TextField(
                  minLines: null,
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      constraints: BoxConstraints(
                        maxHeight: 124.h,
                        minHeight: 124.h,
                      ),

                      // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 34),
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                      filled: false,
                      // fillColor: Constant.textFiledColor,
                      counterText: '',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffe7e7e7), width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Constant.primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      errorStyle: GoogleFonts.poppins(fontSize: 12.sp)),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Divider(
                    color: Colors.grey.shade500,
                    thickness: .2,
                  ),
                ),
                Text(
                  'Clinic info',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Clinic Name',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp,
                    color: Color(0xff6B7280),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                DocCustomTextFiled(
                  controller: _date,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Clinic Address',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp,
                    color: Color(0xff6B7280),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                DocCustomTextFiled(
                  controller: _date,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Divider(
                    color: Colors.grey.shade500,
                    thickness: .2,
                  ),
                ),
                Text(
                  'Pricing',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),

                RadioMenuButton(
                    value: 'Free',
                    groupValue: _price,
                    onChanged: (String? value) {
                      setState(() => _price = value);
                    },
                    child: Text(
                      'Free',
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Color(0xff6B7280),
                      ),
                    )),
                RadioMenuButton(
                    value: 'Custom Price (per hour)',
                    groupValue: _price,
                    onChanged: (String? value) {
                      setState(() => _price = value);
                    },
                    child: Text(
                      ' Custom Price (per hour)',
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Color(0xff6B7280),
                      ),
                    )),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Divider(
                    color: Colors.grey.shade500,
                    thickness: .2,
                  ),
                ),
                Text(
                  'Services and Specialization',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Text(
                  'Services',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp,
                    color: Color(0xff6B7280),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Container(
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.r),
                      border:
                          Border.all(color: Colors.grey.shade300, width: .5.w)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 32.h,
                        width: 158.w,
                        decoration: BoxDecoration(
                            color: Color(0xffF4F4F4),
                            border: Border.all(
                              color: Color(0xff6B7280).withOpacity(.2),
                            ),
                            borderRadius: BorderRadius.circular(2.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Tooth cleaning ',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: Color(0xff6B7280),
                              ),
                            ),
                            Icon(
                              Icons.cancel,
                              size: 12,
                              color: Color(0xff6B7280),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Enter Services',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontSize: 15.sp,
                          color: Color(0xff6B7280),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Note : Type & Press enter to add new services',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 12.sp,
                    color: Color(0xff757575),
                  ),
                ),
                //------------------------------------------------
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Specialization',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp,
                    color: Color(0xff6B7280),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Container(
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.r),
                      border:
                          Border.all(color: Colors.grey.shade300, width: .5.w)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 32.h,
                        width: 158.w,
                        decoration: BoxDecoration(
                            color: Color(0xffF4F4F4),
                            border: Border.all(
                              color: Color(0xff6B7280).withOpacity(.2),
                            ),
                            borderRadius: BorderRadius.circular(2.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Tooth cleaning ',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: Color(0xff6B7280),
                              ),
                            ),
                            Icon(
                              Icons.cancel,
                              size: 12,
                              color: Color(0xff6B7280),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Enter Services',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontSize: 15.sp,
                          color: Color(0xff6B7280),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Note : Type & Press enter to add new specialization',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 12.sp,
                    color: Color(0xff757575),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Divider(
                    color: Colors.grey.shade500,
                    thickness: .2,
                  ),
                ),
                Text(
                  'Education',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),

                //phone
                Text(
                  'Degree',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp,
                    color: Color(0xff6B7280),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                DocCustomTextFiled(
                  controller: _date,
                  type: TextInputType.text,
                ),

                //-------------------------------------------------------------------------------------------

                SizedBox(
                  height: 20.h,
                ),

                //date
                Text(
                  'College/Institute',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp,
                    color: Color(0xff6B7280),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                DocCustomTextFiled(
                  controller: _date,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 20.h,
                ),

                //date
                Text(
                  'Year of Completion',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp,
                    color: Color(0xff6B7280),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                DocCustomTextFiled(
                  controller: _date,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.add_circle_outlined,
                      size: 14,
                      color: Constant.primaryColor,
                    ),
                    Text(
                      ' Add More',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        color: Constant.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Divider(
                    color: Colors.grey.shade500,
                    thickness: .2,
                  ),
                ),
                Text(
                  'Experience',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),

                //phone
                Text(
                  'Hospital Name',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp,
                    color: Color(0xff6B7280),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                DocCustomTextFiled(
                  controller: _date,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 20.h,
                ),

                //phone
                Text(
                  'Designation',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp,
                    color: Color(0xff6B7280),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),

                DocCustomTextFiled(
                  controller: _date,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 16.h,
                ),

                Row(
                  children: [
                    Icon(
                      Icons.add_circle_outlined,
                      size: 14,
                      color: Constant.primaryColor,
                    ),
                    Text(
                      ' Add More',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        color: Constant.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Divider(
                    color: Colors.grey.shade500,
                    thickness: .2,
                  ),
                ),
                Text(
                  'Awards',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),

                //phone
                Text(
                  'Awards',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp,
                    color: Color(0xff6B7280),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                DocCustomTextFiled(
                  controller: _date,
                  type: TextInputType.text,
                ),

                SizedBox(
                  height: 20.h,
                ),

                //phone
                Text(
                  'Years',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp,
                    color: Color(0xff6B7280),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                DocCustomTextFiled(
                  controller: _date,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 16.h,
                ),

                Row(
                  children: [
                    Icon(
                      Icons.add_circle_outlined,
                      size: 14,
                      color: Constant.primaryColor,
                    ),
                    Text(
                      ' Add More',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        color: Constant.primaryColor,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Divider(
                    color: Colors.grey.shade500,
                    thickness: .2,
                  ),
                ),
                Text(
                  'Memberships',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),

                //phone
                Text(
                  'Memberships',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp,
                    color: Color(0xff6B7280),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                DocCustomTextFiled(
                  controller: _date,
                  type: TextInputType.text,
                ),

                SizedBox(
                  height: 20.h,
                ),

                Row(
                  children: [
                    Icon(
                      Icons.add_circle_outlined,
                      size: 14,
                      color: Constant.primaryColor,
                    ),
                    Text(
                      ' Add More',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        color: Constant.primaryColor,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Divider(
                    color: Colors.grey.shade500,
                    thickness: .2,
                  ),
                ),
                Text(
                  'Registrations',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),

                //phone
                Text(
                  'Registrations',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp,
                    color: Color(0xff6B7280),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                DocCustomTextFiled(
                  controller: _date,
                  type: TextInputType.text,
                ),

                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.add_circle_outlined,
                      size: 14,
                      color: Constant.primaryColor,
                    ),
                    Text(
                      ' Add More',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        color: Constant.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 28.h,
                ),

                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Save Changes',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      // minimumSize: Size(50.w, 59.h),
                      fixedSize: Size(50.w, 59.h),
                      backgroundColor: Constant.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      )),
                ),
              ],
            ),
          ),
          Positioned(
            top: 5,
            right: 120.w,
            left: 120.w,
            child: Center(
              child: _imageFile == null
                  ? Container(
                      width: 100.0.w,
                      height: 110.0.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                            fit: BoxFit.cover),
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(70.r)),
                      ),
                    )
                  : Container(
                      width: 110.0.w,
                      height: 110.0.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(File(_imageFile!.path)),
                            fit: BoxFit.cover),
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(70.r)),
                      ),
                    ),
            ),
          ),
          Positioned(
            right: 110.w,
            left: 220.w,
            top: 100.h,
            child: InkWell(
              onTap: _pickImage,
              child: Container(
                width: 21.w,
                height: 21.h,
                child: Image.asset('images/pen.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DocCustomTextFiled extends StatelessWidget {
  DocCustomTextFiled(
      {super.key,
      this.counter,
      this.prefixIcon,
      this.suffixIcon,
      required this.type,
      this.obscureText = false,
      required this.controller,
      this.errorText,
      this.hint});
  int? counter;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool obscureText = false;
  String? hint;
  String? errorText;
  final TextInputType type;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: type,
      obscureText: obscureText,
      minLines: 1,
      maxLines: 1,
      decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Provider.of<LocalizationProvider>(context, listen: true)
                      .languages ==
                  'en'
              ? Padding(
                  padding: EdgeInsets.only(left: 37, right: 12),
                  child: prefixIcon,
                )
              : Padding(
                  padding: EdgeInsets.only(left: 12, right: 37),
                  child: prefixIcon,
                ),
          suffixIcon: Padding(
            padding: Provider.of<LocalizationProvider>(context, listen: true)
                        .languages ==
                    'en'
                ? EdgeInsets.only(right: 34.w, top: 0, bottom: 0)
                : EdgeInsets.only(left: 34.w, top: 0, bottom: 0),
            child: suffixIcon,
          ),
          contentPadding: EdgeInsets.zero,
          constraints: BoxConstraints(
            maxHeight: errorText == null ? 60 : 85,
            minHeight: 60.h,
          ),

          // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 34),
          hintStyle: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: Colors.grey),
          filled: false,
          errorText: errorText,
          // fillColor: Constant.textFiledColor,
          counterText: '',
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffe7e7e7), width: 1),
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Constant.primaryColor, width: 1),
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(10.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(10.r),
          ),
          errorStyle: GoogleFonts.poppins(fontSize: 12.sp)
          // border: UnderlineInputBorder(
          //   borderSide: BorderSide(color: Color(0xffe7e7e7), width: 1),
          // ),
          //     prefix: Row(
          //       children: [
          //         Icon(Icons.expand_more_outlined),
          //         DropdownButton<int>(
          //           isExpanded: false,
          //           underline: Divider(
          //             color: Colors.transparent,
          //             height: 0,
          //           ),
          //           iconSize: 0,
          //           value: _selectedCountry,
          //           items: country
          //               .map((Country) => DropdownMenuItem<int>(
          //                     child: Text(Country.title),
          //                     value: Country.id,
          //                   ))
          //               .toList(),
          //           onChanged: (int? value) {
          //             setState(() => _selectedCountry = value);
          //           },
          //         ),
          //       ],
          //     ),
          //     counterText: ''),
          // maxLength: 9,
          ),
      maxLength: counter,
    );
  }
}
