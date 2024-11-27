import 'package:servi_app_camituresso/const/assets_dev_images.dart';
import 'package:servi_app_camituresso/screens/user_history_screen/controllers/user_history_enum.dart';
import 'package:servi_app_camituresso/screens/user_history_screen/models/booking_request_data_model.dart';

List<UserHistoryDataModel> devUserHistoryData = [
  UserHistoryDataModel(
      title: "Full House Cleaner",
      image: AssetsDevImages.mage1,
      userName: "Shanto Hasan",
      userImage: AssetsDevImages.devUser2,
      amount: "150",
      status: UserHistoryEnum.request,
      userCategory: "Plumber",),
  UserHistoryDataModel(
      title: "Full House Cleaner",
      image: AssetsDevImages.mage2,
      userName: "Shanto Hasan",
      userImage: AssetsDevImages.devUser2,
      amount: "150",
      status: UserHistoryEnum.pending,
      userCategory: "Plumber",),
  UserHistoryDataModel(
      title: "Full House Cleaner",
      image: AssetsDevImages.mage3,
      userName: "Shanto Hasan",
      userImage: AssetsDevImages.devUser2,
      amount: "150",
      status: UserHistoryEnum.complete,
      userCategory: "Plumber",),
  UserHistoryDataModel(
    title: "Full House Cleaner",
    image: AssetsDevImages.mage5,
    userName: "Shanto Hasan",
    userImage: AssetsDevImages.devUser2,
    amount: "150",
    status: UserHistoryEnum.reject,
    userCategory: "Plumber",
  ),
];
