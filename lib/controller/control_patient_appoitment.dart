import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api/api_setting.dart';
import '../models/api_response.dart';
import '../models/blogs_model.dart';
import '../prefs/prefs.dart';

class ControlPatientAppoitnment {
  Future<ApiResponse> deleteApp({required int id}) async {
    String token = SharedPrefController().getValueFor('token');
    Uri uri = Uri.parse(
        'http://ac7a1ae098-001-site1.etempurl.com/api/appoitment/DeleteMyAppointment?appointmentId=$id');
    http.Response response = await http.put(uri, headers: {
      'Accept': 'application/json',
      'Authorization': token,
    });
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return ApiResponse(msg: data['message'], sucess: data['isSuccess']);
    } else {
      return ApiResponse(msg: data['message'], sucess: data['isSuccess']);
    }
  }
}
