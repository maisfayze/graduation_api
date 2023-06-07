class SignupPatientModel {
  SignupPatientModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.userType,
    required this.isValid,
    required this.token,
  });
  late final String email;
  late final String firstName;
  late final String lastName;
  late final String userType;
  late final bool isValid;
  late final String token;

  SignupPatientModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userType = json['userType'];
    isValid = json['isValid'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['userType'] = userType;
    _data['isValid'] = isValid;
    _data['token'] = token;
    return _data;
  }
}
