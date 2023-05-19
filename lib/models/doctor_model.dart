class Doctor {
  late String id;
  late String email;
  late String token;
  late bool isValid;
  late String message;

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    token = json['token'];
    isValid = json['isValid'];
    message = json['message'];
  }
}
