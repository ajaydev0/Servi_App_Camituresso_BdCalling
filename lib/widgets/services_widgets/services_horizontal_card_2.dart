import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class ServicesHorizontalCardTwo extends StatelessWidget {
  const ServicesHorizontalCardTwo(
      {super.key, required this.item, this.onTap, this.radiusValue = 10.0});

  final dynamic item;
  final void Function()? onTap;
  final double radiusValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.adult) {
          Get.toNamed(AppRoutes.eighteenPlusWarningScreen, arguments: item);
        } else {
          Get.toNamed(AppRoutes.servicesDetailsScreen, arguments: item.sId);
        }
        // Get.toNamed(AppRoutes.servicesDetailsScreen, arguments: item.sId);
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
                  AppImage(
                    url: (AppApiUrl.domaine ?? '') + (item.image ?? ''),
                    height: AppSize.height(value: 250),
                    width: Get.width,
                  ),
                  // Positioned(
                  //   right: AppSize.width(value: 20),
                  //   top: AppSize.width(value: 20),
                  //   child: IconButton(
                  //       style: ButtonStyle(
                  //           backgroundColor: WidgetStatePropertyAll(
                  //               Colors.black.withOpacity(.4))),
                  //       onPressed: () {},
                  //       icon: const Icon(Icons.bookmark,
                  //           color: Color(0xffD0A933))),
                  // ),
                  ////////////  saved button
                  // Positioned(
                  //   right: AppSize.width(value: 10),
                  //   top: AppSize.width(value: 10),
                  //   child: ValueBuilder<bool?>(
                  //     initialValue: true,
                  //     // initialValue: item.bookmark,
                  //     builder: (snapshot, updater) => GestureDetector(
                  //       onTap: () async {
                  //         if (snapshot != null) {
                  //           updater(!snapshot);
                  //         }
                  //       },
                  //       child: IconButton(
                  //           style: ButtonStyle(
                  //               backgroundColor: WidgetStatePropertyAll(
                  //                   Colors.black.withOpacity(.4))),
                  //           onPressed: null,
                  //           icon: Icon(
                  //               snapshot == true
                  //                   ? Icons.bookmark
                  //                   : Icons.bookmark_outline,
                  //               color: snapshot == true
                  //                   ? const Color(0xffD0A933)
                  //                   : Colors.white)),

                  //       //  AppImage(
                  //       //   width: AppSize.width(value: 30),
                  //       //   height: AppSize.width(value: 30),
                  //       //   path: snapshot == true
                  //       //       ? AssetsIconsPath.savaDed
                  //       //       : AssetsIconsPath.notSavaDed,
                  //       // ),
                  //     ),
                  //   ),
                  // ),
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
                              data: item.location ?? "",
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(width: 10),
                  const Icon(Icons.star, color: AppColors.primary),
                  const Gap(width: 5),
                  AppText(data: "${item.rating}")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String getImagePath(bool? bookmark) {
    try {
      if (bookmark == null) {
        return AssetsIconsPath.notSavaDed;
      }
      return bookmark ? AssetsIconsPath.savaDed : AssetsIconsPath.notSavaDed;
    } catch (e) {
      log("get image path $e");
      return AssetsIconsPath.notSavaDed;
    }
  }
}
