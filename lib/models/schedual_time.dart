class ScheduleTimingsModel {
  ScheduleTimingsModel({
    required this.doctorId,
    required this.durationTime,
    required this.day,
    required this.date,
    required this.startTime,
    required this.endTime,
  });
  late final int doctorId;
  late final int durationTime;
  late final String day;
  late final String date;
  late final String startTime;
  late final String endTime;

  ScheduleTimingsModel.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctorId'];
    durationTime = json['durationTime'];
    day = json['day'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['doctorId'] = doctorId;
    _data['durationTime'] = durationTime;
    _data['day'] = day;
    _data['date'] = date;
    _data['startTime'] = startTime;
    _data['endTime'] = endTime;
    return _data;
  }
}
