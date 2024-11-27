import 'package:get/get.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/services/app_storage/app_auth_storage.dart';

class SplashScreenController extends GetxController {
  var userEmail = AppAuthStorage().box.read("email").toString();

  goToNextScreen() async {
    print(AppAuthStorage().box.read("token"));

    await Future.delayed(
      const Duration(seconds: 2),
      () {
        if (AppAuthStorage().getToken() == null) {
          Get.offAllNamed(AppRoutes.signIn);
        } else {
          Get.offAllNamed(AppRoutes.navigationScreen);
        }
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    goToNextScreen();
  }
}
