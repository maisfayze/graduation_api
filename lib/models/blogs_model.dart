class BlogsModel {
  BlogsModel({
    required this.name,
    required this.title,
    required this.content,
    required this.createdDate,
    required this.blogImage,
    required this.doctorImage,
  });
  late final String name;
  late final String title;
  late final String content;
  late final String createdDate;
  late final String blogImage;
  late final String doctorImage;

  BlogsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    content = json['content'];
    createdDate = json['createdDate'];
    blogImage = json['blogImage'];
    doctorImage = json['doctorImage'];
  }

  Map<String, dynamic> toJson() {
    final _BlogsModel = <String, dynamic>{};
    _BlogsModel['name'] = name;
    _BlogsModel['title'] = title;
    _BlogsModel['content'] = content;
    _BlogsModel['createdDate'] = createdDate;
    _BlogsModel['blogImage'] = blogImage;
    _BlogsModel['doctorImage'] = doctorImage;
    return _BlogsModel;
  }
}
