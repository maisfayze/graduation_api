class SignupDocModel {
  SignupDocModel({
    required this.id,
    required this.email,
    required this.doctorName,
    required this.userType,
    required this.isValid,
    required this.token,
  });
  late final String id;
  late final String email;
  late final String doctorName;
  late final String userType;
  late final bool isValid;
  late final String token;

  SignupDocModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    doctorName = json['doctorName'];
    userType = json['userType'];
    isValid = json['isValid'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['email'] = email;
    _data['doctorName'] = doctorName;
    _data['userType'] = userType;
    _data['isValid'] = isValid;
    _data['token'] = token;
    return _data;
  }
}
