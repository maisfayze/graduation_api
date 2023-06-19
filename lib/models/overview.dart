class OverviewModel {
  OverviewModel({
    required this.fullName,
    required this.userId,
    required this.email,
    required this.doctorImage,
    required this.gender,
    required this.aboutMe,
    required this.degree,
    required this.college,
    required this.yearOfCompletion,
    required this.hospitalName,
    required this.hospitalFrom,
    required this.hospitalTo,
    required this.designation,
    required this.awards,
    required this.awardsYear,
    required this.registration,
    required this.doctorServices,
    required this.pricing,
    required this.specialtyName,
    required this.clinicName,
    required this.clinicAddress,
    required this.membership,
  });
  late final String fullName;
  late final String userId;
  late final String email;
  late final String doctorImage;
  late final String gender;
  late final String aboutMe;
  late final String degree;
  late final String college;
  late final String yearOfCompletion;
  late final String hospitalName;
  late final int hospitalFrom;
  late final int hospitalTo;
  late final String designation;
  late final String awards;
  late final int awardsYear;
  late final String registration;
  late final String doctorServices;
  late final String pricing;
  late final String specialtyName;
  late final String clinicName;
  late final String clinicAddress;
  late final String membership;

  OverviewModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    fullName = json['fullName'];
    email = json['email'];
    doctorImage = json['doctorImage'];
    gender = json['gender'];
    aboutMe = json['aboutMe'];
    degree = json['degree'];
    college = json['college'];
    yearOfCompletion = json['yearOfCompletion'];
    hospitalName = json['hospitalName'];
    hospitalFrom = json['hospitalFrom'];
    hospitalTo = json['hospitalTo'];
    designation = json['designation'];
    awards = json['awards'];
    awardsYear = json['awardsYear'];
    registration = json['registration'];
    doctorServices = json['doctorServices'];
    pricing = json['pricing'];
    specialtyName = json['specialtyName'];
    clinicName = json['clinicName'];
    clinicAddress = json['clinicAddress'];
    membership = json['membership'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fullName'] = fullName;
    _data['email'] = email;
    _data['doctorImage'] = doctorImage;
    _data['gender'] = gender;
    _data['aboutMe'] = aboutMe;
    _data['degree'] = degree;
    _data['college'] = college;
    _data['yearOfCompletion'] = yearOfCompletion;
    _data['hospitalName'] = hospitalName;
    _data['hospitalFrom'] = hospitalFrom;
    _data['hospitalTo'] = hospitalTo;
    _data['designation'] = designation;
    _data['awards'] = awards;
    _data['awardsYear'] = awardsYear;
    _data['registration'] = registration;
    _data['doctorServices'] = doctorServices;
    _data['pricing'] = pricing;
    _data['specialtyName'] = specialtyName;
    _data['clinicName'] = clinicName;
    _data['clinicAddress'] = clinicAddress;
    _data['membership'] = membership;
    return _data;
  }
}
