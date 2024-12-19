class BookmarkModel {
  String? sId;
  Service? service;

  BookmarkModel({this.sId, this.service});

  BookmarkModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    service =
        json['service'] != null ? new Service.fromJson(json['service']) : null;
  }
}

class Service {
  String? sId;
  String? image;
  String? location;
  int? rating;
  int? totalRating;

  Service({this.sId, this.image, this.location, this.rating, this.totalRating});

  Service.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    location = json['location'];
    rating = json['rating'];
    totalRating = json['totalRating'];
  }
}
