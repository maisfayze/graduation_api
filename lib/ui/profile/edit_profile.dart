import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../constant/constant.dart';
import '../../models/country.dart';
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
  final List<Blood> _countries = <Blood>[
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
              top: 143,
              right: 46,
              left: 46,
              bottom: 16,
            ),
            child: ListView(
              key: _formKey,
              children: [
                //first name
                Text(
                  'First Name',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFiled(
                  controller: _fname,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 16,
                ),
                //last name
                Text(
                  'last Name',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFiled(
                  controller: _Lname,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 16,
                ),
                //DateOfBirth
                Text(
                  'Date of Birth',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
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
                  height: 16,
                ),
                //Blood
                Text(
                  'Blood Type',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  elevation: 20,

                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 35),
                      constraints: BoxConstraints(
                        maxHeight: 60,
                        minHeight: 60,
                      ),

                      // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 34),
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                      filled: true,
                      fillColor: Constant.textFiledColor,
                      counterText: '',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffe7e7e7), width: 1),
                        borderRadius: BorderRadius.circular(80),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Constant.primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(80),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(80),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(80),
                      ),
                      errorStyle: GoogleFonts.poppins(fontSize: 12)),

                  isExpanded: true,
                  hint: Text('Select Blood'),
                  borderRadius: BorderRadius.circular(10),
                  dropdownColor: Colors.white,
                  itemHeight: 48,
                  focusColor: Colors.pink,
                  // underline: Divider(
                  //   color: Colors.transparent,
                  //   height: 0,
                  // ),
                  value: _selectedBlood,
                  items: _countries
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
                  height: 16,
                ),
                //Email
                Text(
                  'Email',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFiled(
                  controller: _email,
                  type: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 16,
                ),
                //Mobile
                Text(
                  'Phone Number',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MobileTextFiled(
                  type: TextInputType.phone,
                  controller: _mobile,
                  counter: 10,
                ),
                SizedBox(
                  height: 16,
                ),
                //Address
                Text(
                  'Address',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFiled(
                  controller: _fname,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 16,
                ),
                //City
                Text(
                  'City',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFiled(
                  controller: _city,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 16,
                ),
                //State
                Text(
                  'State',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFiled(
                  controller: _state,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 16,
                ),
                //Country
                Text(
                  'Country',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFiled(
                  controller: _country,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 16,
                ),
                CustomPrimaryButton(text: 'Update', onPressed: () {}),
              ],
            ),
          ),
          Positioned(
            top: 5,
            right: 120,
            left: 120,
            child: Center(
              child: _imageFile == null
                  ? Container(
                      width: 110.0,
                      height: 110.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                            fit: BoxFit.contain),
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(70)),
                      ),
                    )
                  : Container(
                      width: 110.0,
                      height: 110.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(File(_imageFile!.path)),
                            fit: BoxFit.cover),
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(70)),
                      ),
                    ),
            ),
          ),
          // Positioned(
          //   right: 151,
          //   left: 151,
          //   top: -10,
          //   child: Container(
          //     height: 110.0,
          //     width: 110.0,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(55)
          //     ),
          //     // child: CircleAvatar(
          //     //   radius: 55,
          //     //   // backgroundImage: _imageFile != null
          //     //   //     ? AssetImage('images/profile.jpg')
          //     //   //     : FileImage(File(_imageFile.path)),
          //     // ),
          //   ),
          // ),
          Positioned(
            right: 110,
            left: 220,
            top: 100,
            child: InkWell(
              onTap: _pickImage,
              child: Container(
                width: 21,
                height: 21,
                child: Image.asset('images/pen.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
