import 'dart:developer';

import 'package:get/get.dart';
import 'package:servi_app_camituresso/dev_data/dev_request_data.dart';
import 'package:servi_app_camituresso/screens/request_screen/models/booking_request_data_model.dart';

class RequestScreenController extends GetxController {
  RxBool isLoading = RxBool(true);
  RxBool isError = RxBool(false);
  RxList<BookingRequestDataModel> listOfRequest = RxList([]);

  initializedDataLoad() {
    try {
      isLoading.value = true;
      listOfRequest.addAll(devRequestData);
      listOfRequest.refresh();
      isLoading.value = false;
    } catch (e) {
      log("error form request data load function : $e");
      isError.value = true;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    initializedDataLoad();
  }
}
