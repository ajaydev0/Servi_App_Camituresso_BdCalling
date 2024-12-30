import 'dart:developer';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';

import '../../../services/api/services/api_get_services.dart';
import '../../../services/app_storage/app_auth_storage.dart';
import '../models/e_receipt_model.dart';

class EReceiptDetailController extends GetxController {
  RxBool isLoading = RxBool(true);
  RxBool isError = RxBool(false);
  late EReceiptModel detail;

  String getFormattedDate(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  String getFormattedTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  @override
  void onInit() {
    super.onInit();
    final String id = Get.parameters['id']!;
    fetchDetail(id);
  }

  Future<void> fetchDetail(String id) async {
    try {
      isLoading.value = true;
      var response = await ApiGetServices().apiGetServices(
        "${AppApiUrl.userHistoryEReceipt}/$id",
        token: AppAuthStorage().getToken(),
      );

      if (response != null && response["data"] != null) {
        detail = EReceiptModel.fromJson(response["data"]);
        isLoading.value = false;
      } else {
        isError.value = true;
        isLoading.value = false;
      }
    } catch (e) {
      log("Error fetching detail: $e");
      isError.value = true;
      isLoading.value = false;
    }
  }
}