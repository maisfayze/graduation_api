import 'dart:convert';

import 'package:graduation/api/api_setting.dart';
import 'package:graduation/models/doctor_model.dart';
import 'package:http/http.dart' as http;

import '../models/LogedUser.dart';
import '../models/api_response.dart';
import '../models/user_model.dart';
import '../prefs/prefs.dart';
import '../utiles/helpers.dart';

class DoctorAuthApiController with Helpers {
  Future<ApiResponse> docLogin({required LogedUser user}) async {
    Uri uri = Uri.parse(ApiSetting.DoctorLogin);
    http.Response response = await http
        .post(uri, body: {'Email': user.email, 'Password': user.password});
    print('before if');
    var json = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      // var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('after if');

        UserModel user = UserModel.fromJson(json);
        SharedPrefController().saveData(user);
      }
      return ApiResponse('Login successfully', true);

      // return ApiResponse(json['message'], json['isValid']);
    } else {
      print('from api $json');
      return ApiResponse('something went wrong', false);
    }
  }

  Future<ApiResponse> docSignUp({
    required String firstName,
    required String lastName,
    required String email,
    required String pass,
  }) async {
    Uri uri = Uri.parse(ApiSetting.DoctorSignUp);
    http.Response response = await http.post(uri, body: {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": pass
    });
    var json = jsonDecode(response.body);
    print(json);

    if (response.statusCode == 200 || response.statusCode == 400) {
      print('${response.statusCode}');
      // var json = jsonDecode(response.body);
      print(json);
      // Doctor doctor = Doctor.fromJson(json);
      return ApiResponse('Signup Successfully', true);
      // return ApiResponse(json['message'], json['isValid']);
    }
    return ApiResponse('something went wrong', false);
  }
  // Future<bool> docSignUp({
  //   required String firstName,
  //   required String lastName,
  //   required String email,
  //   required String pass,
  // }) async {
  //   Uri uri =
  //       Uri.parse('http://ac7a1ae098-001-site1.etempurl.com/api/doctor/SignUp');
  //   var response = await http.post(
  //     uri,
  //     body: {
  //       "firstName": firstName,
  //       "lastName": lastName,
  //       "email": email,
  //       "password": pass
  //     },
  //   );
  //   print('Response status: ${response.statusCode}');
  //   var jsonObject = jsonDecode(response.body);
  //
  //   if (response.statusCode == 200) {
  //     print('created sucess');
  //
  //     // var jsonObject = jsonDecode(response.body);
  //
  //     print(jsonObject);
  //     return true;
  //   } else if (response.statusCode != 500) {
  //     print('error');
  //     // ApiResponse('data', true);
  //     return true;
  //   } else {
  //     print('something went wrong,please try again ');
  //     // showSnackBar(
  //     //     context: context,
  //     //     message: 'something went wrong,please try again ',
  //     //     erorr: true);
  //   }
  //   return false;
  // }
}
