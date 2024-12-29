class MessageListModel {
  Offer? offer;
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
      {this.offer,
      this.chatId,
      this.sender,
      this.text,
      this.image,
      this.messageType,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  MessageListModel.fromJson(Map<String, dynamic> json) {
    offer = json['offer'] != null ? new Offer.fromJson(json['offer']) : null;
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

class Offer {
  String? price;
  String? description;
  String? offerId;
  String? status;

  Offer({this.price, this.description, this.offerId, this.status});

  Offer.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    description = json['description'];
    offerId = json['offerId'];
    status = json['status'];
  }
}

class ChatUserServiceListModel {
  String? sId;
  String? title;

  ChatUserServiceListModel({this.sId, this.title});

  ChatUserServiceListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
  }
}

////////////////////// Offer Change Status 

