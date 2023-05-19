import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

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
  void saveData(UserModel user) async {
    await _sharedPreferences.setBool('logged_in', true);

    await _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
    await _sharedPreferences.setString(PrefKeys.id.name, user.id);
    await _sharedPreferences.setString('token', 'Bearer ${user.token}');
    await _sharedPreferences.setString('firstName', user.firstName);
    await _sharedPreferences.setString('lastName', user.lastName);
    await _sharedPreferences.setString('email', user.email);
    //complete the rest of variable methode in the same way
    // all variable in the enum above are same variable in the model user
  }

  Future<void> save({required Map<String, dynamic> user}) async {
    await _sharedPreferences.setBool('logged_in', true);
    await _sharedPreferences.setInt('id', user['id']);
    print('id is ${_sharedPreferences.getInt('id')}');
    await _sharedPreferences.setString('name', user['name']);
    print('name is ${_sharedPreferences.getString('name')}');

    await _sharedPreferences.setString('email', user['email']);
    await _sharedPreferences.setString('image', user['image']);
  }

  Future<void> getToken({required String token}) async {
    await _sharedPreferences.setBool('logged_in', true);
    await _sharedPreferences.setString('token', 'Bearer ${token}');
  }

  Future<void> profile({required String name, required String image}) async {
    print('${_sharedPreferences.getInt('name')}');
    await _sharedPreferences.setString('name', name);
    await _sharedPreferences.setString('image', image);
  }

  int? getID({required String key}) {
    return _sharedPreferences.getInt(key);
  }

  String? getName({required String key}) {
    return _sharedPreferences.getString(key);
  }

  String? getEmail({required String key}) {
    return _sharedPreferences.getString(key);
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
