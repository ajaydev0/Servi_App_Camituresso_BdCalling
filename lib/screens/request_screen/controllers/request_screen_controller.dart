import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/screens/request_screen/models/booking_request_data_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class RequestScreenController extends GetxController {
  rejectBookClick(String? sID) async {
    try {
      // isLoadingReject.value = true;
      await Repository()
          .getBookingRequestChangeStatus(id: sID, status: "Rejected");

      Navigator.pop(Get.context!);
      // getBookingList();
      update();
    } catch (e) {
      print(e);
    } finally {
      // isLoadingReject.value = false;
    }
  }

  confirmBookClick(String? sID) async {
    try {
      // isLoadingConfirm.value = true;
      var data = await Repository()
          .getBookingRequestChangeStatus(id: sID, status: "Accepted");

      Navigator.pop(Get.context!);
      await getBookingList();
      update();
    } catch (e) {
      print(e);
    } finally {
      // isLoadingConfirm.value = false;
    }
  }

  // getBookingList() async {
  //   try {
  //     isLoadingPopular.value = true;
  //     var data = await Repository().getBookingRequestListData();
  //     if (data.runtimeType != Null) {
  //       bookingList = data;
  //       update();
  //     }
  //   } catch (e) {
  //     print(e);
  //   } finally {
  //     isLoadingPopular.value = false;
  //   }
  // }

  RxBool isLoading = false.obs;
  RxBool isError = RxBool(false);
  RxBool isLoadingMore = false.obs;
  RxBool hasMore = true.obs;
  RxList<BookingRequestListModel> bookingList = <BookingRequestListModel>[].obs;

  int currentPage = 1;
  final int limit = 1000000000000000000;

  // Fetch the first page or refresh data
  Future<void> getBookingList({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
      hasMore.value = true;
      bookingList.clear();
    }

    if (isLoading.value || isLoadingMore.value || !hasMore.value) return;

    try {
      isLoading.value = isRefresh;
      isLoadingMore.value = !isRefresh;

      var data = await Repository().getBookingRequestListData(
        page: currentPage,
        limit: limit,
      );

      if (data.isNotEmpty) {
        bookingList.addAll(data);
        currentPage++;
        if (data.length < limit) {
          hasMore.value = false; // No more data to fetch
        }
      } else {
        hasMore.value = false; // No more data to fetch
      }
    } catch (e) {
      isError.value = true;
      print("Error in getRecommendedPostAndInList: $e");
    } finally {
      isLoading.value = false;
      isLoadingMore.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getBookingList();
  }
}
