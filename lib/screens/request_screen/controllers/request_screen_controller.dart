import 'package:get/get.dart';
import 'package:servi_app_camituresso/screens/request_screen/models/booking_request_data_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class RequestScreenController extends GetxController {
  rejectBookClick(BookingRequestListModel item, RxBool isPending,
      RxBool isLoadingReject) async {
    try {
      isLoadingReject.value = true;
      var data = await Repository()
          .getBookingRequestChangeStatus(id: item.sId, status: "Rejected");

      if (data != null) {
        item.status = "Rejected";
        isPending.value = false;
      }
    } catch (e) {
      print("Error On Reject Method $e");
    } finally {
      isLoadingReject.value = false;
    }
  }

  confirmBookClick(BookingRequestListModel item, RxBool isPending,
      RxBool isLoadingConfirm) async {
    try {
      isLoadingConfirm.value = true;

      var data = await Repository()
          .getBookingRequestChangeStatus(id: item.sId, status: "Accepted");

      if (data != null) {
        item.status = "Accepted";
        isPending.value = false;
      }
    } catch (e) {
      print("Error On Reject Method $e");
    } finally {
      isLoadingConfirm.value = false;
    }
  }

  // confirmBookClick(BookingRequestListModel item, RxBool isPending,
  //     RxBool isLoadingReject) async {
  //   try {
  //     // isLoadingConfirm.value = true;
  //     var data = await Repository()
  //         .getBookingRequestChangeStatus(id: sID, status: "Accepted");

  //     Navigator.pop(Get.context!);
  //     await getBookingList();
  //     update();
  //   } catch (e) {
  //     print(e);
  //   } finally {
  //     // isLoadingConfirm.value = false;
  //   }
  // }

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
  final int limit = 5;

  // Fetch the first page or refresh data
  Future<void> getBookingList({bool isRefresh = false}) async {
    try {
      isLoading.value = true;
      var data = await Repository().getBookingRequestListData(
        page: currentPage,
        limit: limit,
      );

      if (data.isNotEmpty) {
        bookingList.value = data;
        currentPage++;
        if (data.length < limit) {
          hasMore.value = false; // No more data to fetch
        }
      }
    } catch (e) {
      print("Error in get Request List: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    getBookingList();
    super.onInit();
  }
}
