import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/screens/list_off_view_services/controllers/list_off_view_services_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/services_widgets/services_horizontal_card.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class ListOfViewServices extends StatelessWidget {
  const ListOfViewServices({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ListOffViewServicesController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            forceMaterialTransparency: true,
            title: const AppText(
              data: "Your Post",
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
                    : controller.postList.isEmpty
                        ? const Center(
                            child: AppText(data: "Empty..."),
                          )
                        : ListView.builder(
                            reverse: false,
                            itemCount: controller.postList.length,
                            itemBuilder: (context, index) {
                              var item = controller.postList[index];

                              return GestureDetector(
                                onTap: () {
                                  // print("${item.image}");
                                  Get.toNamed(AppRoutes.servicesDetailsScreen,
                                      arguments: item.sId);
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
                                            Container(
                                              height:
                                                  AppSize.height(value: 250),
                                            ),
                                            AppImage(
                                              url:
                                                  "${AppApiUrl.domaine}${item.image}",
                                              height:
                                                  AppSize.height(value: 250),
                                              width: Get.width,
                                            ),
                                            // Positioned(
                                            //   right: AppSize.width(value: 20),
                                            //   top: AppSize.width(value: 20),
                                            //   child: GestureDetector(
                                            //     onTap: () {
                                            //       controller
                                            //           .changeSavedMode(index);
                                            //     },
                                            //     child: AppImage(
                                            //         width: AppSize.width(
                                            //             value: 30),
                                            //         height: AppSize.width(
                                            //             value: 30),
                                            //         path:
                                            //             // item.isSaved
                                            //             //     ? AssetsIconsPath.savaDed
                                            //             //     :
                                            //             AssetsIconsPath
                                            //                 .notSavaDed),
                                            //   ),
                                            // )
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
                                                    data: item.title ?? "",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      // const Gap(width: 5),
                                                      Expanded(
                                                          child: AppText(
                                                              data:
                                                                  item.category ??
                                                                      "")),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            AppText(
                                              data: "\$${item.price ?? ""}",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                              color: const Color(0xffD0A933),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );

                              // ServicesHorizontalCard(
                              //   item: item,
                              //   onTap: () {
                              //     controller.changeSavedMode(index);
                              //   },
                              // );
                            },
                          ),
          ),
        );
      },
    );
  }
}
