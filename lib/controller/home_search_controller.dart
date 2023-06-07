import 'dart:convert';

import 'package:graduation/models/filtered_result.dart';
import 'package:http/http.dart' as http;

import '../models/home_search_result_model.dart';
import '../prefs/prefs.dart';

class HomeSearchControllerApi {
  Future<List<HomeSearchResultModel>> getLocationData(
      {required String? clinicAddress}) async {
    String token = SharedPrefController().getValueFor('token');

    Uri uri = Uri.parse(
        'http://ac7a1ae098-001-site1.etempurl.com/api/doctor/SearchByClinicNameOrAddress?clinicAddress=$clinicAddress');
    http.Response response = await http.get(uri, headers: {
      'Accept': 'application/json',
      'Authorization': token,
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var DecodedData = data['data'] as List;
      List<HomeSearchResultModel> result =
          DecodedData.map((obj) => HomeSearchResultModel.fromJson(obj))
              .toList();
      return result;
    }
    return [];
  }

  Future<List<HomeSearchResultModel>> getClinicNameData(
      {required String? clinicName}) async {
    String token = SharedPrefController().getValueFor('token');

    Uri uri = Uri.parse(
        'http://ac7a1ae098-001-site1.etempurl.com/api/doctor/SearchByClinicNameOrAddress?clinicName=$clinicName');
    http.Response response = await http.get(uri, headers: {
      'Accept': 'application/json',
      'Authorization': token,
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var DecodedData = data['data'] as List;
      List<HomeSearchResultModel> result =
          DecodedData.map((obj) => HomeSearchResultModel.fromJson(obj))
              .toList();
      return result;
    }
    return [];
  }
}
