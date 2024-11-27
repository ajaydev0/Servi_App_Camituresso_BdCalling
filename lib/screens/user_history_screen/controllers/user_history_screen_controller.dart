import 'dart:developer';

import 'package:get/get.dart';
import 'package:servi_app_camituresso/dev_data/dev_user_history_data.dart';
import 'package:servi_app_camituresso/screens/user_history_screen/models/booking_request_data_model.dart';

class UserHistoryScreenController extends GetxController {
  RxBool isLoading = RxBool(true);
  RxBool isError = RxBool(false);
  RxList<UserHistoryDataModel> listOfUserHistory = RxList([]);

  initializedDataLoad() {
    try {
      isLoading.value = true;
      listOfUserHistory.addAll(devUserHistoryData);
      listOfUserHistory.refresh();
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
