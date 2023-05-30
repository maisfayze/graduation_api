import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../constant/constant.dart';
import '../../models/blood.dart';
import '../../prefs/prefs.dart';
import '../../widget/customPrimaryButton.dart';
import '../../widget/custom_text_filed.dart';
import '../../provider/localization_provider.dart';
import '../../widget/mobile_text_filed.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);
  static const id = 'EditProfile';

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
                //first name
                Text(
                  'First Name',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFiled(
                  controller: _fname,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 16.h,
                ),
                //last name
                Text(
                  'last Name',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFiled(
                  controller: _Lname,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 16.h,
                ),
                //DateOfBirth
                Text(
                  'Date of Birth',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFiled(
                  controller: _date,
                  type: TextInputType.text,
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.calendar_month_rounded,
                    ),
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(1965),
                          lastDate: DateTime(2100));
                      if (newDate != null) {
                        String formatData =
                            DateFormat("yyyy-mm-dd").format(newDate);

                        setState(() {
                          _date.text = formatData.toString();
                        });
                      } else {}
                    },
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                //Blood
                Text(
                  'Blood Type',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Colors.black,
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
                      filled: true,
                      fillColor: Constant.textFiledColor,
                      counterText: '',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffe7e7e7), width: 1.w),
                        borderRadius: BorderRadius.circular(80.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Constant.primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(80.r),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(80.r),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(80.r),
                      ),
                      errorStyle: GoogleFonts.poppins(fontSize: 12.sp)),

                  isExpanded: true,
                  hint: Text('Select Blood'),
                  borderRadius: BorderRadius.circular(10.r),
                  dropdownColor: Colors.white,
                  itemHeight: 48,
                  focusColor: Colors.pink,
                  // underline: Divider(
                  //   color: Colors.transparent,
                  //   height: 0,
                  // ),
                  value: _selectedBlood,
                  items: _blood
                      .map((Blood) => DropdownMenuItem<int>(
                            child: Text(Blood.title),
                            value: Blood.id,
                          ))
                      .toList(),
                  onChanged: (int? value) {
                    setState(() => _selectedBlood = value);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                //Email
                Text(
                  'Email',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFiled(
                  controller: _email,
                  type: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 16.h,
                ),

                //Address
                Text(
                  'Address',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFiled(
                  controller: _address,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 16.h,
                ),

                CustomPrimaryButton(text: 'Update', onPressed: () {}),
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
                                'http://ac7a1ae098-001-site1.etempurl.com${SharedPrefController().getValueFor('image')}'),
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
