import 'dart:convert';

import 'package:graduation/api/api_setting.dart';
import 'package:graduation/prefs/prefs.dart';
import 'package:http/http.dart' as http;

import '../models/overview.dart';

class GetOverview {
  Future<List<OverviewModel>> getOverView({required int id}) async {
    String token = SharedPrefController().getValueFor('token');
    Uri uri = Uri.parse('${ApiSetting.getOverView}?doctorId=$id');
    http.Response response = await http.get(uri, headers: {
      'Accept': 'application/json',
      'Authorization': token,
    });
    // print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var DecodedData = data['data'] as List;
      List<OverviewModel> overview =
          DecodedData.map((obj) => OverviewModel.fromJson(obj)).toList();
      return overview;
    }
    return [];
  }
}
