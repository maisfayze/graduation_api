class ResultModel {
  ResultModel({
    required this.doctorImage,
    required this.doctorName,
    required this.specialityName,
    required this.idDoctor,
    required this.clinicAddress,
    required this.degree,
  });
  late final String doctorImage;
  late final String doctorName;
  late final String specialityName;
  late final int idDoctor;
  late final String clinicAddress;
  late final String degree;

  ResultModel.fromJson(Map<String, dynamic> json) {
    doctorImage = json['doctorImage'];
    doctorName = json['doctorName'];
    specialityName = json['specialityName'];
    idDoctor = json['idDoctor'];
    clinicAddress = json['clinicAddress'];
    degree = json['degree'];
  }

  Map<String, dynamic> toJson() {
    final _ResultModel = <String, dynamic>{};
    _ResultModel['doctorImage'] = doctorImage;
    _ResultModel['doctorName'] = doctorName;
    _ResultModel['specialityName'] = specialityName;
    _ResultModel['idDoctor'] = idDoctor;
    _ResultModel['clinicAddress'] = clinicAddress;
    _ResultModel['degree'] = degree;
    return _ResultModel;
  }
}
