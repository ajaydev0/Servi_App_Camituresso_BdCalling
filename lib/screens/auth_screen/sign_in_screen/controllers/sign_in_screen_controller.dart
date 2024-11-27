import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/services/api/services/api_post_services.dart';
import 'package:servi_app_camituresso/services/app_storage/app_auth_storage.dart';

class SignInScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isRememberMe = RxBool(false);
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  clickSignIButton() async {
    try {
      if (signInFormKey.currentState!.validate()) {
        // Loading
        isLoading.value = true;
        // Api Call
        var data = await ApiPostServices().apiPostServices(
          url: AppApiUrl.signInUrl,
          body: {
            "email": emailTextEditingController.text,
            "password": passwordTextEditingController.text
          },
        );
        if (data != null) {
          // Set User Token Data in Get Storage
          AppAuthStorage().setToken(data["data"]);

          // Navigate to NavPage
          Get.offAllNamed(AppRoutes.navigationScreen);
        }
      }
    } catch (e) {
      log("error form click SignIn button function : $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.onClose();
  }
}
