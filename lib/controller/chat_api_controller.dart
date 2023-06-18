import 'dart:convert';

import '../models/ListChatModel.dart';
import '../prefs/prefs.dart';
import 'package:http/http.dart' as http;

class chatApiController {
  Future<List<ListChatModel>> getListChat() async {
    String token = SharedPrefController().getValueFor('token');
    Uri uri =
        Uri.parse('http://ac7a1ae098-001-site1.etempurl.com/chat/GetListChat');
    http.Response response = await http.get(uri, headers: {
      'Accept': 'application/json',
      'Authorization': token,
    });
    // print('chaattttt${response.body}');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var DecodedData = data['data'] as List;
      List<ListChatModel> chatList =
          DecodedData.map((obj) => ListChatModel.fromJson(obj)).toList();
      return chatList;
    }
    return [];
  }
}
