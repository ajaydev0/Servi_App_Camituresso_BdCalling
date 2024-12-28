import 'dart:developer';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/dev_data/dev_transaction_data_history.dart';
import 'package:servi_app_camituresso/screens/transaction_history_screen/models/transaction_data_history.dart';
import 'package:servi_app_camituresso/screens/transaction_history_screen/models/transaction_history_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';
import 'package:servi_app_camituresso/widgets/custom_show_date_picker/custom_show_date_picker.dart';
import 'package:servi_app_camituresso/widgets/texts/time_date_format.dart';

class TransactionHistoryScreenController extends GetxController {
  RxBool isLoading = false.obs;
  TransactionHistoryModel transactionHistoryModel = TransactionHistoryModel();

  getTransactionHistoryData()async{
    try{
      isLoading.value= true;
      var response = await Repository().getTransactionHistoryData();

      // check response
      log(response.success);
      log(response.data);

      // initialize the model class
      transactionHistoryModel = response;
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      log(e.toString());
    }
  }




  RxBool isError = RxBool(true);
  RxList<TransactionDataHistory> listOfData = <TransactionDataHistory>[].obs;
  DateTime toDate = DateTime.now();
  RxString toFormateDate = RxString("");
  DateTime formDate = DateTime.now();
  RxString formFormateDate = RxString("");

  List<String> listOfPeriod = ["Today", "This week", "This month", "Previous month", "This year"];
  RxString selectedPeriod = RxString("");
  clickPeriod(String value) {
    try {
      selectedPeriod.value = value;
    } catch (e) {
      log("error form click period button");
    }
  }

  List<String> listOfStatus = ["Confirmed", "Pending", "Canceled"];
  RxString selectedStatus = RxString("");
  clickStatus(String value) {
    try {
      selectedStatus.value = value;
    } catch (e) {
      log("error form click period button");
    }
  }

  clickClearButton() {
    try {
      selectedPeriod.value = "";
      selectedStatus.value = "";

      toDate = DateTime.now();
      formDate = DateTime.now();
      toFormateDate.value = "";
      formFormateDate.value = timeDateFormate(DateTime.now());
    } catch (e) {
      log("error form clear button click : $e");
    }
  }

  toDatePickFunction() async {
    try {
      var pickedData = await customShowDatePicker(context: Get.context!, lastDate: DateTime.now());
      if (pickedData != null) {
        toFormateDate.value = timeDateFormate(pickedData);
        toDate = pickedData;
      }
    } catch (e) {
      log("error form to date function :$e");
    }
  }

  formDatePickFunction() async {
    try {
      var pickedData = await customShowDatePicker(
        context: Get.context!,
        firstDate: toDate,
        lastDate: DateTime.now(),
      );
      if (pickedData != null) {
        formFormateDate.value = timeDateFormate(pickedData);
        formDate = pickedData;
      }
    } catch (e) {
      log("error form date function :$e");
    }
  }

  onInitDataSet() {
    try {
      isLoading.value = true;
      listOfData.addAll(devListOfTransactionDataHistory);
      listOfData.refresh();
      isLoading.value = false;
      formFormateDate.value = timeDateFormate(DateTime.now());
      toFormateDate.value = timeDateFormate(DateTime.now());
    } catch (e) {
      log("Error form transaction on init data load : $e");
      isError.value = true;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    // onInitDataSet();

  }
}
