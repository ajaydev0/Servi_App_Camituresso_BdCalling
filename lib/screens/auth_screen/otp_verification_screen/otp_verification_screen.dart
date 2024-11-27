import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/screens/auth_screen/otp_verification_screen/controllers/otp_verification_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/inputs/otp_input_field_widget.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OtpVerificationScreenController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.width(value: 20.0),
              ),
              child: Form(
                key: controller.verificationCodeKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => AppText(
                        data: controller.isEmailVerification.value
                            ? "Verify Your Email Address"
                            : "Enter Verification Code",
                        fontWeight: FontWeight.w600,
                        color: AppColors.black700,
                        fontSize: 28,
                      ),
                    ),
                    const Gap(height: 20),
                    Obx(
                      () => AppText(
                        data: controller.isEmailVerification.value
                            ? "A verification code has been sent to "
                            : "Enter your email account to reset password",
                        fontWeight: FontWeight.w500,
                        color: AppColors.black500,
                      ),
                    ),
                    const Gap(height: 10),
                    Obx(
                      () => !controller.isEmailVerification.value
                          ? const SizedBox()
                          : AppText(
                              data: controller.argMail.value,
                              fontWeight: FontWeight.w500,
                              color: AppColors.yellow500,
                            ),
                    ),
                    const Gap(height: 100),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(data: "Code"),
                    ),
                    const Gap(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OtpInputFieldWidget(
                            controller: controller.otp1TextEditingController),
                        OtpInputFieldWidget(
                          controller: controller.otp2TextEditingController,
                        ),
                        OtpInputFieldWidget(
                          controller: controller.otp3TextEditingController,
                        ),
                        OtpInputFieldWidget(
                          controller: controller.otp4TextEditingController,
                        ),
                        OtpInputFieldWidget(
                          controller: controller.otp5TextEditingController,
                        ),
                        OtpInputFieldWidget(
                          controller: controller.otp6TextEditingController,
                        ),
                      ],
                    ),
                    const Gap(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(() => AppText(
                          data:
                              "Send Code Again : ${controller.formatTime(controller.seconds.value)}")),
                    ),
                    const Gap(height: 40),
                    Obx(
                      () => controller.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ))
                          : GestureDetector(
                              onTap: () {
                                controller.clickVerificationCodeButton();
                              },
                              child: Container(
                                width: Get.width,
                                height: AppSize.width(value: 50.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(
                                        AppSize.width(value: 5))),
                                child: const AppText(
                                  data: "Continue",
                                  color: AppColors.white50,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                    ),
                    const Gap(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AppText(
                          data: "Didn’t you receive OTP?",
                          fontWeight: FontWeight.w400,
                          color: AppColors.black400,
                        ),
                        const Gap(width: 5),
                        GestureDetector(
                          onTap: () {
                            controller.reCallStatTimer();
                          },
                          child: Obx(
                            () => AppText(
                              data: "Resend OTP",
                              fontWeight: FontWeight.w600,
                              color: controller.seconds.value == 0
                                  ? AppColors.primary
                                  : AppColors.primary.withOpacity(0.5),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
