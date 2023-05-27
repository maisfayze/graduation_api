class SpecialitiesModel {
  SpecialitiesModel({
    required this.id,
    required this.specialtyName,
    required this.image,
  });
  late final int id;
  late final String specialtyName;
  late final String image;

  SpecialitiesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    specialtyName = json['specialtyName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['specialtyName'] = specialtyName;
    _data['image'] = image;
    return _data;
  }
}
