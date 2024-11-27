import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_images_path.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

servicesDetailsDeleteDialogWarning() {
  Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.width(value: 10.0))),
        child: Padding(
          padding: EdgeInsets.all(AppSize.width(value: 10.0)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppImage(
                    width: AppSize.width(value: 30),
                    height: AppSize.width(value: 30),
                    path: AssetsImagesPath.deletedWarning,
                  ),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.close))
                ],
              ),
              Gap(height: 10),
              AppText(
                data: "Delete post",
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: AppColors.black700,
              ),
              Gap(height: 10),
              AppText(
                data: "Are you sure you want to delete this post? This action cannot be undone.",
                height: 1.5,
                fontWeight: FontWeight.w500,
                color: AppColors.black500,
              ),
              Gap(height: 20),
              GestureDetector(
                onTap: () {
                  Get.back(times: 2);
                },
                child: Container(
                  width: Get.width,
                  height: AppSize.width(value: 40),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xffD92D20),
                    border: Border.all(color: Color(0xffD92D20)),
                    borderRadius: BorderRadius.circular(AppSize.width(value: 5)),
                  ),
                  child: AppText(
                    data: "Delete",
                    color: AppColors.white50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Gap(height: 10),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: Get.width,
                  height: AppSize.width(value: 40),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.white50,
                    border: Border.all(color: AppColors.black200),
                    borderRadius: BorderRadius.circular(AppSize.width(value: 5)),
                  ),
                  child: AppText(
                    data: "Cancel",
                    color: AppColors.black700,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Gap(height: 10),
            ],
          ),
        ),
      ),
      transitionCurve: Curves.ease);
}
