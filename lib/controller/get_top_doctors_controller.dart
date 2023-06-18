import 'dart:convert';

import 'package:graduation/api/api_setting.dart';
import 'package:graduation/prefs/prefs.dart';
import 'package:http/http.dart' as http;

import '../models/specialities_model.dart';
import '../models/top_doctors.dart';

class GetTopDoctors {
  Future<List<TopDoctorsModel>> getTops() async {
    String token = SharedPrefController().getValueFor('token');
    Uri uri = Uri.parse(ApiSetting.GetTops);
    http.Response response = await http.get(uri, headers: {
      'Accept': 'application/json',
      'Authorization': token,
    });
    // print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var DecodedData = data['data'] as List;
      List<TopDoctorsModel> tops =
          DecodedData.map((obj) => TopDoctorsModel.fromJson(obj)).toList();
      return tops;
    }
    return [];
  }
}
