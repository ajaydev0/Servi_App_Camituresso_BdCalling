import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/screens/list_off_view_services/controllers/list_off_view_services_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class ListOfViewServices extends StatelessWidget {
  const ListOfViewServices({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ListOffViewServicesController(),
        builder: (controller) {
          final ScrollController scrollController = ScrollController();

          // Detect scroll to bottom
          scrollController.addListener(() {
            if (scrollController.position.pixels >=
                    scrollController.position.maxScrollExtent &&
                controller.hasMore.value &&
                !controller.isLoadingMore.value) {
              controller.getPostAndInList(isRefresh: false);
            }
          });

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
                          ),
                        )
                      : ListView.builder(
                          controller: scrollController,
                          itemCount: controller.postList.length +
                              (controller.hasMore.value ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == controller.postList.length) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primary,
                                ),
                              );
                            }

                            var item = controller.postList[index];
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  AppRoutes.yourPostServicesDetailsScreen,
                                  arguments: item.sId,
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: AppSize.width(value: 20.0),
                                    vertical: AppSize.width(value: 8.0)),
                                decoration: BoxDecoration(
                                  color: AppColors.boxFill,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(AppSize.width(value: 10)),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            AppSize.width(value: 10)),
                                        topRight: Radius.circular(
                                            AppSize.width(value: 10)),
                                      ),
                                      child: AppImage(
                                        url:
                                            "${AppApiUrl.domaine}${item.image}",
                                        height: AppSize.height(value: 250),
                                        width: Get.width,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: AppSize.width(value: 10),
                                        vertical: AppSize.width(value: 5),
                                      ),
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
                                                AppText(
                                                  data: item.category ?? "",
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
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
            ),
          );
        });
  }
}
