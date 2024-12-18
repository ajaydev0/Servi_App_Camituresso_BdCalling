class GetPostModel {
  String? sId;
  String? image;
  String? title;
  int? price;
  String? description;
  String? category;

  GetPostModel(
      {this.sId,
      this.image,
      this.title,
      this.price,
      this.description,
      this.category});

  GetPostModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['image'] = this.image;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    return data;
  }
}
