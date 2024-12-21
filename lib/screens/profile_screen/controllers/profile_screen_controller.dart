import 'package:get/get.dart';
import 'package:servi_app_camituresso/screens/profile_screen/models/profile_screen_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class ProfileScreenController extends GetxController {
  RxBool isNetworkImage = true.obs;
  RxBool isLoading = true.obs;

  ProfileModel profileData = ProfileModel();
  getProfileData() async {
    try {
      isLoading.value = true;
      var data = await Repository().getProfileData();
      if (data != null) {
        profileData = data;
      }
    } catch (e) {
      print("Error fetching profile: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    getProfileData();
    super.onInit();
  }
}
