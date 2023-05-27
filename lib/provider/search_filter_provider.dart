import 'package:flutter/cupertino.dart';

import '../models/filtered_result.dart';

class FilterProvider with ChangeNotifier {
  String? gender;
  int? spec;
  List<ResultModel> result = [];
  int get listLength => result.length;
  void addDoc(List<ResultModel> doc) {
    notifyListeners();
  }
}
