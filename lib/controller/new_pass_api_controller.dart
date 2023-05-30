import 'dart:convert';

import 'package:graduation/api/api_setting.dart';
import 'package:http/http.dart' as http;

import '../models/api_response.dart';
import '../prefs/prefs.dart';

class NewPassApiController {
  Future<ApiResponse> NewPass(
      {required String old,
      required String newPass,
      required String confirmNew}) async {
    String token = SharedPrefController().getValueFor('token');

    Uri uri = Uri.parse(ApiSetting.ChangePass);
    http.Response response = await http.put(uri, body: {
      'OldPassword': old,
      'NewPassword': newPass,
      'ConfirmNewPassword': confirmNew
    }, headers: {
      'Accept': 'application/json',
      'Authorization': token,
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ApiResponse(
        msg: json['message'],
        sucess: json['isSuccess'],
      );
    }
    return ApiResponse(
      msg: 'Something went wrong,please try again',
      sucess: false,
    );
  }
}
