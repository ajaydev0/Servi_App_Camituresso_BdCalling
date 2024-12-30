import 'package:servi_app_camituresso/screens/user_history_screen/models/booking_request_data_model.dart';

class EReceiptModel {
  final String id;
  final User user;
  final Service service;
  final String status;
  final String offerId;
  final DateTime createdAt;

  EReceiptModel({
    required this.id,
    required this.user,
    required this.service,
    required this.status,
    required this.offerId,
    required this.createdAt,
  });

  factory EReceiptModel.fromJson(Map<String, dynamic> json) {
    return EReceiptModel(
      id: json['_id'],
      user: User.fromJson(json['user']),
      service: Service.fromJson(json['service']),
      status: json['status'],
      offerId: json['offerId'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class User {
  final String id;
  final String name;
  final String location;
  final String profile;

  User({
    required this.id,
    required this.name,
    required this.location,
    required this.profile,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      location: json['location'],
      profile: json['profile'],
    );
  }
}

class Service {
  final String id;
  final String image;
  final String title;
  final int price;
  final String priceBreakdown;

  Service({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.priceBreakdown,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['_id'],
      image: json['image'],
      title: json['title'],
      price: json['price'],
      priceBreakdown: json['price_breakdown'],
    );
  }
}
