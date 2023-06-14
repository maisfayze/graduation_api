class MyPatientModel {
  MyPatientModel({
    required this.patientName,
    required this.patientImage,
    this.address,
    required this.email,
    this.bloodGroup,
  });
  late final String patientName;
  late final String patientImage;
  late final String? address;
  late final String email;
  late final String? bloodGroup;

  MyPatientModel.fromJson(Map<String, dynamic> json) {
    patientName = json['patientName'];
    patientImage = json['patientImage'];
    address = json['address'];
    email = json['email'];
    bloodGroup = json['bloodGroup'];
  }

  Map<String, dynamic> toJson() {
    final _MyPatient = <String, dynamic>{};
    _MyPatient['patientName'] = patientName;
    _MyPatient['patientImage'] = patientImage;
    _MyPatient['address'] = address;
    _MyPatient['email'] = email;
    _MyPatient['bloodGroup'] = bloodGroup;
    return _MyPatient;
  }
}
