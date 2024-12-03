import 'package:get/get.dart';
import 'package:servi_app_camituresso/screens/profile_screen/models/profile_screen_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class ProfileScreenController extends GetxController {
  RxBool isNetworkImage = true.obs;
  RxBool isLoading = true.obs;

  Rx<ProfileModel> profile = ProfileModel().obs;
  getProfileData() async {
    try {
      isLoading.value = true;
      var profileData = await Repository().getProfileData();
      profile.value = profileData;
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
