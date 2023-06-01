import 'dart:convert';

import '../api/api_setting.dart';
import '../models/create_app_model.dart';
import '../models/schedual_time.dart';
import '../prefs/prefs.dart';
import 'package:http/http.dart' as http;

class ScheduletimingApiController {
  Future<ScheduleTimingsModel?> addscheduletiming({
    required String date,
    required String day,
    required String Start,
    required String End,
    required String duration,
  }) async {
    String token = SharedPrefController().getValueFor('token');
    print(',$date,$day,$Start,$End');
    Uri uri = Uri.parse(
        'http://ac7a1ae098-001-site1.etempurl.com/api/scheduletiming/addscheduletiming');

    http.Response response = await http.post(uri, body: {
      'DurationTime': duration,
      'Day': day,
      'Date': date,
      'StartTime': Start,
      'EndTime': End,
    }, headers: {
      'Accept': 'application/json',
      'Authorization': token,
    });
    print('the body is${response.body}');

    var json = jsonDecode(response.body);
    // print('$json');
    var decodedJson = json['data'];

    ScheduleTimingsModel time = ScheduleTimingsModel.fromJson(decodedJson);
    print('the user is${time.endTime}');

    return time;
  }
}
