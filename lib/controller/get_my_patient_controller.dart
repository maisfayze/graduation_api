import 'dart:convert';

import '../api/api_setting.dart';
import '../models/my_patient_model.dart';
import '../prefs/prefs.dart';
import 'package:http/http.dart' as http;

class GetMyPatient {
  Future<List<MyPatientModel>> getMyPatient() async {
    String token = SharedPrefController().getValueFor('token');
    Uri uri = Uri.parse(ApiSetting.GetMyPatient);
    http.Response response = await http.get(uri, headers: {
      'Accept': 'application/json',
      'Authorization': token,
    });
    // print('mmmmmmmmmmmmmm${response.body}');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var DecodedData = data['data'] as List;
      print('mmmmmmmmmmmmmm${DecodedData}');
      List<MyPatientModel> myPatient =
          DecodedData.map((obj) => MyPatientModel.fromJson(obj)).toList();
      return myPatient;
    }
    return [];
  }
}
