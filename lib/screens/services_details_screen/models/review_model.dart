class GetReviewListModel {
  String? sId;
  User? user;
  String? comment;
  int? rating;

  GetReviewListModel({this.sId, this.user, this.comment, this.rating});

  GetReviewListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    comment = json['comment'];
    rating = json['rating'];
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
}
