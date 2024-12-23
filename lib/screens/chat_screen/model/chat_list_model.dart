class ChatListModel {
  String? sId;
  List<Participants>? participants;
  LastMessage? lastMessage;

  ChatListModel({this.sId, this.participants, this.lastMessage});

  ChatListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['participants'] != null) {
      participants = <Participants>[];
      json['participants'].forEach((v) {
        participants!.add(new Participants.fromJson(v));
      });
    }
    lastMessage = json['lastMessage'] != null
        ? new LastMessage.fromJson(json['lastMessage'])
        : null;
  }
}

class Participants {
  String? sId;
  String? name;
  String? profile;

  Participants({this.sId, this.name, this.profile});

  Participants.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    profile = json['profile'];
  }
}

class LastMessage {
  String? sId;
  String? sender;
  String? text;
  String? createdAt;

  LastMessage({this.sId, this.sender, this.text, this.createdAt});

  LastMessage.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sender = json['sender'];
    text = json['text'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['sender'] = this.sender;
    data['text'] = this.text;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
