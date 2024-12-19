import 'package:get/get.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class AboutUsScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxString aboutUsData = "".obs;

  getAboutUsData() async {
    try {
      isLoading.value = true;
      var data = await Repository().getAboutUsData();
      if (data.isNotEmpty) {
        aboutUsData.value = data;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    getAboutUsData();
    super.onInit();
  }
}
