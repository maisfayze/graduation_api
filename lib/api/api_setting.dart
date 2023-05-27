class ApiSetting {
  static const String _baseUrl =
      'http://ac7a1ae098-001-site1.etempurl.com/api/';
  static const String patientLogin = '${_baseUrl}';
  static const String patientSignUp = '${_baseUrl}patient/SignUp';
  static const String DoctorLogin = '${_baseUrl}doctor/SignIn';
  static const String DoctorSignUp = '${_baseUrl}doctor/SignUp';
  static const String GetSpecialities =
      '${_baseUrl}specialties/GetAllSpecialties';
  static const String GetTops = '${_baseUrl}doctor/GetTopDoctors';
  static const String GetBlogs = '${_baseUrl}blog/getallblogs';
}
