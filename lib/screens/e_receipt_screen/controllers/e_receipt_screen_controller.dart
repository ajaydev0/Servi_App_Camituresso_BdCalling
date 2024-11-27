import 'dart:developer';

import 'package:get/get.dart';
import 'package:servi_app_camituresso/screens/user_history_screen/models/booking_request_data_model.dart';

class EReceiptScreenController extends GetxController {
  UserHistoryDataModel? item;

  onDataSetUp() {
    try {
      final argData = Get.arguments;
      if (argData.runtimeType != Null) {
        item = argData;
      }
    } catch (e) {
      log("error form e-receipt screen : $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    onDataSetUp();
  }
}
