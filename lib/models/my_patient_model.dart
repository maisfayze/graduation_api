class MyPatientModel {
  MyPatientModel({
    required this.patientName,
    required this.patientEmail,
    required this.bloodGroup,
    required this.patientImage,
  });
  late final String patientName;
  late final String patientEmail;
  late final String? bloodGroup;
  late final String? patientImage;

  MyPatientModel.fromJson(Map<String, dynamic> json) {
    patientName = json['patientName'];
    patientEmail = json['patientEmail'];
    bloodGroup = json['bloodGroup'];
    patientImage = json['patientImage'];
  }

  Map<String, dynamic> toJson() {
    final _MyPatient = <String, dynamic>{};
    _MyPatient['patientName'] = patientName;
    _MyPatient['patientEmail'] = patientEmail;
    _MyPatient['bloodGroup'] = bloodGroup;
    _MyPatient['patientImage'] = patientImage;
    return _MyPatient;
  }
}
