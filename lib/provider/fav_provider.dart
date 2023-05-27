import 'package:flutter/cupertino.dart';
import 'package:graduation/models/doctor.dart';
import 'package:graduation/models/top_doctors.dart';

class FavouriteProvider with ChangeNotifier {
  List<TopDoctorsModel> _list = [];
  List<TopDoctorsModel> get FavList => _list;
  int get listLength => _list.length;
  void addDoc(TopDoctorsModel doc) {
    _list.add(doc);
    notifyListeners();
  }

  // bool isExist(DoctorModel doc) {
  //   final isExist = list.contains(doc);
  //   return isExist;
  // }
  void RemoveDoc(TopDoctorsModel doc) {
    _list.remove(doc);
    notifyListeners();
  }
  //
  // void toggleFavorite(TopDoctorsModel doc) {
  //   final isExist = _list.contains(doc);
  //   if (isExist) {
  //     _list.remove(doc);
  //   } else {
  //     _list.add(doc);
  //   }
  //   notifyListeners();
  // }

  void removeDoc({required int index}) {
    _list.removeAt(index);
    // list.remove(removed);
    notifyListeners();
  }

  void remove(TopDoctorsModel doc) {
    _list.remove(doc);
    // list.remove(removed);
    notifyListeners();
  }

  TopDoctorsModel getData({required int id}) {
    return _list.elementAt(id);
  }

  // void toggle(DoctorModel doc) {
  //   doc.toggle();
  //   notifyListeners();
  // }
}
