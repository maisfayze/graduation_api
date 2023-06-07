import 'dart:ui';

class LogedUserModel {
  LogedUserModel({
    required this.userType,
    required this.fullName,
    required this.email,
    required this.image,
    required this.token,
    required this.isValid,
    required this.doctorId,
  });
  late final String fullName;
  late final String email;
  late final String image;
  late final String token;
  late final String id;
  late final String userType;
  late final bool isValid;
  late final int doctorId;

  LogedUserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
    image = json['image'];
    token = json['token'];
    id = json['id'];
    userType = json['userType'];
    isValid = json['isValid'];
    doctorId = json['doctorId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fullName'] = fullName;
    _data['email'] = email;
    _data['image'] = image;
    _data['token'] = token;
    _data['isValid'] = isValid;
    _data['id'] = id;
    _data['doctorId'] = doctorId;

    return _data;
  }
}
