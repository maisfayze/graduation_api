class HomeSearchResultModel {
  HomeSearchResultModel({
    required this.doctorImage,
    required this.doctorName,
    required this.specialityName,
    required this.idDoctor,
    required this.degree,
  });
  late final String doctorImage;
  late final String doctorName;
  late final String specialityName;
  late final int idDoctor;
  late final String degree;

  HomeSearchResultModel.fromJson(Map<String, dynamic> json) {
    doctorImage = json['doctorImage'];
    doctorName = json['doctorName'];
    specialityName = json['specialityName'];
    idDoctor = json['idDoctor'];
    degree = json['degree'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['doctorImage'] = doctorImage;
    _data['doctorName'] = doctorName;
    _data['specialityName'] = specialityName;
    _data['idDoctor'] = idDoctor;
    _data['degree'] = degree;
    return _data;
  }
}
