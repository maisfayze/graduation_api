import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/ui/patient/PatientBtn/patient_home.dart';

import '../../../models/btn.dart';
import '../doctorProfile/my_patient_appointment.dart';
import 'doctor_chat.dart';
import '../../patientProfile/profile.dart';
import '../doctorProfile/doctor_profile.dart';
import 'chat.dart';
import 'doctor_home.dart';
import 'my_appoitment.dart';

class BtnDoc extends StatefulWidget {
  BtnDoc({Key? key}) : super(key: key);
  static const id = 'BtnDoc';

  @override
  State<BtnDoc> createState() => _BtnDocState();
}

class _BtnDocState extends State<BtnDoc> {
  int _selectedItem = 0;

  final List<BtnScreen> _screens = <BtnScreen>[
    const BtnScreen(title: 'Home', widget: DoctorHome()),
    const BtnScreen(title: 'Appointment', widget: MyPatientAppointments()),
    const BtnScreen(title: 'Chat', widget: DocChatScreen()),
    const BtnScreen(title: 'Profile', widget: DoctorProfile()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedItem].widget,
      bottomNavigationBar: Container(
        height: 90.h,
        decoration: BoxDecoration(
          border:
              Border(top: BorderSide(width: .5.w, color: Colors.grey.shade200)),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          onTap: (int selectItem) {
            setState(() => _selectedItem = selectItem);
          },
          unselectedItemColor: Colors.grey.shade400,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: const Color(0xFFFFBE00),
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedItem,
          selectedIconTheme: const IconThemeData(
            size: 30,
            color: Constant.primaryColor,
          ),
          selectedLabelStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
          iconSize: 25,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.event_note_sharp),
                // activeIcon: Icon(Icons.home_rounded),
                label: 'Appointment'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
