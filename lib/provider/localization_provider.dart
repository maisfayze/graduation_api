import 'package:flutter/cupertino.dart';

class LocalizationProvider extends ChangeNotifier {
  String languages = 'en';
  String languagesText = ' العربية';

  void changLang() {
    languages = languages == 'ar' ? 'en' : 'ar';
    languagesText = languagesText == 'En' ? 'العربية' : 'En';
    notifyListeners();
  }
}
