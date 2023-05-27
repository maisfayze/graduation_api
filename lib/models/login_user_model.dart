import 'dart:ui';

class LogedUserModel {
  LogedUserModel({
    required this.userType,
    required this.doctorName,
    required this.email,
    this.image,
    required this.token,
    required this.isValid,
  });
  late final String doctorName;
  late final String email;
  late String? image;
  late final String token;
  late final String id;
  late final String userType;
  late final bool isValid;

  LogedUserModel.fromJson(Map<String, dynamic> json) {
    doctorName = json['doctorName'];
    email = json['email'];
    image = json['image'];
    token = json['token'];
    id = json['id'];
    userType = json['userType'];
    isValid = json['isValid'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['doctorName'] = doctorName;
    _data['email'] = email;
    _data['image'] = image;
    _data['token'] = token;
    _data['isValid'] = isValid;
    _data['id'] = id;

    return _data;
  }
}
