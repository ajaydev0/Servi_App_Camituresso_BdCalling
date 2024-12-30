class NotificationScreenModel {
  bool? success;
  String? message;
  Data? data;

  NotificationScreenModel({this.success, this.message, this.data});

  NotificationScreenModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Notifications>? notifications;
  int? unreadCount;
  Meta? meta;

  Data({this.notifications, this.unreadCount, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['notifications'] != null) {
      notifications = <Notifications>[];
      json['notifications'].forEach((v) {
        notifications!.add(Notifications.fromJson(v));
      });
    }
    unreadCount = json['unreadCount'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (notifications != null) {
      data['notifications'] = notifications!.map((v) => v.toJson()).toList();
    }
    data['unreadCount'] = unreadCount;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Notifications {
  String? sId;
  String? text;
  String? receiver;
  Sender? sender;
  String? referenceId;
  String? screen;
  bool? read;
  String? createdAt;

  Notifications(
      {this.sId,
      this.text,
      this.receiver,
      this.sender,
      this.referenceId,
      this.screen,
      this.read,
      this.createdAt});

  Notifications.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    text = json['text'];
    receiver = json['receiver'];
    sender = json['sender'] != null ? Sender.fromJson(json['sender']) : null;
    referenceId = json['referenceId'];
    screen = json['screen'];
    read = json['read'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['text'] = text;
    data['receiver'] = receiver;
    if (sender != null) {
      data['sender'] = sender!.toJson();
    }
    data['referenceId'] = referenceId;
    data['screen'] = screen;
    data['read'] = read;
    data['createdAt'] = createdAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['profile'] = profile;
    return data;
  }
}

class Meta {
  int? page;
  int? total;

  Meta({this.page, this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['total'] = total;
    return data;
  }
}
