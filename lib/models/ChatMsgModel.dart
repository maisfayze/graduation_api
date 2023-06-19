class ChatMsgModel {
  ChatMsgModel({
    required this.senderUserId,
    required this.receiverUserId,
    required this.senderName,
    required this.receiverName,
    required this.message,
    required this.sentAt,
  });
  late final String senderUserId;
  late final String receiverUserId;
  late final String senderName;
  late final String receiverName;
  late final String message;
  late final String sentAt;

  ChatMsgModel.fromJson(Map<String, dynamic> json) {
    senderUserId = json['senderUserId'];
    receiverUserId = json['receiverUserId'];
    senderName = json['senderName'];
    receiverName = json['receiverName'];
    message = json['message'];
    sentAt = json['sentAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['senderUserId'] = senderUserId;
    _data['receiverUserId'] = receiverUserId;
    _data['senderName'] = senderName;
    _data['receiverName'] = receiverName;
    _data['message'] = message;
    _data['sentAt'] = sentAt;
    return _data;
  }
}
