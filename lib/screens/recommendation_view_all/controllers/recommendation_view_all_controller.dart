import 'package:get/get.dart';
import 'package:servi_app_camituresso/models/dev_category/dev_category_model.dart';
import 'package:servi_app_camituresso/models/dev_services_model/dev_services_model.dart';
import 'package:servi_app_camituresso/screens/recommendation_view_all/model/get_recommended_post_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class RecommendationViewAllController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isError = RxBool(false);
  RxList<DevServicesModel> listOfServices = RxList([]);
  DevCategoryModel? model;
  List<RecommendedPostModel> postList = <RecommendedPostModel>[].obs;

  changeSavedMode(int index) {
    listOfServices[index].isSaved = !listOfServices[index].isSaved;
    listOfServices.refresh();
    update();
  }

  // onDataSetFunction() {
  //   try {
  //     isError.value = false;
  //     isLoading.value = true;
  //     final argData = Get.arguments;
  //     if (argData.runtimeType != Null) {
  //       model = argData;
  //       listOfServices.clear();
  //       for (var element in devListOfServicedData) {
  //         if (element.category == model?.id) {
  //           listOfServices.add(element);
  //         }
  //       }
  //     } else {
  //       listOfServices.addAll(devListOfServicedData);
  //     }
  //     listOfServices.refresh();
  //     isLoading.value = false;
  //     update();
  //   } catch (e) {
  //     isError.value = true;
  //     isLoading.value = false;
  //   }
  // }

  getRecommendedPostAndInList() async {
    try {
      isLoading.value = true;
      var data = await Repository().getRecommendationrPostData();
      if (data != null) {
        postList = data;
        print(data);
        update();
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await getRecommendedPostAndInList();

    // onDataSetFunction();
  }
}
