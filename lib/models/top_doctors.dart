class TopDoctorsModel {
  TopDoctorsModel({
    required this.doctorImage,
    required this.doctorName,
    required this.specialityName,
    required this.doctorId,
    required this.clinicAddress,
  });
  late final String doctorImage;
  late final String doctorName;
  late final String specialityName;
  late final int doctorId;
  late final String clinicAddress;

  TopDoctorsModel.fromJson(Map<String, dynamic> json) {
    doctorImage = json['doctorImage'];
    doctorName = json['doctorName'];
    specialityName = json['specialityName'];
    doctorId = json['doctorId'];
    clinicAddress = json['clinicAddress'];
  }

  Map<String, dynamic> toJson() {
    final _TopDoctorsModel = <String, dynamic>{};
    _TopDoctorsModel['doctorImage'] = doctorImage;
    _TopDoctorsModel['doctorName'] = doctorName;
    _TopDoctorsModel['specialityName'] = specialityName;
    _TopDoctorsModel['doctorId'] = doctorId;
    _TopDoctorsModel['clinicAddress'] = clinicAddress;
    return _TopDoctorsModel;
  }
}
