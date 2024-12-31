import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/screens/user_history_screen/controllers/user_history_enum.dart';
import 'package:servi_app_camituresso/screens/user_history_screen/controllers/user_history_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/inputs/app_input_widget_two.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class UserHistoryScreen extends StatelessWidget {
  const UserHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: UserHistoryScreenController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const AppText(
                  data: "User History",
                  fontWeight: FontWeight.w600,
                ),
                forceMaterialTransparency: true,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(AppSize.width(value: 8)),
                  child: Container(
                    margin: EdgeInsets.only(bottom: AppSize.width(value: 5)),
                    width: Get.width,
                    height: 1,
                    color: AppColors.black50,
                  ),
                ),
              ),
              body: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSize.width(value: 16.0),
                        vertical: AppSize.width(value: 16.0)),
                    child: AppInputWidgetTwo(
                      textInputAction: TextInputAction.search,
                      controller: controller.searchController,
                      hintText: "Search by title",
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: AppSize.width(value: 10.0)),
                      suffixIcon: Obx(() => GestureDetector(
                            onTap: () {
                              if (controller.searchQuery.value.isNotEmpty) {
                                controller.clearSearch();
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                controller.searchQuery.value.isEmpty
                                    ? Icons.search
                                    : Icons.clear,
                                color: AppColors.black400,
                              ),
                            ),
                          )),
                    ),
                  ),
                  Expanded(
                    child: Obx(() {
                      if (controller.isLoading.value) {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ));
                      } else if (controller.isError.value) {
                        return const Center(child: Text("Error loading data"));
                      } else if (controller.filteredList.isEmpty) {
                        return Center(
                          child: Text(controller.searchQuery.value.isEmpty
                              ? "No data available"
                              : "No matching results found"),
                        );
                      } else {
                        return NotificationListener<ScrollNotification>(
                          onNotification: (ScrollNotification scrollInfo) {
                            if (scrollInfo is ScrollEndNotification &&
                                scrollInfo.metrics.pixels >=
                                    scrollInfo.metrics.maxScrollExtent * 0.9) {
                              controller.loadMoreData();
                            }
                            return true;
                          },
                          child: CustomScrollView(
                            slivers: [
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    if (index ==
                                            controller.filteredList.length &&
                                        controller.searchQuery.value.isEmpty) {
                                      return Obx(
                                          () => controller.isLoadingMore.value
                                              ? Container(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  alignment: Alignment.center,
                                                  child:
                                                      const CircularProgressIndicator(
                                                    color: AppColors.primary,
                                                  ),
                                                )
                                              : const SizedBox.shrink());
                                    }
                                    var item = controller.filteredList[index];
                                    return Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: AppSize.width(value: 5.0),
                                          horizontal:
                                              AppSize.width(value: 10.0)),
                                      decoration: BoxDecoration(
                                          color: AppColors.yellow100
                                              .withOpacity(0.8),
                                          borderRadius: BorderRadius.circular(
                                              AppSize.width(value: 10.0))),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                      AppSize.width(
                                                          value: 10.0)),
                                                  bottomLeft: Radius.circular(
                                                      AppSize.width(
                                                          value: 10.0))),
                                              child: AppImage(
                                                url:
                                                    "${AppApiUrl.domaine}${item.service?.image}",
                                                height:
                                                    AppSize.height(value: 170),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          const Gap(width: 6),
                                          Expanded(
                                            flex: 3,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                const Gap(height: 10),
                                                AppText(
                                                  data:
                                                      item.service?.title ?? '',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: AppColors.black700,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                const Gap(height: 4.2),
                                                AppText(
                                                  data:
                                                      "\$${item.service?.price?.toString() ?? ''}",
                                                  color: AppColors.primary,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Gap(height: 5),
                                                    AppText(
                                                      data:
                                                          item.provider?.name ??
                                                              '',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: AppColors.black400,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16,
                                                    ),
                                                    const Gap(height: 4.2),
                                                    AppText(
                                                      data: item.service
                                                              ?.category ??
                                                          '',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: AppColors.black400,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                    )
                                                  ],
                                                ),
                                                const Gap(height: 10.0),
                                                if (item.status ==
                                                    UserHistoryEnum.pending)
                                                  Align(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Get.toNamed(AppRoutes
                                                            .paymentMethodScreen);
                                                      },
                                                      child: Container(
                                                        constraints:
                                                            BoxConstraints(
                                                                maxWidth: AppSize
                                                                    .width(
                                                                        value:
                                                                            100)),
                                                        alignment:
                                                            Alignment.center,
                                                        padding: EdgeInsets.all(
                                                            AppSize.width(
                                                                value: 5.0)),
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .primary),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  AppSize.width(
                                                                      value:
                                                                          5.0)),
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                        child: const AppText(
                                                          data: "Pay Now",
                                                          color:
                                                              AppColors.white50,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height:
                                                            Get.width * 0.08,
                                                        child: AppText(
                                                          data:
                                                              item.status ?? '',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: item.status ==
                                                                  'Accepted'
                                                              ? AppColors.green
                                                              : item.status ==
                                                                      'Canceled'
                                                                  ? Colors.red
                                                                  : item.status ==
                                                                          'Upcoming'
                                                                      ? AppColors
                                                                          .primary
                                                                      : item.status ==
                                                                              'Completed'
                                                                          ? AppColors
                                                                              .green
                                                                          : AppColors
                                                                              .gray,
                                                        ),
                                                      ),
                                                    ),
                                                    if (item.status ==
                                                        'Accepted')
                                                      Expanded(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Get.toNamed(
                                                                AppRoutes
                                                                    .eReceiptScreen,
                                                                parameters: {
                                                                  'id':
                                                                      item.sId!
                                                                });
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height: Get.width *
                                                                0.08,
                                                            decoration: BoxDecoration(
                                                                color: AppColors
                                                                    .primary,
                                                                borderRadius: BorderRadius
                                                                    .circular(AppSize
                                                                        .width(
                                                                            value:
                                                                                5))),
                                                            child:
                                                                const AppText(
                                                              data:
                                                                  "View Receipt",
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .white50,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    const Gap(width: 12),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  childCount: controller.filteredList.length +
                                      (controller.searchQuery.value.isEmpty
                                          ? 1
                                          : 0),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    }),
                  ),
                ],
              ));
        });
  }
}
