import 'package:get/get.dart';
import 'package:servi_app_camituresso/screens/services_screen/model/category_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class ServicesScreenController extends GetxController {
  //
  RxBool isLoading = false.obs;
  List<CategoryModel> categoryList = <CategoryModel>[].obs;
  getCategoryList() async {
    try {
      isLoading.value = true;
      var data = await Repository().getCategoryListData();
      if (data.runtimeType != Null) {
        categoryList = data;
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
    await getCategoryList();
  }
}
