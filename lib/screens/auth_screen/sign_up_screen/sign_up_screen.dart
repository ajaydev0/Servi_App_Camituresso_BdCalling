import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/const/assets_images_path.dart';
import 'package:servi_app_camituresso/screens/auth_screen/sign_up_screen/controllers/sign_up_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/app_snack_bar/app_snack_bar.dart';
import 'package:servi_app_camituresso/widgets/inputs/app_input_widget_two.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SignUpScreenController(),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: Get.width,
              height: Get.height,
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  Positioned(
                      child: Container(
                    color: AppColors.white50,
                    width: Get.width,
                    height: Get.height,
                  )),
                  Positioned(
                      top: 0,
                      child: AppImage(
                        path: AssetsImagesPath.backGround,
                        height: Get.height * 0.5,
                        width: Get.width,
                      )),
                  Positioned(
                    top: Get.height * 0.1,
                    left: AppSize.width(value: 50),
                    right: AppSize.width(value: 50),
                    child: Column(
                      children: [
                        const AppText(
                          data: "Sign up",
                          color: AppColors.white50,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                        const Gap(height: 30),
                        const AppText(
                          data: "Sign up",
                          textAlign: TextAlign.center,
                          color: AppColors.white50,
                          fontWeight: FontWeight.w700,
                          fontSize: 42,
                        ),
                        const Gap(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const AppText(
                              data: "Already have an account?",
                              color: AppColors.white50,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                            const Gap(width: 5),
                            // >>>>>>>>>>>>>>>>>>>>>> use click this button then back screen go or sign in screen back  <<<<<<<<<<<<<<<<<<<<<<
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Column(
                                children: [
                                  const AppText(
                                    data: "Log In",
                                    color: AppColors.white50,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                  Container(
                                      height: 2,
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: AppColors.white50))),
                                      child: const AppText(data: "Log In")),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: Get.height * 0.3,
                    left: Get.width * 0.05,
                    right: Get.width * 0.05,
                    bottom: 0,
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSize.width(value: 20),
                            vertical: AppSize.width(value: 20.0)),
                        decoration: BoxDecoration(
                          color: AppColors.white50,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSize.width(value: 5)),
                            topRight: Radius.circular(AppSize.width(value: 5)),
                          ),
                        ),
                        child: Form(
                          key: controller.signUpFormKey,
                          child: Column(
                            children: [
                              const Gap(height: 4),
                              AppInputWidgetTwo(
                                controller:
                                    controller.fullNameTextEditingController,
                                hintText: "Full Name",
                                filled: true,
                                fillColor: AppColors.white50,
                                contentPadding: const EdgeInsets.symmetric(),
                                prefix: Align(
                                  child: AppImage(
                                    path: AssetsIconsPath.user,
                                    width: AppSize.width(value: 20),
                                  ),
                                ),
                              ),
                              const Gap(height: 20),
                              AppInputWidgetTwo(
                                controller:
                                    controller.emailTextEditingController,
                                hintText: "Email",
                                filled: true,
                                isEmail: true,
                                fillColor: AppColors.white50,
                                contentPadding: const EdgeInsets.symmetric(),
                                prefix: Align(
                                  child: AppImage(
                                    path: AssetsIconsPath.mail,
                                    width: AppSize.width(value: 20),
                                  ),
                                ),
                              ),
                              const Gap(height: 20),
                              AppInputWidgetTwo(
                                hintText: "Enter Password",
                                controller:
                                    controller.passwordTextEditingController,
                                filled: true,
                                isPassWord: true,
                                maxLines: 1,
                                fillColor: AppColors.white50,
                                contentPadding: const EdgeInsets.symmetric(),
                                prefix: Align(
                                  child: AppImage(
                                    path: AssetsIconsPath.password,
                                    width: AppSize.width(value: 20),
                                  ),
                                ),
                              ),
                              const Gap(height: 20),
                              AppInputWidgetTwo(
                                controller: controller
                                    .reEnterPasswordTextEditingController,
                                hintText: "Re-Enter Password",
                                filled: true,
                                isPassWord: true,
                                isPassWordSecondValidation: true,
                                isPassWordSecondValidationController:
                                    controller.passwordTextEditingController,
                                maxLines: 1,
                                fillColor: AppColors.white50,
                                textInputAction: TextInputAction.done,
                                contentPadding: const EdgeInsets.symmetric(),
                                prefix: Align(
                                  child: AppImage(
                                    path: AssetsIconsPath.password,
                                    width: AppSize.width(value: 20),
                                  ),
                                ),
                              ),
                              const Gap(height: 30),
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
                                          controller.clickSignUpButton();
                                        },
                                        child: Container(
                                          width: Get.width,
                                          height: AppSize.width(value: 40.0),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: AppColors.primary,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      AppSize.width(value: 5))),
                                          child: const AppText(
                                            data: "Sign Up",
                                            color: AppColors.white50,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                              ),
                              const Gap(height: 30),
                              Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    height: 2,
                                    color: AppColors.border,
                                  )),
                                  const Gap(width: 20),
                                  const AppText(
                                    data: "Or",
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black300,
                                  ),
                                  const Gap(width: 20),
                                  Expanded(
                                      child: Container(
                                    height: 2,
                                    color: AppColors.border,
                                  )),
                                ],
                              ),
                              const Gap(height: 30),
                              GestureDetector(
                                onTap: () {
                                  AppSnackBar.message("Not implement!");
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: AppColors.border),
                                      borderRadius: BorderRadius.circular(
                                          AppSize.width(value: 5))),
                                  padding: EdgeInsets.symmetric(
                                      vertical: AppSize.width(value: 10.0)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppImage(
                                        width: AppSize.width(value: 20),
                                        height: AppSize.width(value: 20),
                                        path: AssetsIconsPath.google,
                                      ),
                                      const Gap(width: 10),
                                      const AppText(
                                        data: "Continue with Google",
                                        fontWeight: FontWeight.bold,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
