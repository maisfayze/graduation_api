import 'dart:convert';

import 'package:graduation/api/api_setting.dart';
import 'package:graduation/prefs/prefs.dart';
import 'package:http/http.dart' as http;

import '../models/specialities_model.dart';

class GetSpecialities {
  Future<List<SpecialitiesModel>> getSpec() async {
    String token = SharedPrefController().getValueFor('token');
    Uri uri = Uri.parse(ApiSetting.GetSpecialities);
    http.Response response = await http.get(uri, headers: {
      'Accept': 'application/json',
      'Authorization': token,
    });
    // print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var DecodedData = data['data'] as List;
      List<SpecialitiesModel> spec =
          DecodedData.map((obj) => SpecialitiesModel.fromJson(obj)).toList();
      return spec;
    }
    return [];
  }
}
