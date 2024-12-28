class BookingRequestDetailsModel {
  String? sId;
  User? user;
  Service? service;
  String? status;
  String? offerId;

  BookingRequestDetailsModel(
      {this.sId, this.user, this.service, this.status, this.offerId});

  BookingRequestDetailsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    service =
        json['service'] != null ? new Service.fromJson(json['service']) : null;
    status = json['status'];
    offerId = json['offerId'];
  }
}

class User {
  String? sId;
  String? name;
  String? location;
  String? profile;

  User({this.sId, this.name, this.location, this.profile});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    location = json['location'];
    profile = json['profile'];
  }
}

class Service {
  String? sId;
  String? image;
  String? title;
  dynamic price;
  String? priceBreakdown;

  Service({this.sId, this.image, this.title, this.price, this.priceBreakdown});

  Service.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    title = json['title'];
    price = json['price'];
    priceBreakdown = json['price_breakdown'];
  }
}
