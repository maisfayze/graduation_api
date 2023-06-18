import 'dart:convert';

import 'package:graduation/api/api_setting.dart';
import 'package:graduation/prefs/prefs.dart';
import 'package:http/http.dart' as http;

import '../models/overview.dart';
import '../models/review_model.dart';

class GetReview {
  Future<List<ReviewModel>> getReView({required int id}) async {
    String token = SharedPrefController().getValueFor('token');
    Uri uri = Uri.parse(
        'http://ac7a1ae098-001-site1.etempurl.com/api/review/GetAllReviewsForDoctor?doctorId=$id');
    http.Response response = await http.get(uri, headers: {
      'Accept': 'application/json',
      'Authorization': token,
    });
    // print('my commmenttttttt${response.body}');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var DecodedData = data['data'] as List;
      List<ReviewModel> review =
          DecodedData.map((obj) => ReviewModel.fromJson(obj)).toList();

      return review;
    }
    return [];
  }
}
