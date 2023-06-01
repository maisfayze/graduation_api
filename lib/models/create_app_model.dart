class CreateAppModel {
  CreateAppModel({
    required this.doctorId,
    required this.doctorName,
    required this.doctorImage,
    required this.doctorSpeciality,
    required this.day,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.status,
  });
  late final int doctorId;
  late final String doctorName;
  late final String doctorImage;
  late final String doctorSpeciality;
  late final String day;
  late final String date;
  late final String startTime;
  late final String endTime;
  late final bool status;

  CreateAppModel.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctorId'];
    doctorName = json['doctorName'];
    doctorImage = json['doctorImage'];
    doctorSpeciality = json['doctorSpeciality'];
    day = json['day'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['doctorId'] = doctorId;
    _data['doctorName'] = doctorName;
    _data['doctorImage'] = doctorImage;
    _data['doctorSpeciality'] = doctorSpeciality;
    _data['day'] = day;
    _data['date'] = date;
    _data['startTime'] = startTime;
    _data['endTime'] = endTime;
    _data['status'] = status;
    return _data;
  }
}
