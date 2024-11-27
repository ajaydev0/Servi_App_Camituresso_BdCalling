import 'package:get/get.dart';
import 'package:servi_app_camituresso/screens/error_screen/controllers/error_screen_controller.dart';
import 'package:servi_app_camituresso/screens/splash_screen/controllers/splash_screen_controller.dart';

class AppInitialBinding extends BindingsInterface {
  @override
  dependencies() {
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => ErrorScreenController());
  }
}
