import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/screens/clients_details_screen/model/booking_request_details_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class ClientsDetailsScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxString aboutUsData = "".obs;
  BookingRequestDetailsModel itemDetails = BookingRequestDetailsModel();
  getServiceDetailsData() async {
    try {
      isLoading.value = true;
      if (Get.arguments.runtimeType != Null) {
        var repoResponse =
            await Repository().getBookingRequestDetailsData(Get.arguments);
        if (repoResponse != null) {
          itemDetails = repoResponse;
        }
      } else {
        print("Something Else");
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void copyToClipboard(BuildContext context, text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied to Clipboard!'),
        duration: Duration(milliseconds: 500),
      ),
    );
  }

  @override
  void onInit() {
    getServiceDetailsData();
    // getAboutUsData();
    super.onInit();
  }
}
