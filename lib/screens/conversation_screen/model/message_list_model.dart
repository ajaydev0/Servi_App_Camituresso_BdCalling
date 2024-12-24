class MessageListModel {
  String? sId;
  String? chatId;
  Sender? sender;
  String? text;
  String? messageType;
  String? createdAt;
  String? updatedAt;
  int? iV;

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
    sender =
        json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    text = json['text'];
    messageType = json['messageType'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['chatId'] = this.chatId;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    data['text'] = this.text;
    data['messageType'] = this.messageType;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Sender {
  String? sId;
  String? name;
  String? profile;

  Sender({this.sId, this.name, this.profile});

  Sender.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['profile'] = this.profile;
    return data;
  }
}
