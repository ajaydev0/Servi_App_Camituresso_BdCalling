class CreateChatModel {
  String? sId;
  List<String>? participants;
  String? createdAt;
  String? updatedAt;
  dynamic iV;

  CreateChatModel(
      {this.sId, this.participants, this.createdAt, this.updatedAt, this.iV});

  CreateChatModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    participants = json['participants'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
