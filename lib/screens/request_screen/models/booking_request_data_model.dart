import 'package:servi_app_camituresso/screens/request_screen/controllers/booking_request_enum.dart';

class BookingRequestDataModel {
  final String title;
  final String image;
  final String userName;
  final String userImage;
  final String amount;
  final BookingRequestEnum status;
  BookingRequestDataModel({
    required this.title,
    required this.image,
    required this.userName,
    required this.userImage,
    required this.amount,
    required this.status,
  });
}
