import 'package:get/get.dart';
import 'package:servi_app_camituresso/screens/recommendation_view_all/model/get_recommended_post_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class RecommendationViewAllController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isError = RxBool(false);
  RxBool isLoadingMore = false.obs;
  RxBool hasMore = true.obs;

  RxList<RecommendedPostModel> postList = <RecommendedPostModel>[].obs;
  int currentPage = 1;
  final int limit = 20;

  // Fetch the first page or refresh data
  Future<void> getRecommendedPostAndInList({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
      hasMore.value = true;
      postList.clear();
    }

    if (isLoading.value || isLoadingMore.value || !hasMore.value) return;

    try {
      isLoading.value = isRefresh;
      isLoadingMore.value = !isRefresh;

      var data = await Repository().getRecommendationrPostData(
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
      print("Error in getRecommendedPostAndInList: $e");
    } finally {
      isLoading.value = false;
      isLoadingMore.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getRecommendedPostAndInList();
  }
}
