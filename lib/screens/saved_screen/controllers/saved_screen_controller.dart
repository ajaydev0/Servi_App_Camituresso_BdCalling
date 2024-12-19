import 'package:get/get.dart';
import 'package:servi_app_camituresso/models/dev_category/dev_category_model.dart';
import 'package:servi_app_camituresso/models/dev_services_model/dev_services_model.dart';
import 'package:servi_app_camituresso/screens/saved_screen/model/get_popular_post_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class SavedScreenController extends GetxController {
  ////// Bookmark Saved Logic

  RxBool isLoading = false.obs;
  RxBool isError = RxBool(false);
  RxList<DevServicesModel> listOfServices = RxList([]);
  DevCategoryModel? model;
  // List<dynamic> postList = [].obs;

  changeSavedMode(int index) {
    listOfServices[index].isSaved = !listOfServices[index].isSaved;
    listOfServices.refresh();
    update();
  }

  RxList<BookmarkModel> bookmarkList = <BookmarkModel>[].obs;
  getSavedPostList() async {
    try {
      isLoading.value = true;
      var repoResponse = await Repository().getBookmarkListData();

      bookmarkList.value = repoResponse;
      bookmarkList.refresh();
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await getSavedPostList();

    // onDataSetFunction();
  }
}
