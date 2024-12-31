class PaymentCreateModel {
  bool? success;
  String? message;
  String? data;

  PaymentCreateModel({this.success, this.message, this.data});

  PaymentCreateModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'];
  }
}
