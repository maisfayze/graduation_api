class MyPatientAppointmentModel {
  MyPatientAppointmentModel({
    required this.patientName,
    required this.patientImage,
    required this.address,
    required this.email,
    required this.day,
    required this.time,
    required this.date,
    this.status,
  });
  late final String patientName;
  late final String patientImage;
  late final String address;
  late final String email;
  late final String day;
  late final String time;
  late final String date;
  late final bool? status;

  MyPatientAppointmentModel.fromJson(Map<String, dynamic> json) {
    patientName = json['patientName'];
    patientImage = json['patientImage'];
    address = json['address'];
    email = json['email'];
    day = json['day'];
    time = json['time'];
    date = json['date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['patientName'] = patientName;
    _data['patientImage'] = patientImage;
    _data['address'] = address;
    _data['email'] = email;
    _data['day'] = day;
    _data['time'] = time;
    _data['date'] = date;
    _data['status'] = status;
    return _data;
  }
}
