import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_user_model.dart';
import '../models/signup_doc_model.dart';

enum PrefKeys { id, name, email, password, token, loggedIn, code }

class SharedPrefController {
  //singleton
  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  static SharedPrefController? _instance;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  //for example if the logged in is user
  void saveData(LogedUserModel user) async {
    await _sharedPreferences.setBool('logged_in', true);
    await _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
    await _sharedPreferences.setString(PrefKeys.id.name, user.id);
    await _sharedPreferences.setString('token', 'Bearer ${user.token}');
    await _sharedPreferences.setString('fullName', user.fullName);
    await _sharedPreferences.setString('image', user.image ?? '');
    await _sharedPreferences.setString('email', user.email);
    await _sharedPreferences.setInt('doctorId', user.doctorId);
    await _sharedPreferences.setString('id', user.id);
    await _sharedPreferences.setString('userType', user.userType);
    //complete the rest of variable methode in the same way
    // all variable in the enum above are same variable in the model user
  }

  void saveSignup(SignupDocModel user) async {
    await _sharedPreferences.setBool('logged_in', true);
    await _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
    await _sharedPreferences.setString(PrefKeys.id.name, user.id);
    await _sharedPreferences.setString('token', 'Bearer ${user.token}');
    await _sharedPreferences.setString('fullName', user.doctorName);
    await _sharedPreferences.setString('email', user.email);
    await _sharedPreferences.setInt('doctorId', user.id as int);
    await _sharedPreferences.setString('userType', user.userType);
    //complete the rest of variable methode in the same way
    // all variable in the enum above are same variable in the model user
  }

  bool get LoggedIn => _sharedPreferences.getBool('logged_in') ?? false;

  T? getValueFor<T>(String key) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }

  Future<bool> clear() {
    return _sharedPreferences.clear();
  }
}
