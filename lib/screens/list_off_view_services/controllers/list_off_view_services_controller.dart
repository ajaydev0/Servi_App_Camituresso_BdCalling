import 'package:get/get.dart';
import 'package:servi_app_camituresso/dev_data/dev_list_of_services_data.dart';
import 'package:servi_app_camituresso/models/dev_category/dev_category_model.dart';
import 'package:servi_app_camituresso/models/dev_services_model/dev_services_model.dart';
import 'package:servi_app_camituresso/screens/list_off_view_services/model/get_post_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class ListOffViewServicesController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isError = RxBool(false);
  RxBool isLoadingMore = false.obs;
  RxBool hasMore = true.obs;

  RxList<GetPostModel> postList = <GetPostModel>[].obs;
  int currentPage = 1;
  final int limit = 20;

  // Fetch the first page or refresh data
  Future<void> getPostAndInList({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
      hasMore.value = true;
      postList.clear();
    }

    if (isLoading.value || isLoadingMore.value || !hasMore.value) return;

    try {
      if (isRefresh) {
        isLoading.value = true;
      } else {
        isLoadingMore.value = true;
      }

      var data =
          await Repository().getPostData(page: currentPage, limit: limit);

      if (data.isNotEmpty) {
        postList.addAll(data);
        currentPage++;
        if (data.length < limit) {
          hasMore.value = false; // No more data to fetch
        }
      } else {
        hasMore.value = false; // No more data to fetch
      }
    } catch (e) {
      isError.value = true;
      print("Error in getPostAndInList: $e");
    } finally {
      isLoading.value = false;
      isLoadingMore.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPostAndInList();
  }
}
