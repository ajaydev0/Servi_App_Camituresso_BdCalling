import 'package:get/get.dart';
import 'package:servi_app_camituresso/screens/popular_view_all/model/get_popular_post_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class PopularViewAllController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isError = RxBool(false);
  RxBool isLoadingMore = false.obs;
  RxBool hasMore = true.obs;

  RxList<PopularPostModel> postList = <PopularPostModel>[].obs;
  int currentPage = 1;
  final int limit = 20;

  // Fetch the first page or refresh data
  Future<void> getPopularPostAndInList({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
      hasMore.value = true;
      postList.clear();
    }

    if (isLoading.value || isLoadingMore.value || !hasMore.value) return;

    try {
      isLoading.value = isRefresh;
      isLoadingMore.value = !isRefresh;

      var data = await Repository().getPopularPostData(
        page: currentPage,
        limit: limit,
      );

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
      print("Error in getPopularPostAndInList: $e");
    } finally {
      isLoading.value = false;
      isLoadingMore.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPopularPostAndInList();
  }
}
