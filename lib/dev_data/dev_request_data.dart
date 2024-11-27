import 'package:servi_app_camituresso/const/assets_dev_images.dart';
import 'package:servi_app_camituresso/screens/request_screen/controllers/booking_request_enum.dart';
import 'package:servi_app_camituresso/screens/request_screen/models/booking_request_data_model.dart';

List<BookingRequestDataModel> devRequestData = [
  BookingRequestDataModel(
    title: "Full House Cleaner",
    image: AssetsDevImages.mage1,
    userName: "Shanto Hasan",
    userImage: AssetsDevImages.devUser2,
    amount: "150",
    status: BookingRequestEnum.request,
  ),
  BookingRequestDataModel(
    title: "Full House Cleaner",
    image: AssetsDevImages.mage3,
    userName: "Shanto Hasan",
    userImage: AssetsDevImages.devUser2,
    amount: "150",
    status: BookingRequestEnum.complete,
  ),
  BookingRequestDataModel(
    title: "Full House Cleaner",
    image: AssetsDevImages.mage5,
    userName: "Shanto Hasan",
    userImage: AssetsDevImages.devUser2,
    amount: "150",
    status: BookingRequestEnum.reject,
  ),
];
