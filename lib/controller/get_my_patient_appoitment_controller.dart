import 'dart:convert';

import '../api/api_setting.dart';
import '../models/my_patient_appoitment.dart';
import '../models/my_patient_model.dart';
import '../prefs/prefs.dart';
import 'package:http/http.dart' as http;

class GetMyPatientAppointment {
  Future<List<MyPatientAppointmentModel>> getMyPatientAppointment() async {
    String token = SharedPrefController().getValueFor('token');
    Uri uri = Uri.parse(ApiSetting.GetMyPatientApp);
    http.Response response = await http.get(uri, headers: {
      'Accept': 'application/json',
      'Authorization': token,
    });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var DecodedData = data['data'] as List;
      List<MyPatientAppointmentModel> myPatientApp =
          DecodedData.map((obj) => MyPatientAppointmentModel.fromJson(obj))
              .toList();
      return myPatientApp;
    }
    return [];
  }
}
