import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/screens/auth_screen/reset_password_screen/controllers/reset_password_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/inputs/app_input_widget_two.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder(
          init: ResetPasswordScreenController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width(value: 20.0)),
                child: Form(
                  key: controller.resetPasswordKey,
                  child: Column(
                    children: [
                      const AppText(
                        data: "Reset Your Password",
                        fontWeight: FontWeight.w600,
                        color: AppColors.black700,
                        fontSize: 24,
                      ),
                      const Gap(height: 20),
                      const AppText(
                        data: "This password must be different than before ",
                        fontWeight: FontWeight.w500,
                        color: AppColors.black500,
                      ),
                      const Gap(height: 70),
                      AppInputWidgetTwo(
                        controller: controller.passwordTextEditingController,
                        hintText: "Enter Password",
                        filled: true,
                        isPassWord: true,
                        maxLines: 1,
                        fillColor: AppColors.white50,
                        textInputAction: TextInputAction.done,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: AppSize.width(value: 10)),
                        prefix: Align(
                          child: AppImage(
                            path: AssetsIconsPath.password,
                            width: AppSize.width(value: 20),
                          ),
                        ),
                      ),
                      const Gap(height: 20),
                      AppInputWidgetTwo(
                        controller:
                            controller.reEntryPasswordTextEditingController,
                        isPassWordSecondValidation: true,
                        isPassWordSecondValidationController:
                            controller.passwordTextEditingController,
                        hintText: "Re-Enter Password",
                        filled: true,
                        isPassWord: true,
                        maxLines: 1,
                        fillColor: AppColors.white50,
                        textInputAction: TextInputAction.done,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: AppSize.width(value: 10)),
                        prefix: Align(
                          child: AppImage(
                            path: AssetsIconsPath.password,
                            width: AppSize.width(value: 20),
                          ),
                        ),
                      ),
                      const Gap(height: 60),
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
                                  controller.clickResetButton();
                                },
                                child: Container(
                                  width: Get.width,
                                  height: AppSize.width(value: 45.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(
                                          AppSize.width(value: 10))),
                                  child: const AppText(
                                    data: "Continue",
                                    color: AppColors.white50,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
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
