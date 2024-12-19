import 'package:get/get.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class PrivacyAndPolicyScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxString privacyPolicyData = "".obs;

  getPrivacyPolicyData() async {
    try {
      isLoading.value = true;
      var data = await Repository().getPrivacyPolicyData();
      if (data.isNotEmpty) {
        privacyPolicyData.value = data;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    getPrivacyPolicyData();
    super.onInit();
  }
}
