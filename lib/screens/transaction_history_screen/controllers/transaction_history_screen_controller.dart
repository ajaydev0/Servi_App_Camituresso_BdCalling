import 'dart:developer';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/screens/transaction_history_screen/models/transaction_history_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class TransactionHistoryScreenController extends GetxController {
  bool isLoading = false;
  TransactionHistoryModel transactionHistoryModel = TransactionHistoryModel();

  initializeData() async {
    try {
      isLoading = true;
      update();
      var response = await Repository().getTransactionHistoryData();

      // check response
      log(response.success.toString());
      log(response.data.toString());

      // initialize the model class
      transactionHistoryModel = response;
      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      log('error form initializeData method: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }
}
