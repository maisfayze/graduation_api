import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/constant/constant.dart';
import 'package:graduation/ui/patient/PatientBtn/patient_home.dart';

import '../../../models/btn.dart';
import '../../profile/profile.dart';
import 'chat.dart';
import 'my_appoitment.dart';

class BtnPatient extends StatefulWidget {
  BtnPatient({Key? key}) : super(key: key);
  static const id = 'BtnPatient';

  @override
  State<BtnPatient> createState() => _BtnPatientState();
}

class _BtnPatientState extends State<BtnPatient> {
  int _selectedItem = 0;

  final List<BtnScreen> _screens = <BtnScreen>[
    const BtnScreen(title: 'Home', widget: PatientHome()),
    const BtnScreen(title: 'Appointment', widget: MyAppointment()),
    const BtnScreen(title: 'Chat', widget: ChatScreen()),
    const BtnScreen(title: 'Profile', widget: Profile()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedItem].widget,
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
          border:
              Border(top: BorderSide(width: .5, color: Colors.grey.shade200)),
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
            size: 40,
            color: Constant.primaryColor,
          ),
          selectedLabelStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
          iconSize: 33,
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
