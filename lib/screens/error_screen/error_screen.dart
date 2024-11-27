import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/screens/error_screen/controllers/error_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppSize.size = size;
    return GetBuilder(
      init: ErrorScreenController(),
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => Icon(
                    controller.isInternetProblem.value ? Icons.signal_wifi_off_outlined : Icons.error_outline_rounded,
                    size: AppSize.width(value: 100),
                  ),
                ),
                const Gap(height: 20),
                Obx(() => AppText(data: controller.errorMessage.value)),
                Obx(() => controller.isInternetProblem.value
                    ? Padding(
                        padding: EdgeInsets.all(AppSize.width(value: 10)),
                        child: const AppText(data: "Check your internet connection"),
                      )
                    : const SizedBox()),
                const Gap(height: 30),
                GestureDetector(
                  onTap: () async {
                    await Get.offAllNamed(AppRoutes.initial);
                  },
                  child: const AppText(
                    data: "Try again",
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
