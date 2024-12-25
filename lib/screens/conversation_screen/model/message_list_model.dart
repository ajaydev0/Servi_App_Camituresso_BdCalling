class MessageListModel {
  String? sId;
  String? chatId;
  dynamic sender;
  String? text;
  String? messageType;
  String? createdAt;
  String? updatedAt;
  dynamic iV;

  MessageListModel(
      {this.sId,
      this.chatId,
      this.sender,
      this.text,
      this.messageType,
      this.createdAt,
      this.updatedAt,
      this.iV});

  MessageListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    chatId = json['chatId'];
    sender = json['sender'];
    text = json['text'];
    messageType = json['messageType'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
