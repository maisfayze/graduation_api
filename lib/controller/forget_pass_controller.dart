import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/api_response.dart';

class ForgetPassApiController {
  Future<bool> forgetPass({required String email}) async {
    Uri uri = Uri.parse(
        'http://ac7a1ae098-001-site1.etempurl.com/api/doctor/SendEmailResetPassword');
    http.Response response = await http.put(uri, body: {'email': email});
    var code = jsonDecode(response.body)['data'];
    print('forget${code}');
    if (response.statusCode == 200) {
      var code = jsonDecode(response.body)['data']['code'];
      print('code is$code');
      return true;
    } else if (response.statusCode != 500) {
      ApiResponse(
          msg: jsonDecode(response.body)['isSuccess'],
          sucess: jsonDecode(response.body)['message']);
    } else {
      ApiResponse(msg: 'Something went wrong,please try again', sucess: true);
    }
    return false;
  }

  Future<ApiResponse> Code(
      {required String email, required String? code}) async {
    Uri uri = Uri.parse(
        'http://ac7a1ae098-001-site1.etempurl.com/api/doctor/ConfirmationCode?email=$email');
    http.Response response =
        await http.post(uri, body: {'confirmationCode': code});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ApiResponse(
        msg: json['message'],
        sucess: json['isSuccess'],
      );
    }
    return ApiResponse(
      msg: 'Something went wrong,please try again',
      sucess: true,
    );
  }

  Future<ApiResponse> ResetPass(
      {required String email,
      required String newpass,
      required String confirmpass}) async {
    Uri uri = Uri.parse(
        'http://ac7a1ae098-001-site1.etempurl.com/api/doctor/ResetPassword?email=$email');
    http.Response response = await http.post(uri,
        body: {'NewPassword': newpass, 'ConfirmNewPassword': confirmpass});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ApiResponse(
        msg: json['message'],
        sucess: json['isSuccess'],
      );
    }
    return ApiResponse(
      msg: 'Something went wrong,please try again',
      sucess: true,
    );
  }
}
