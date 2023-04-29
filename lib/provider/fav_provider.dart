import 'package:flutter/cupertino.dart';
import 'package:graduation/models/doctor.dart';

class FavouriteProvider with ChangeNotifier {
  List<DoctorModel> _list = [];
  List<DoctorModel> get FavList => _list;
  int get listLength => _list.length;
  void addDoc(DoctorModel doc) {
    _list.add(doc);
    notifyListeners();
  }

  // bool isExist(DoctorModel doc) {
  //   final isExist = list.contains(doc);
  //   return isExist;
  // }
  void RemoveDoc(DoctorModel doc) {
    _list.remove(doc);
    notifyListeners();
  }

  void toggleFavorite(DoctorModel doc) {
    final isExist = _list.contains(doc);
    if (isExist) {
      _list.remove(doc);
    } else {
      _list.add(doc);
    }
    notifyListeners();
  }

  void removeDoc({required int index}) {
    _list.removeAt(index);
    // list.remove(removed);
    notifyListeners();
  }

  void remove(DoctorModel doc) {
    _list.remove(doc);
    // list.remove(removed);
    notifyListeners();
  }

  DoctorModel getData({required int id}) {
    return _list.elementAt(id);
  }

  void toggle(DoctorModel doc) {
    doc.toggle();
    notifyListeners();
  }
}
