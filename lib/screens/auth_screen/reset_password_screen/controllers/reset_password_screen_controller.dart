import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';

import 'package:servi_app_camituresso/services/api/services/api_post_services.dart';
import 'package:servi_app_camituresso/widgets/app_snack_bar/app_snack_bar.dart';

class ResetPasswordScreenController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController reEntryPasswordTextEditingController =
      TextEditingController();
  GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();
  var artData = Get.arguments;

  clickResetButton() async {
    try {
      if (resetPasswordKey.currentState!.validate()) {
        isLoading.value = true;
        var data = await ApiPostServices().apiPostServices(
          url: AppApiUrl.resetPasswordUrl,
          body: {
            "newPassword": passwordTextEditingController.text,
            "confirmPassword": reEntryPasswordTextEditingController.text
          },
          token: artData,
        );
        if (data != null) {
          Get.back(times: 3);
          AppSnackBar.success("Forgot Password Successful");
        }
      }
    } catch (e) {
      log("error form click reset button function: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    passwordTextEditingController.dispose();
    reEntryPasswordTextEditingController.dispose();
    super.onClose();
  }
}
