class ReviewModel {
  ReviewModel({
    required this.patientId,
    required this.patientName,
    required this.patientImage,
    required this.review,
    required this.creatdDate,
  });
  late final String patientId;
  late final String patientName;
  late final String patientImage;
  late final String review;
  late final String creatdDate;

  ReviewModel.fromJson(Map<String, dynamic> json) {
    patientId = json['patientId'];
    patientName = json['patientName'];
    patientImage = json['patientImage'];
    review = json['review'];
    creatdDate = json['creatdDate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['patientId'] = patientId;
    _data['patientName'] = patientName;
    _data['patientImage'] = patientImage;
    _data['review'] = review;
    _data['creatdDate'] = creatdDate;
    return _data;
  }
}
