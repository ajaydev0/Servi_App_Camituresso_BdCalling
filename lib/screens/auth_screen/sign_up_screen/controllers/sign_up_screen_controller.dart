import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/services/api/services/api_post_services.dart';
// import 'package:servi_app_camituresso/services/app_storage/app_auth_storage.dart';

class SignUpScreenController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController fullNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController reEnterPasswordTextEditingController =
      TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  clickSignUpButton() async {
    try {
      if (signUpFormKey.currentState!.validate()) {
        isLoading.value = true;
        // Api Call
        var data = await ApiPostServices().apiPostServices(
          url: AppApiUrl.signUpUrl,
          body: {
            "name": fullNameTextEditingController.text,
            "email": emailTextEditingController.text,
            "password": passwordTextEditingController.text
          },
        );
        if (data != null) {
          Get.toNamed(AppRoutes.otpVerificationScreen,
              arguments: {"email": emailTextEditingController.text});
        }
      }
    } catch (e) {
      log("error form sign up click button $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    fullNameTextEditingController.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    reEnterPasswordTextEditingController.dispose();
    super.onClose();
  }
}
