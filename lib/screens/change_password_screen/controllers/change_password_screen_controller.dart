import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/services/api/services/api_post_services.dart';
import 'package:servi_app_camituresso/services/app_storage/app_auth_storage.dart';
import 'package:servi_app_camituresso/widgets/app_snack_bar/app_snack_bar.dart';

class ChangePasswordScreenController extends GetxController {
  TextEditingController oldPasswordTextEditingController =
      TextEditingController();
  TextEditingController newPasswordTextEditingController =
      TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();
  GlobalKey<FormState> changePasswordKey = GlobalKey<FormState>();
  var token = AppAuthStorage().box.read("data");

  clickChangePasswordButton() async {
    try {
      if (changePasswordKey.currentState!.validate()) {
        // Api Call
        var data = await ApiPostServices().apiPostServices(
          url: AppApiUrl.changePasswordUrl,
          body: {
            "currentPassword": oldPasswordTextEditingController.text,
            "newPassword": newPasswordTextEditingController.text,
            "confirmPassword": confirmPasswordTextEditingController.text
          },
          token: token,
        );
        if (data != null) {
          AppSnackBar.success("Password changed successfully");
          Get.back(times: 1);
        }
      }
    } catch (e) {
      log("error form click change password button : $e");
    }
  }

  @override
  void onClose() {
    oldPasswordTextEditingController.dispose();
    newPasswordTextEditingController.dispose();
    confirmPasswordTextEditingController.dispose();
    super.onClose();
  }
}
