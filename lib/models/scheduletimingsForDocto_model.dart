class ScheduletimingsForDoctor {
  ScheduletimingsForDoctor({
    required this.item1,
    required this.item2,
  });
  late final String item1;
  late final int item2;

  ScheduletimingsForDoctor.fromJson(Map<String, dynamic> json) {
    item1 = json['item1'];
    item2 = json['item2'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['item1'] = item1;
    _data['item2'] = item2;
    return _data;
  }
}
