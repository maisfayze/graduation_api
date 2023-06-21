class ReviewModel {
  ReviewModel({
    required this.patientId,
    required this.patientName,
    required this.patientImage,
    required this.review,
    required this.created,
  });
  late final String patientId;
  late final String patientName;
  late final String patientImage;
  late final String review;
  late final String created;

  ReviewModel.fromJson(Map<String, dynamic> json) {
    patientId = json['patientId'];
    patientName = json['patientName'];
    patientImage = json['patientImage'];
    review = json['review'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final _ReviewModel = <String, dynamic>{};
    _ReviewModel['patientId'] = patientId;
    _ReviewModel['patientName'] = patientName;
    _ReviewModel['patientImage'] = patientImage;
    _ReviewModel['review'] = review;
    _ReviewModel['created'] = created;
    return _ReviewModel;
  }
}
