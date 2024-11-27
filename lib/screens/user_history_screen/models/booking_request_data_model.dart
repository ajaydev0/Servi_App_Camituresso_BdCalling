import 'package:servi_app_camituresso/screens/user_history_screen/controllers/user_history_enum.dart';

class UserHistoryDataModel {
  final String title;
  final String image;
  final String userName;
  final String userCategory;
  final String userImage;
  final String amount;
  final UserHistoryEnum status;
  UserHistoryDataModel({
    required this.title,
    required this.image,
    required this.userName,
    required this.userCategory,
    required this.userImage,
    required this.amount,
    required this.status,
  });
}
