class SearchPagePostModel {
  String? sId;
  String? image;
  String? title;
  dynamic price;
  String? description;
  String? category;
  bool? adult;
  bool? bookmark;

  SearchPagePostModel(
      {this.sId,
      this.image,
      this.title,
      this.price,
      this.description,
      this.category,
      this.adult,
      this.bookmark});

  SearchPagePostModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    adult = json['adult'];
    bookmark = json['bookmark'];
  }
}
