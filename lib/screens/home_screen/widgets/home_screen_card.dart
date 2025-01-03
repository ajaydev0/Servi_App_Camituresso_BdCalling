import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/screens/home_screen/controllers/home_screen_controller.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class HomeScreenCard extends StatelessWidget {
  const HomeScreenCard({
    super.key,
    required this.item,
    required this.controller,
  });
  final HomeScreenController controller;
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.adult) {
          Get.toNamed(AppRoutes.eighteenPlusWarningScreen, arguments: item);
        } else {
          Get.toNamed(AppRoutes.servicesDetailsScreen, arguments: item.sId);
        }

        // if (item.category.toLowerCase() == "id10".toLowerCase()) {
        //   Get.toNamed(AppRoutes.eighteenPlusWarningScreen, arguments: item);
        // } else {
        //   Get.toNamed(AppRoutes.servicesDetailsScreen, arguments: item);
        // }
      },
      child: Container(
        width: AppSize.height(value: 250),
        margin: EdgeInsets.symmetric(
            horizontal: AppSize.width(value: 5.0),
            vertical: AppSize.width(value: 8.0)),
        decoration: BoxDecoration(
            color: AppColors.boxFill,
            borderRadius: BorderRadius.circular(AppSize.width(value: 10.0))),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSize.width(value: 10)),
                  topRight: Radius.circular(AppSize.width(value: 10))),
              child: Stack(
                children: [
                  AppImage(
                    url: "${AppApiUrl.domaine}${item.image}",
                    height: AppSize.height(value: 150),
                    width: Get.width,
                  ),
                  ////////////////  saved button
                  /// api data use on this
                  // Positioned(
                  //   right: AppSize.width(value: 20),
                  //   top: AppSize.width(value: 20),
                  //   child: ValueBuilder<bool>(
                  //     initialValue: false,
                  //     builder: (snapshot, updater) =>
                  //     GestureDetector(
                  //       onTap: () {},
                  //       child: AppImage(
                  //         width: AppSize.width(value: 30),
                  //         height: AppSize.width(value: 30),
                  //         path: item.isSaved ? AssetsIconsPath.savaDed : AssetsIconsPath.notSavaDed,
                  //       ),
                  //     ),
                  //   ),
                  // )
/////////////// this is use on only ui dev
                  // Positioned(
                  //   right: AppSize.width(value: 10),
                  //   top: AppSize.width(value: 10),
                  //   child: IconButton(
                  //       style: ButtonStyle(
                  //           backgroundColor: WidgetStatePropertyAll(
                  //               Colors.black.withOpacity(.4))),
                  //       onPressed: () {},
                  //       icon: const Icon(Icons.bookmark_outline,
                  //           color: Colors.white
                  //           //  Color(0xffD0A933)
                  //           )),
                  // ),
                  // Positioned(
                  //   right: AppSize.width(value: 10),
                  //   top: AppSize.width(value: 10),
                  //   child: ValueBuilder<bool?>(
                  //     initialValue: item.bookmark,
                  //     builder: (snapshot, updater) => GestureDetector(
                  //       onTap: () async {
                  //         if (snapshot != null) {
                  //           updater(!snapshot);
                  //           print(item.sId);
                  //           var data =
                  //               await Repository().addBookmark(id: item.sId);
                  //           print(data);
                  //           // controller.update();
                  //           // await controller.getPopularPostList();
                  //           await controller.getRecommendedPostList();
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
                  //                   ? Color(0xffD0A933)
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
                  // )
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
                          fontSize: 16,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(width: 10),
                  const Icon(Icons.star, color: AppColors.primary),
                  const Gap(width: 5),
                  AppText(data: item.rating.toString())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
