import '../controllers/user_history_enum.dart';

class UserHistoryDataModel {
  final String title;
  final String image;
  final String userName;
  final String userCategory;
  final String userImage;
  final String amount;
  final UserHistoryEnum status;

  UserHistoryDataModel({
    required this.title,
    required this.image,
    required this.userName,
    required this.userCategory,
    required this.userImage,
    required this.amount,
    required this.status,
  });

  factory UserHistoryDataModel.fromJson(Map<String, dynamic> json) {
    return UserHistoryDataModel(
      title: json['service']?['title'] ?? '',
      image: json['service']?['image'] ?? '',
      userName: json['provider']?['name'] ?? '',
      userCategory: json['service']?['category'] ?? '',
      userImage: '', // Assuming userImage is not provided in the JSON
      amount: json['service']?['price']?.toString() ?? '0',
      status: UserHistoryEnum.values.firstWhere(
        (e) => e.toString() == 'UserHistoryEnum.${json['status']}',
        orElse: () => UserHistoryEnum.pending, // Default value
      ),
    );
  }
}

class UserHistoryListModel {
  String? sId;
  Provider? provider;
  Service? service;
  String? status;

  UserHistoryListModel({this.sId, this.provider, this.service, this.status});

  UserHistoryListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    provider = json['provider'] != null
        ? new Provider.fromJson(json['provider'])
        : null;
    service =
        json['service'] != null ? new Service.fromJson(json['service']) : null;
    status = json['status'];
  }
}

class Provider {
  String? sId;
  String? name;

  Provider({this.sId, this.name});

  Provider.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }
}

class Service {
  String? sId;
  String? image;
  String? title;
  int? price;
  String? category;

  Service({this.sId, this.image, this.title, this.price, this.category});

  Service.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    title = json['title'];
    price = json['price'];
    category = json['category'];
  }
}
