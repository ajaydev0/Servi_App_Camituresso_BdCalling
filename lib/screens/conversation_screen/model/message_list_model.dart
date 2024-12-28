class MessageListModel {
  String? chatId;
  String? sender;
  String? text;
  String? image;
  String? messageType;
  String? sId;
  String? createdAt;
  String? updatedAt;
  dynamic iV;

  MessageListModel(
      {this.chatId,
      this.sender,
      this.text,
      this.image,
      this.messageType,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  MessageListModel.fromJson(Map<String, dynamic> json) {
    chatId = json['chatId'];
    sender = json['sender'];
    text = json['text'];
    image = json['image'];
    messageType = json['messageType'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
