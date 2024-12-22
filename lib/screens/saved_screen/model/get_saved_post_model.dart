class BookmarkModel {
  String? sId;
  Service? service;

  BookmarkModel({this.sId, this.service});

  BookmarkModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    service =
        json['service'] != null ? new Service.fromJson(json['service']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    return data;
  }
}

class Service {
  String? sId;
  String? image;
  String? category;
  String? location;
  dynamic rating;
  dynamic totalRating;

  Service(
      {this.sId,
      this.image,
      this.category,
      this.location,
      this.rating,
      this.totalRating});

  Service.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    category = json['category'];
    location = json['location'];
    rating = json['rating'];
    totalRating = json['totalRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['image'] = this.image;
    data['category'] = this.category;
    data['location'] = this.location;
    data['rating'] = this.rating;
    data['totalRating'] = this.totalRating;
    return data;
  }
}
