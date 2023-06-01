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
  static const String GetMyPatient = '${_baseUrl}doctor/GetAllPatients';
  static const String ChangePass = '${_baseUrl}doctor/changepassword';
  static const String getScheduletimingsForDoctor =
      '${_baseUrl}scheduletiming/getScheduletimingsForDoctor?';
  static const String GetMyPatientApp =
      '${_baseUrl}doctor/GetMyPatientAppointment';
  static const String GetMytApp = '${_baseUrl} Patient/GetMyAppointment';

  static const String GetBusinessHours =
      '${_baseUrl}scheduletiming/getBusinessHoursForDoctor?doctorId=';

  static const String CreateAppointments =
      '${_baseUrl}appoitment/CreateAppointments';
}
