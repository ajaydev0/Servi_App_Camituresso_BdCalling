class ServiceByServiceModel {
  String? sId;
  String? image;
  String? title;
  String? location;
  bool? adult;
  dynamic rating;
  bool? bookmark;

  ServiceByServiceModel(
      {this.sId,
      this.image,
      this.title,
      this.location,
      this.adult,
      this.rating,
      this.bookmark});

  ServiceByServiceModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    title = json['title'];
    location = json['location'];
    adult = json['adult'];
    rating = json['rating'];
    bookmark = json['bookmark'];
  }
}
