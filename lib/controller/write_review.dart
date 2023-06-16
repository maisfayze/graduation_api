import 'dart:convert';

import 'package:graduation/api/api_setting.dart';
import 'package:http/http.dart' as http;

import '../models/LogedUser.dart';
import '../models/api_response.dart';
import '../models/login_user_model.dart';
import '../models/signup_doc_model.dart';
import '../prefs/prefs.dart';
import '../utiles/helpers.dart';

class WriteReview with Helpers {
  Future<bool> writeComment({required int id, required String comment}) async {
    String token = SharedPrefController().getValueFor('token');

    Uri uri = Uri.parse(
        'http://ac7a1ae098-001-site1.etempurl.com/api/review/GetAllReviewsForDoctor?doctorId=$id');
    http.Response response = await http.post(uri, body: {
      'Comment': comment
    }, headers: {
      'Accept': 'application/json',
      'Authorization': token,
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print('${json['message']}');
      return true;
    } else {
      return false;
    }
  }
}
