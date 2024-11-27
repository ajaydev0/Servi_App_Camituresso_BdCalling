import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/models/dev_services_model/dev_services_model.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/screens/list_off_view_services/model/get_post_model.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class ServicesHorizontalCard extends StatelessWidget {
  const ServicesHorizontalCard(
      {super.key, required this.item, this.onTap, this.radiusValue = 10.0});

  final dynamic item;
  final void Function()? onTap;
  final double radiusValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.servicesDetailsScreen, arguments: item.sId);
      },
      child: Container(
        // height: AppSize.height(value: 200),
        margin: EdgeInsets.symmetric(
            horizontal: AppSize.width(value: 20.0),
            vertical: AppSize.width(value: 8.0)),
        decoration: BoxDecoration(
            color: AppColors.boxFill,
            borderRadius: BorderRadius.all(
                Radius.circular(AppSize.width(value: radiusValue)))),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.width(value: radiusValue)),
                topRight: Radius.circular(AppSize.width(value: radiusValue)),
              ),
              child: Stack(
                children: [
                  Container(
                    height: AppSize.height(value: 250),
                  ),
                  AppImage(
                    path: "assets/dev_images/services_1.jpg",
                    height: AppSize.height(value: 250),
                    width: Get.width,
                  ),
                  Positioned(
                    right: AppSize.width(value: 20),
                    top: AppSize.width(value: 20),
                    child: GestureDetector(
                      onTap: onTap,
                      child: AppImage(
                          width: AppSize.width(value: 30),
                          height: AppSize.width(value: 30),
                          path:
                              // item.isSaved
                              //     ? AssetsIconsPath.savaDed
                              //     :
                              AssetsIconsPath.notSavaDed),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.width(value: 10),
                  vertical: AppSize.width(value: 5)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          data: item.title ?? "",
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppImage(
                              width: AppSize.width(value: 20),
                              height: AppSize.width(value: 20),
                              path: AssetsIconsPath.location,
                            ),
                            const Gap(width: 5),
                            Expanded(
                                child: AppText(
                                    data:
                                        "2972 Westheimer Rd. Santa Ana, Illinois 85486 ")),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(width: 10),
                  const Icon(Icons.star, color: AppColors.primary),
                  const Gap(width: 5),
                  AppText(data: "4"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
