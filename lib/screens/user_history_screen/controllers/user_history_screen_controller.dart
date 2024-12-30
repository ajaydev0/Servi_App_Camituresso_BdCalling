import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:servi_app_camituresso/screens/user_history_screen/models/booking_request_data_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';
import '../../../const/app_api_url.dart';
import '../../../services/api/services/api_get_services.dart';
import '../../../services/app_storage/app_auth_storage.dart';

class UserHistoryScreenController extends GetxController {
  RxBool isLoading = RxBool(true);
  RxBool isError = RxBool(false);
  RxBool isLoadingMore = RxBool(false);
  List<UserHistoryListModel> listOfUserHistory = <UserHistoryListModel>[];



  // Search functionality
  final searchController = TextEditingController();
  RxString searchQuery = RxString('');

  // Pagination variables
  int currentPage = 1;
  static const int itemsPerPage = 10;
  RxBool hasMoreData = RxBool(true);

  // Computed property for filtered list
  List<UserHistoryListModel> get filteredList {
    if (searchQuery.value.isEmpty) {
      return listOfUserHistory;
    }
    return listOfUserHistory.where((item) {
      final title = item.service?.title?.toLowerCase() ?? '';
      return title.contains(searchQuery.value.toLowerCase());
    }).toList();
  }

  Future<void> initializedDataLoad() async {
    try {
      isLoading.value = true;
      currentPage = 1;
      listOfUserHistory.clear();

      var data = await getUserHistoryPaginated(currentPage);
      if (data.isNotEmpty) {
        listOfUserHistory = data;
        hasMoreData.value = data.length >= itemsPerPage;
      }
      isLoading.value = false;
    } catch (e) {
      log("error from request data load function : $e");
      isError.value = true;
      isLoading.value = false;
    }
    update();
  }

  Future<void> loadMoreData() async {
    if (!hasMoreData.value || isLoadingMore.value || searchQuery.value.isNotEmpty) return;

    try {
      isLoadingMore.value = true;
      currentPage++;

      var data = await getUserHistoryPaginated(currentPage);
      if (data.isNotEmpty) {
        listOfUserHistory.addAll(data);
        hasMoreData.value = data.length >= itemsPerPage;
      } else {
        hasMoreData.value = false;
      }
    } catch (e) {
      log("error loading more data: $e");
      currentPage--;
    } finally {
      isLoadingMore.value = false;
      update();
    }
  }

  void onSearchChanged(String value) {
    searchQuery.value = value;
    update();
  }

  Future<List<UserHistoryListModel>> getUserHistoryPaginated(int page) async {
    List<UserHistoryListModel> data = [];
    try {
      var response = await ApiGetServices().apiGetServices(
        "${AppApiUrl.userHistory}?page=$page&per_page=$itemsPerPage",
        token: AppAuthStorage().getToken(),
      );

      if (response != null &&
          response["data"] != null &&
          response["data"]["offers"] != null) {
        for (var item in response["data"]["offers"]) {
          data.add(UserHistoryListModel.fromJson(item));
        }
      }
    } catch (e) {
      log("Error in getUserHistoryPaginated: $e");
    }
    return data;
  }

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() {
      onSearchChanged(searchController.text);
    });
    initializedDataLoad();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void clearSearch() {
    searchController.clear();
    searchQuery.value = '';
    update();
  }
}