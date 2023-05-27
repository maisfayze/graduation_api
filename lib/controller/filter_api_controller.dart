import 'dart:convert';

import 'package:graduation/models/filtered_result.dart';
import 'package:http/http.dart' as http;

import '../prefs/prefs.dart';

class FilterApiController {
  Future<List<ResultModel>> getDataFromFilter(
      {required String? gender, required int? spec}) async {
    String token = SharedPrefController().getValueFor('token');

    Uri uri = Uri.parse(
        'http://ac7a1ae098-001-site1.etempurl.com/api/doctor/SearchDoctors?gender=$gender&Specialty=$spec');
    http.Response response = await http.get(uri, headers: {
      'Accept': 'application/json',
      'Authorization': token,
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var DecodedData = data['data'] as List;
      List<ResultModel> result =
          DecodedData.map((obj) => ResultModel.fromJson(obj)).toList();
      return result;
    }
    return [];
  }
}
