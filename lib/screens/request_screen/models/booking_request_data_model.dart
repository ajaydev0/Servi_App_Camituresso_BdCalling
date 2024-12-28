import 'package:servi_app_camituresso/screens/request_screen/controllers/booking_request_enum.dart';

class BookingRequestDataModel {
  final String title;
  final String image;
  final String userName;
  final String userImage;
  final String amount;
  final BookingRequestEnum status;
  BookingRequestDataModel({
    required this.title,
    required this.image,
    required this.userName,
    required this.userImage,
    required this.amount,
    required this.status,
  });
}

class BookingRequestListModel {
  String? sId;
  User? user;
  Service? service;
  String? status;

  BookingRequestListModel({this.sId, this.user, this.service, this.status});

  BookingRequestListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    service =
        json['service'] != null ? new Service.fromJson(json['service']) : null;
    status = json['status'];
  }
}

class User {
  String? sId;
  String? name;
  String? profile;

  User({this.sId, this.name, this.profile});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    profile = json['profile'];
  }
}

class Service {
  String? sId;
  String? image;
  String? title;
  dynamic price;

  Service({this.sId, this.image, this.title, this.price});

  Service.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    title = json['title'];
    price = json['price'];
  }
}
