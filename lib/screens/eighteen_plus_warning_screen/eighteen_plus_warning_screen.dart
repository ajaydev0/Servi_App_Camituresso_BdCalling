import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_images_path.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/screens/eighteen_plus_warning_screen/controllers/eighteen_plus_warning_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class EighteenPlusWarningScreen extends StatelessWidget {
  const EighteenPlusWarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: EighteenPlusWarningScreenController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(AppSize.width(value: 20.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      AppImage(
                        path: AssetsImagesPath.ageWarning,
                        width: Get.width * 0.3,
                      ),
                      Gap(height: 30),
                      RichText(
                        text: TextSpan(
                            text: "This Apps contains content intended solely for persons ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: AppColors.black900,
                            ),
                            children: [
                              TextSpan(
                                text: "aged 18 and over",
                                style: TextStyle(
                                  color: Color(0xffE61D25),
                                ),
                              ),
                            ]),
                      ),
                      Gap(height: 20),
                      RichText(
                        text: TextSpan(
                            text: "To continue service please proceed with ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: AppColors.black900,
                            ),
                            children: [
                              TextSpan(
                                text: "Age Verification ",
                                style: TextStyle(
                                  color: Color(0xffD0A933),
                                ),
                              ),
                              TextSpan(text: "below")
                            ]),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.offAndToNamed(AppRoutes.servicesDetailsScreen, arguments: controller.servicesModel);
                        },
                        child: Container(
                          margin: EdgeInsets.all(AppSize.width(value: 10)),
                          width: Get.width,
                          height: AppSize.height(value: 50),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(AppSize.width(value: 15.0)),
                            border: Border.all(color: AppColors.primary),
                          ),
                          child: AppText(
                            data: "Continue",
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white50,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          margin: EdgeInsets.all(AppSize.width(value: 10)),
                          width: Get.width,
                          height: AppSize.height(value: 50),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.white50,
                            borderRadius: BorderRadius.circular(AppSize.width(value: 15.0)),
                            border: Border.all(color: AppColors.primary),
                          ),
                          child: AppText(
                            data: "Leave the page",
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
