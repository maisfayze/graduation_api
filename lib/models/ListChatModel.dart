class ListChatModel {
  ListChatModel({
    required this.user,
    required this.createdDate,
    required this.lastMessage,
  });
  late final User user;
  late final String createdDate;
  late final String lastMessage;

  ListChatModel.fromJson(Map<String, dynamic> json) {
    user = User.fromJson(json['user']);
    createdDate = json['createdDate'];
    lastMessage = json['lastMessage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    _data['createdDate'] = createdDate;
    _data['lastMessage'] = lastMessage;
    return _data;
  }
}

class User {
  User({
    required this.image,
    required this.name,
    required this.id,
  });
  late final String image;
  late final String name;
  late final String id;

  User.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image'] = image;
    _data['name'] = name;
    _data['id'] = id;
    return _data;
  }
}
