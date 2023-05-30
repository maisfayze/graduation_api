import 'dart:convert';

import '../api/api_setting.dart';
import '../models/business_hours_model.dart';
import '../models/business_hours_model.dart';
import '../models/business_hours_model.dart';
import '../prefs/prefs.dart';
import 'package:http/http.dart' as http;

class GetBusinessHours {
  Future<List<BusinessHoursModel>> getHours({required int id}) async {
    String token = SharedPrefController().getValueFor('token');
    Uri uri = Uri.parse('${ApiSetting.GetBusinessHours}$id');
    http.Response response = await http.get(uri, headers: {
      'Accept': 'application/json',
      'Authorization': token,
    });
    // print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var DecodedData = data['data'] as List;
      List<BusinessHoursModel> hours =
          DecodedData.map((obj) => BusinessHoursModel.fromJson(obj)).toList();
      return hours;
    }
    return [];
  }
}
