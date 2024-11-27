import 'dart:developer';

import 'package:get/get.dart';
import 'package:servi_app_camituresso/models/dev_services_model/dev_services_model.dart';

class EighteenPlusWarningScreenController extends GetxController {
  DevServicesModel? servicesModel;

  onDataSetUp() {
    try {
      final argData = Get.arguments;
      if (argData.runtimeType != Null) {
        servicesModel = argData;
      }
    } catch (e) {
      log("error form 18+ warning data on setup : $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    onDataSetUp();
  }
}
