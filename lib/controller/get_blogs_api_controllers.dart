import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api/api_setting.dart';
import '../models/blogs_model.dart';
import '../prefs/prefs.dart';

class GetBlogsApiController {
  Future<List<BlogsModel>> getBlogs() async {
    String token = SharedPrefController().getValueFor('token');
    Uri uri = Uri.parse(ApiSetting.GetBlogs);
    http.Response response = await http.get(uri, headers: {
      'Accept': 'application/json',
      'Authorization': token,
    });
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var DecodedData = data['data'] as List;
      List<BlogsModel> blogs =
          DecodedData.map((obj) => BlogsModel.fromJson(obj)).toList();
      return blogs;
    }
    return [];
  }
}
