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
  bool? adult;
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
      this.adult,
      this.rating,
      this.totalRating,
      this.reviews});

  ServiceDetailsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    image = json['image'];
    title = json['title'];
    price = json['price'];
    priceBreakdown = json['price_breakdown'];
    description = json['description'];
    category = json['category'];
    location = json['location'];
    adult = json['adult'];
    rating = json['rating'];
    totalRating = json['totalRating'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['image'] = this.image;
    data['title'] = this.title;
    data['price'] = this.price;
    data['price_breakdown'] = this.priceBreakdown;
    data['description'] = this.description;
    data['category'] = this.category;
    data['location'] = this.location;
    data['adult'] = this.adult;
    data['rating'] = this.rating;
    data['totalRating'] = this.totalRating;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['profile'] = this.profile;
    return data;
  }
}

class Reviews {
  String? sId;
  User? user;
  String? comment;
  dynamic? rating;
  String? createdAt;

  Reviews({this.sId, this.user, this.comment, this.rating, this.createdAt});

  Reviews.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    comment = json['comment'];
    rating = json['rating'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['comment'] = this.comment;
    data['rating'] = this.rating;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
