import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api/api_setting.dart';
import '../models/scheduletimingsForDocto_model.dart';
import '../prefs/prefs.dart';

class GetScheduletimingsForDoctor {
  Future<List<ScheduletimingsForDoctor>> getScheduletimingsForDoctor(
      {required int id, required String date}) async {
    String token = SharedPrefController().getValueFor('token');
    Uri uri = Uri.parse(
        'http://ac7a1ae098-001-site1.etempurl.com/api/scheduletiming/getScheduletimingsForDoctor?date=$date&doctorId=$id');
    http.Response response = await http.get(uri, headers: {
      'Accept': 'application/json',
      'Authorization': token,
    });
    var data = jsonDecode(response.body);

    print('mmm${data}');
    if (response.statusCode == 200) {
      var DecodedData = data['data'] as List;
      print("ScheduletimingsForDoctor${DecodedData}");
      List<ScheduletimingsForDoctor> time =
          DecodedData.map((obj) => ScheduletimingsForDoctor.fromJson(obj))
              .toList();

      return time;
    }
    return [];
  }
}
