import 'package:servi_app_camituresso/models/dev_user/dev_review_user.dart';
import 'package:servi_app_camituresso/models/dev_user/dev_user.dart';

class DevServicesModel {
  final String title;
  final String image;
  final String price;
  bool isSaved;
  final String description;
  final String subDescription;
  final List<String> subDescriptionItem;
  final DevUser user;
  final List<DevReviewUser> review;
  final String category;
  DevServicesModel({
    required this.description,
    required this.image,
    required this.isSaved,
    required this.price,
    required this.review,
    required this.subDescription,
    required this.subDescriptionItem,
    required this.title,
    required this.user,
    required this.category,
  });
}
