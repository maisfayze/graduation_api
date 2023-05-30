import 'dart:convert';

import '../api/api_setting.dart';
import '../models/my_appoitment.dart';
import '../models/my_patient_appoitment.dart';
import '../models/my_patient_model.dart';
import '../prefs/prefs.dart';
import 'package:http/http.dart' as http;

class GetMyAppointment {
  Future<List<MyAppData>> getMyAppointment() async {
    String token = SharedPrefController().getValueFor('token');
    Uri uri = Uri.parse(
        'http://ac7a1ae098-001-site1.etempurl.com/api/Patient/GetMyAppointment');
    http.Response response = await http.get(uri, headers: {
      'Accept': 'application/json',
      'Authorization': token,
    });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var DecodedData = data['data'] as List;
      print('data$DecodedData');

      List<MyAppData> myApp =
          DecodedData.map((obj) => MyAppData.fromJson(obj)).toList();

      return myApp;
    }
    return [];
  }
}
