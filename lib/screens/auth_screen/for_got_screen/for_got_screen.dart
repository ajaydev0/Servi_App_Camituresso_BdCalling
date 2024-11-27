import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/const/assets_lottie_path.dart';
import 'package:servi_app_camituresso/screens/auth_screen/for_got_screen/controllers/for_got_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/inputs/app_input_widget_two.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class ForGotScreen extends StatelessWidget {
  const ForGotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppText(
          data: "Forget Password",
          color: AppColors.black500,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
      body: GetBuilder(
          init: ForGotScreenController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width(value: 20.0)),
                child: Form(
                  key: controller.forGotScreenKey,
                  child: Column(
                    children: [
                      const AppText(
                        data: "Enter your email account to reset password",
                        fontWeight: FontWeight.w600,
                        color: AppColors.black500,
                      ),
                      AspectRatio(
                          aspectRatio: 1.2,
                          child: LottieBuilder.asset(AssetsLottiePath.forgot)),
                      AppInputWidgetTwo(
                        controller: controller.emailTextEditingController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "Email",
                        filled: true,
                        isEmail: true,
                        textInputAction: TextInputAction.done,
                        fillColor: AppColors.white50,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: AppSize.width(value: 10)),
                        prefix: Align(
                          child: AppImage(
                            path: AssetsIconsPath.mail,
                            width: AppSize.width(value: 20),
                          ),
                        ),
                      ),
                      const Gap(height: 40),
                      Obx(
                        () => controller.isLoading.value
                            ? const SizedBox(
                                child: FittedBox(
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: AppColors.primary,
                                )),
                              ))
                            : GestureDetector(
                                onTap: () {
                                  controller.checkAndSendOtp();
                                },
                                child: Container(
                                  width: Get.width,
                                  height: AppSize.width(value: 50.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      border:
                                          Border.all(color: AppColors.primary),
                                      borderRadius: BorderRadius.circular(
                                          AppSize.width(value: 10))),
                                  child: const AppText(
                                    data: "Continue",
                                    color: AppColors.white50,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                      ),
                      const Gap(height: 30),
                      GestureDetector(
                        onTap: () {
                          controller.clickCancelButton();
                        },
                        child: Container(
                          width: Get.width,
                          height: AppSize.width(value: 45.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.white50,
                              border: Border.all(color: AppColors.primary),
                              borderRadius: BorderRadius.circular(
                                  AppSize.width(value: 10))),
                          child: const AppText(
                            data: "Cancel",
                            color: AppColors.black500,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
