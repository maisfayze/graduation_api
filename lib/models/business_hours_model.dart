class BusinessHoursModel {
  BusinessHoursModel({
    required this.day,
    required this.availableTime,
  });
  late final String day;
  late final String availableTime;

  BusinessHoursModel.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    availableTime = json['availableTime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['day'] = day;
    _data['availableTime'] = availableTime;
    return _data;
  }
}
