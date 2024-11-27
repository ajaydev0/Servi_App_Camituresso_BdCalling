import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/services/api/services/api_post_services.dart';

class ForGotScreenController extends GetxController {
  RxBool isLoading = false.obs;
  GlobalKey<FormState> forGotScreenKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = TextEditingController();

  checkAndSendOtp() async {
    try {
      if (forGotScreenKey.currentState!.validate()) {
        isLoading.value = true;
        var data = await ApiPostServices().apiPostServices(
          url: AppApiUrl.forgotPasswordUrl,
          body: {"email": emailTextEditingController.text},
        );
        if (data != null) {
          print(data);
          Get.toNamed(AppRoutes.otpVerificationScreen,
              arguments: emailTextEditingController.text);
        }
      }
    } catch (e) {
      print("error form click verification code function button : $e");
    } finally {
      isLoading.value = false;
    }
  }

  clickCancelButton() {
    isLoading.value = false;
  }

  @override
  void onClose() {
    super.onClose();
    emailTextEditingController.dispose();
  }
}
