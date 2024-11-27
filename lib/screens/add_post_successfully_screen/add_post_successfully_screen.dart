import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_images_path.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class AddPostSuccessfullyScreen extends StatelessWidget {
  const AddPostSuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImage(
              width: AppSize.width(value: 80),
              height: AppSize.width(value: 80),
              path: AssetsImagesPath.congratulations,
            ),
            Gap(height: 30),
            AppText(
              data: "Congratulations",
              fontSize: 24,
              color: AppColors.green,
              fontWeight: FontWeight.w600,
            ),
            Gap(height: 20),
            AppText(
              data: "Your Ad posted successfully!",
              fontWeight: FontWeight.w400,
            ),
            Gap(height: 40),
            AppText(
              data: "Now you will receive Service Requestfrom users.",
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Get.back(times: 2);
        },
        child: Container(
          height: AppSize.height(value: 50),
          margin: EdgeInsets.all(AppSize.width(value: 10)),
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(color: AppColors.primary), borderRadius: BorderRadius.circular(AppSize.width(value: 10))),
          child: AppText(
            data: "Got to main page",
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
