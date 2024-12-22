import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/const/assets_images_path.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/screens/saved_screen/controllers/saved_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/services_widgets/services_horizontal_card_2.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SavedScreenController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            forceMaterialTransparency: true,
            title: const AppText(
              data: "Saved",
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
          ),
          body: Obx(
            () => controller.isError.value
                ? const Center(
                    child: AppText(data: "Error"),
                  )
                : controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ))
                    : controller.bookmarkList.isEmpty
                        ? const Center(
                            child: AppText(data: "Empty..."),
                          )
                        : ListView.builder(
                            reverse: false,
                            itemCount: controller.bookmarkList.length,
                            itemBuilder: (context, index) {
                              var item = controller.bookmarkList[index];

                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.servicesDetailsScreen,
                                      arguments: item.service?.sId);
                                },
                                child: Container(
                                  // height: AppSize.height(value: 200),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: AppSize.width(value: 20.0),
                                      vertical: AppSize.width(value: 8.0)),
                                  decoration: BoxDecoration(
                                      color: AppColors.boxFill,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              AppSize.width(value: 10)))),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              AppSize.width(value: 10)),
                                          topRight: Radius.circular(
                                              AppSize.width(value: 10)),
                                        ),
                                        child: Stack(
                                          children: [
                                            AppImage(
                                              url:
                                                  "${AppApiUrl.domaine}${item.service?.image}",
                                              height:
                                                  AppSize.height(value: 250),
                                              width: Get.width,
                                            ),
                                            Positioned(
                                              right: AppSize.width(value: 20),
                                              top: AppSize.width(value: 20),
                                              child: IconButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          WidgetStatePropertyAll(
                                                              Colors.black
                                                                  .withOpacity(
                                                                      .4))),
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                      Icons.bookmark,
                                                      color:
                                                          Color(0xffD0A933))),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                AppSize.width(value: 10),
                                            vertical: AppSize.width(value: 5)),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  AppText(
                                                    data: item.service
                                                            ?.category ??
                                                        "",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AppImage(
                                                        width: AppSize.width(
                                                            value: 20),
                                                        height: AppSize.width(
                                                            value: 20),
                                                        path: AssetsIconsPath
                                                            .location,
                                                      ),
                                                      const Gap(width: 5),
                                                      Expanded(
                                                          child: AppText(
                                                              data: item.service
                                                                      ?.location ??
                                                                  "")),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Gap(width: 10),
                                            const Icon(Icons.star,
                                                color: AppColors.primary),
                                            const Gap(width: 5),
                                            AppText(
                                                data:
                                                    "${item.service?.rating}.0")
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );

                              // ServicesHorizontalCardTwo(
                              //   item: item,
                              //   onTap:,
                              // );
                            },
                          ),
          ),
        );
      },
    );
  }
}
