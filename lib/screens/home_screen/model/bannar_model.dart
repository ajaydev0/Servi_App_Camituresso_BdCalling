class BannarModel {
  String? sId;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;
  dynamic iV;

  BannarModel(
      {this.sId,
      this.name,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.iV});

  BannarModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
