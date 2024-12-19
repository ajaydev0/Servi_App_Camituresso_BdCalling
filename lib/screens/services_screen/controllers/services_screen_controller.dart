import 'package:get/get.dart';
import 'package:servi_app_camituresso/screens/services_screen/model/category_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class ServicesScreenController extends GetxController {
  //
  RxBool isLoading = false.obs;
  List<dynamic> categoryList = [].obs;
  getPopularPostAndInList() async {
    try {
      isLoading.value = true;
      var data = await Repository().getCategoryListData();
      if (data != null) {
        for (var element in data) {
          categoryList.add(CategoryModel.fromJson(element));
          update();
        }
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
    await getPopularPostAndInList();
  }
}
