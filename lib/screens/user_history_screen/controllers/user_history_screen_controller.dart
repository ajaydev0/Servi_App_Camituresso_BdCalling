import 'dart:developer';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/dev_data/dev_user_history_data.dart';
import 'package:servi_app_camituresso/screens/user_history_screen/models/booking_request_data_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';
import '../../../const/app_api_url.dart';
import '../../../services/api/services/api_get_services.dart';
import '../../../services/app_storage/app_auth_storage.dart';

class UserHistoryScreenController extends GetxController {
  // RxBool isLoading = false.obs;
  // RxBool isError = RxBool(false);
  // RxBool isLoadingMore = false.obs;
  // RxBool hasMore = true.obs;
  //
  // RxList<GetPostModel> postList = <GetPostModel>[].obs;
  // int currentPage = 1;
  // final int limit = 20;
  //
  // // Fetch the first page or refresh data
  // Future<void> getPostAndInList({bool isRefresh = false}) async {
  //   if (isRefresh) {
  //     currentPage = 1;
  //     hasMore.value = true;
  //     postList.clear();
  //   }
  //
  //   if (isLoading.value || isLoadingMore.value || !hasMore.value) return;
  //
  //   try {
  //     if (isRefresh) {
  //       isLoading.value = true;
  //     } else {
  //       isLoadingMore.value = true;
  //     }
  //
  //     var data =
  //     await Repository().getPostData(page: currentPage, limit: limit);
  //
  //     if (data.isNotEmpty) {
  //       postList.addAll(data);
  //       currentPage++;
  //       if (data.length < limit) {
  //         hasMore.value = false; // No more data to fetch
  //       }
  //     } else {
  //       hasMore.value = false; // No more data to fetch
  //     }
  //   } catch (e) {
  //     isError.value = true;
  //     print("Error in getPostAndInList: $e");
  //   } finally {
  //     isLoading.value = false;
  //     isLoadingMore.value = false;
  //   }
  // }
  //
  // @override
  // void onInit() {
  //   super.onInit();
  //   getPostAndInList();
  // }
  ////////////////////
  RxBool isLoading = RxBool(true);
  RxBool isError = RxBool(false);
  List<UserHistoryListModel> listOfUserHistory = <UserHistoryListModel>[];

  Future<void> initializedDataLoad() async {
    try {
      isLoading.value = true;
      var data = await Repository().getUserHistory();
      if (data.runtimeType != Null) {
        listOfUserHistory = data;
      }
      isLoading.value = false;
    } catch (e) {
      log("error from request data load function : $e");
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
