import 'package:get/get.dart';
import 'package:servi_app_camituresso/screens/auth_screen/for_got_screen/controllers/for_got_screen_controller.dart';
import 'package:servi_app_camituresso/screens/auth_screen/otp_verification_screen/controllers/otp_verification_screen_controller.dart';
import 'package:servi_app_camituresso/screens/auth_screen/reset_password_screen/controllers/reset_password_screen_controller.dart';
import 'package:servi_app_camituresso/screens/auth_screen/sign_in_screen/controllers/sign_in_screen_controller.dart';
import 'package:servi_app_camituresso/screens/auth_screen/sign_up_screen/controllers/sign_up_screen_controller.dart';

class AppAuthBinding extends BindingsInterface {
  @override
  dependencies() {
    Get.lazyPut(() => SignInScreenController());
    Get.lazyPut(() => SignUpScreenController());
    Get.lazyPut(() => ForGotScreenController());
    Get.lazyPut(() => OtpVerificationScreenController());
    Get.lazyPut(() => ResetPasswordScreenController());
  }
}
