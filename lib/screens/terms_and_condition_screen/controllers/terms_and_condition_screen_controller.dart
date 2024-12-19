import 'package:get/get.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class TermsAndConditionScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxString termsAndConditionData = "".obs;

  getTermsAndConditionsData() async {
    try {
      isLoading.value = true;
      var data = await Repository().getTermsAndConditionsData();
      if (data.isNotEmpty) {
        termsAndConditionData.value = data;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    getTermsAndConditionsData();
    super.onInit();
  }
}
