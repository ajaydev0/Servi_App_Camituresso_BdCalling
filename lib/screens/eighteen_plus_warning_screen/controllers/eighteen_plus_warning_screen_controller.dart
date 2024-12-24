import 'dart:developer';
import 'package:get/get.dart';

class EighteenPlusWarningScreenController extends GetxController {
  // DevServicesModel? servicesModel;
  dynamic item;
  onDataSetUp() {
    try {
      final argData = Get.arguments;
      if (argData.runtimeType != Null) {
        item = argData;
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
