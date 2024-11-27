import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class AppSnackBar {
  // >>>>>>>>>>>>>>>>>>>>>> when show message bottom  <<<<<<<<<<<<<<<<<<<<<<

  // >>>>>>>>>>>>>>>>>>>>>> error message snackbar  <<<<<<<<<<<<<<<<<<<<<<
  static error(String parameterValue) {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: AppColors.warning,
        animationDuration: const Duration(seconds: 2),
        duration: const Duration(seconds: 3),
        messageText: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
              data: "Error!",
              color: AppColors.white50,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
            AppText(
              data: parameterValue,
              color: AppColors.white50,
            ),
          ],
        ),
      ),
    );
  }

  // >>>>>>>>>>>>>>>>>>>>>> success message <<<<<<<<<<<<<<<<<<<<<<

  static success(String parameterValue) {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: AppColors.green,
        animationDuration: const Duration(seconds: 2),
        duration: const Duration(seconds: 3),
        messageText: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
              data: "Success!",
              color: AppColors.white50,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
            AppText(
              data: parameterValue,
              color: AppColors.white50,
            ),
          ],
        ),
      ),
    );
  }

  // >>>>>>>>>>>>>>>>>>>>>> message  <<<<<<<<<<<<<<<<<<<<<<
  // >>>>>>>>>>>>>>>>>>>>>> only show message <<<<<<<<<<<<<<<<<<<<<<

  static message(String parameterValue) {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: AppColors.black300,
        animationDuration: const Duration(seconds: 2),
        duration: const Duration(seconds: 3),
        messageText: AppText(
          data: parameterValue,
          color: AppColors.white200,
          fontSize: 16,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w400,
        ),
        borderRadius: AppSize.width(value: 20.0),
        padding: EdgeInsets.all(AppSize.width(value: 10.0)),
        margin: EdgeInsets.symmetric(horizontal: AppSize.width(value: 40.0), vertical: AppSize.width(value: 30)),
      ),
    );
  }
}
