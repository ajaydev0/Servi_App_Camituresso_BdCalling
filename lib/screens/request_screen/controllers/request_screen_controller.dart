import 'dart:developer';

import 'package:get/get.dart';
import 'package:servi_app_camituresso/dev_data/dev_request_data.dart';
import 'package:servi_app_camituresso/screens/request_screen/models/booking_request_data_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class RequestScreenController extends GetxController {
  RxBool isLoading = RxBool(true);
  RxBool isError = RxBool(false);
  RxList<BookingRequestDataModel> listOfRequest = RxList([]);

  ///////////////////////// Popular Post List
  RxBool isLoadingPopular = false.obs;
  List<BookingRequestListModel> bookingList = <BookingRequestListModel>[].obs;
  getBookingList() async {
    try {
      isLoadingPopular.value = true;
      var data = await Repository().getBookingRequestListData();
      if (data.runtimeType != Null) {
        bookingList = data;
        update();
      }
    } catch (e) {
      print(e);
    } finally {
      isLoadingPopular.value = false;
    }
  }

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
    getBookingList();
    initializedDataLoad();
    super.onInit();
  }
}
