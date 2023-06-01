import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../api/api_setting.dart';
import '../models/api_response.dart';
import '../models/create_app_model.dart';
import '../models/login_user_model.dart';
import '../prefs/prefs.dart';
import '../utiles/helpers.dart';
import 'package:http/http.dart' as http;

class CreateAppointments with Helpers {
  Future<CreateAppModel?> createAppointments({
    required String id,
    required String date,
    required String day,
    required String Start,
    required String End,
  }) async {
    String token = SharedPrefController().getValueFor('token');
    print('id$id,$date,$day,$Start,$End');
    Uri uri = Uri.parse(ApiSetting.CreateAppointments);

    http.Response response = await http.post(uri, body: {
      'DoctorId': id,
      'Date': date,
      'Day': day,
      'StartTime': Start,
      'EndTime': End,
      'Status': 'false',
    }, headers: {
      'Accept': 'application/json',
      'Authorization': token,
    });
    print('the body is${response.body}');

    var json = jsonDecode(response.body);
    // print('$json');
    var decodedJson = json['data'];

    CreateAppModel user = CreateAppModel.fromJson(decodedJson);
    print('the user is${user.endTime}');

    return user;
  }
}
