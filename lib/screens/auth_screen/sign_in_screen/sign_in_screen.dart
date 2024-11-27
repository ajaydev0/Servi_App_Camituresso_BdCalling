import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/const/assets_images_path.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/screens/auth_screen/sign_in_screen/controllers/sign_in_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/app_snack_bar/app_snack_bar.dart';
import 'package:servi_app_camituresso/widgets/inputs/app_input_widget_two.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SignInScreenController(),
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
                      child: const Column(
                        children: [
                          AppText(
                            data: "Sign in",
                            color: AppColors.white50,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                          Gap(height: 10),
                          AppText(
                            data: "Sign in to your Account",
                            textAlign: TextAlign.center,
                            color: AppColors.white50,
                            fontWeight: FontWeight.w700,
                            fontSize: 42,
                          ),
                          Gap(height: 10),
                          AppText(
                            data: "Enter your email and password to log in ",
                            color: AppColors.white50,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        top: Get.height * 0.35,
                        left: Get.width * 0.05,
                        right: Get.width * 0.05,
                        bottom: 0,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppSize.width(value: 20),
                                vertical: AppSize.width(value: 20.0)),
                            decoration: BoxDecoration(
                              color: AppColors.white50,
                              borderRadius: BorderRadius.only(
                                topLeft:
                                    Radius.circular(AppSize.width(value: 5)),
                                topRight:
                                    Radius.circular(AppSize.width(value: 5)),
                              ),
                            ),
                            child: Form(
                              key: controller.signInFormKey,
                              child: Column(
                                children: [
                                  const Gap(height: 4),
                                  GestureDetector(
                                    onTap: () {
                                      AppSnackBar.message("Not implement!");
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.border),
                                          borderRadius: BorderRadius.circular(
                                              AppSize.width(value: 5))),
                                      padding: EdgeInsets.symmetric(
                                          vertical: AppSize.width(value: 10.0)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                  const Gap(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        height: 2,
                                        color: AppColors.border,
                                      )),
                                      const Gap(width: 5),
                                      const AppText(
                                        data: "Or login with",
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black300,
                                      ),
                                      const Gap(width: 5),
                                      Expanded(
                                          child: Container(
                                        height: 2,
                                        color: AppColors.border,
                                      )),
                                    ],
                                  ),
                                  const Gap(height: 10),
                                  AppInputWidgetTwo(
                                    controller:
                                        controller.emailTextEditingController,
                                    hintText: "Email",
                                    filled: true,
                                    isEmail: true,
                                    fillColor: AppColors.white50,
                                    contentPadding:
                                        const EdgeInsets.symmetric(),
                                    prefix: Align(
                                      child: AppImage(
                                        path: AssetsIconsPath.mail,
                                        width: AppSize.width(value: 20),
                                      ),
                                    ),
                                  ),
                                  const Gap(height: 10),
                                  AppInputWidgetTwo(
                                    controller: controller
                                        .passwordTextEditingController,
                                    hintText: "Password",
                                    filled: true,
                                    isPassWord: true,
                                    maxLines: 1,
                                    fillColor: AppColors.white50,
                                    textInputAction: TextInputAction.done,
                                    contentPadding:
                                        const EdgeInsets.symmetric(),
                                    prefix: Align(
                                      child: AppImage(
                                        path: AssetsIconsPath.password,
                                        width: AppSize.width(value: 20),
                                      ),
                                    ),
                                  ),
                                  const Gap(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Obx(
                                            () => Theme(
                                              data: ThemeData(
                                                unselectedWidgetColor:
                                                    AppColors.green,
                                              ),
                                              child: Checkbox(
                                                activeColor: AppColors.white50,
                                                visualDensity:
                                                    const VisualDensity(
                                                        horizontal: -4,
                                                        vertical: -4),
                                                side: WidgetStateBorderSide
                                                    .resolveWith(
                                                  (states) {
                                                    if (states.contains(
                                                        WidgetState.selected)) {
                                                      return const BorderSide(
                                                          color: AppColors
                                                              .yellow500);
                                                    } else {
                                                      return const BorderSide(
                                                          color: AppColors
                                                              .yellow500);
                                                    }
                                                  },
                                                ),
                                                value: controller
                                                    .isRememberMe.value,
                                                checkColor: AppColors.yellow500,
                                                fillColor:
                                                    const WidgetStatePropertyAll(
                                                        AppColors.white50),
                                                shape: RoundedRectangleBorder(
                                                    side: const BorderSide(
                                                        color: AppColors
                                                            .yellow500),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            AppSize.width(
                                                                value: 5.0))),
                                                onChanged: (value) {
                                                  controller.isRememberMe
                                                      .value = value!;
                                                },
                                              ),
                                            ),
                                          ),
                                          const AppText(
                                            data: "Remember me",
                                            color: AppColors.gray,
                                          )
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(AppRoutes.forGot);
                                        },
                                        child: const AppText(
                                          data: "Forgot Password ?",
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.yellow600,
                                        ),
                                      )
                                    ],
                                  ),
                                  const Gap(height: 20),
                                  Obx(
                                    () => controller.isLoading.value
                                        ? SizedBox(
                                            // height: 50,
                                            // width: 50,
                                            child: FittedBox(
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                              color: AppColors.primary,
                                            )),
                                          ))
                                        : GestureDetector(
                                            onTap: () {
                                              controller.clickSignIButton();
                                            },
                                            child: Container(
                                              width: Get.width,
                                              height:
                                                  AppSize.width(value: 40.0),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: AppColors.primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppSize.width(
                                                              value: 8))),
                                              child: const AppText(
                                                data: "Sign In",
                                                color: AppColors.white50,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                  ),
                                  const Gap(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const AppText(
                                        data: "Don’t have an account?",
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.gray,
                                      ),
                                      const Gap(width: 10),
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(AppRoutes.signUp);
                                        },
                                        child: const AppText(
                                          data: "Sign Up",
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.primary,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ))),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
