// import 'dart:convert';
//
// import 'package:graduation/models/LogedUser.dart';
//
// import '../api/api_setting.dart';
// import '../models/api_response.dart';
// import 'package:http/http.dart' as http;
//
// import '../models/user_model.dart';
// import '../prefs/prefs.dart';
// import '../utiles/helpers.dart';
//
// class LoginApiController with Helpers {
//   Future<ApiResponse> login({required LogedUser user}) async {
//     Uri uri =
//         Uri.parse('http://ac7a1ae098-001-site1.etempurl.com/api/doctor/SignIn');
//     http.Response response = await http
//         .post(uri, body: {'email': user.email, 'password': user.password});
//     print('before if');
//     var json = jsonDecode(response.body);
//
//     if (response.statusCode == 200 || response.statusCode == 400) {
//       // var json = jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         print('after if');
//
//         UserModel user = UserModel.fromJson(json);
//         SharedPrefController().saveData(user);
//       }
//       return ApiResponse('Login successfully', true);
//
//       // return ApiResponse(json['message'], json['isValid']);
//     } else {
//       print('from api $json');
//       return ApiResponse('something went wrong', false);
//     }
//   }
// }
