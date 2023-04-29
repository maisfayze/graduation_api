class DoctorModel {
  String img;
  String name;
  double rate;
  String spec;
  bool isfav;
  void toggle() {
    isfav = !isfav;
  }

  DoctorModel(
      {required this.img,
      required this.name,
      required this.rate,
      required this.spec,
      this.isfav = false});
}
