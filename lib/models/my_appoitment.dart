class MyAppData {
  MyAppData({
    required this.appointmentId,
    required this.doctorName,
    required this.doctorId,
    required this.doctorSpecialty,
    required this.doctorImage,
    required this.day,
    required this.date,
    required this.time,
  });
  late final int appointmentId;
  late final String doctorName;
  late final String doctorId;
  late final String doctorSpecialty;
  late final String doctorImage;
  late final String day;
  late final String date;
  late final String time;

  MyAppData.fromJson(Map<String, dynamic> json) {
    appointmentId = json['appointmentId'];
    doctorName = json['doctorName'];
    doctorId = json['doctorId'];
    doctorSpecialty = json['doctorSpecialty'];
    doctorImage = json['doctorImage'];
    day = json['day'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['appointmentId'] = appointmentId;
    _data['doctorName'] = doctorName;
    _data['doctorId'] = doctorId;
    _data['doctorSpecialty'] = doctorSpecialty;
    _data['doctorImage'] = doctorImage;
    _data['day'] = day;
    _data['date'] = date;
    _data['time'] = time;
    return _data;
  }
}
