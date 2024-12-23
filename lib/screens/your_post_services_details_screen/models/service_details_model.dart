class ServiceDetailsModel {
  String? sId;
  User? user;
  String? image;
  String? title;
  dynamic price;
  String? priceBreakdown;
  String? description;
  String? category;
  String? location;
  dynamic rating;
  dynamic totalRating;
  List<Reviews>? reviews;

  ServiceDetailsModel(
      {this.sId,
      this.user,
      this.image,
      this.title,
      this.price,
      this.priceBreakdown,
      this.description,
      this.category,
      this.location,
      this.rating,
      this.totalRating,
      this.reviews});

  ServiceDetailsModel.fromJson(dynamic json) {
    sId = json['_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    image = json['image'];
    title = json['title'];
    price = json['price'];
    priceBreakdown = json['price_breakdown'];
    description = json['description'];
    category = json['category'];
    location = json['location'];
    rating = json['rating'];
    totalRating = json['totalRating'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
  }
}

class User {
  String? sId;
  String? name;
  String? profile;

  User({this.sId, this.name, this.profile});

  User.fromJson(dynamic json) {
    sId = json['_id'];
    name = json['name'];
    profile = json['profile'];
  }
}

class Reviews {
  String? sId;
  User? user;
  String? comment;
  dynamic rating;

  Reviews({this.sId, this.user, this.comment, this.rating});

  Reviews.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    comment = json['comment'];
    rating = json['rating'];
  }
}
