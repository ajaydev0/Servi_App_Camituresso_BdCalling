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
              body: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.isError.value) {
                  return const Center(child: Text("Error loading data"));
                } else if (controller.listOfUserHistory.isEmpty) {
                  return const Center(child: Text("No data available"));
                } else {
                  return CustomScrollView(slivers: [
                    SliverVisibility(
                        sliver: SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSize.width(value: 16.0),
                            vertical: AppSize.width(value: 16.0)),
                        child: AppInputWidgetTwo(
                          hintText: "Search",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: AppSize.width(value: 10.0)),
                          suffixIcon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.search),
                          ),
                        ),
                      ),
                    )),
                    SliverFillRemaining(
                      child: ListView.builder(

                        itemCount: controller.listOfUserHistory.length,
                        itemBuilder: (context, index) {
                          var item = controller.listOfUserHistory[index];
                          return Container(
                            margin: EdgeInsets.symmetric(
                                vertical: AppSize.width(value: 5.0),
                                horizontal: AppSize.width(value: 10.0)),
                            decoration: BoxDecoration(
                                color: AppColors.yellow100.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(
                                    AppSize.width(value: 10.0))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            AppSize.width(value: 10.0)),
                                        bottomLeft: Radius.circular(
                                            AppSize.width(value: 10.0))),
                                    child: AppImage(
                                      url:
                                          "${AppApiUrl.domaine}${item.service?.image}",
                                      height: AppSize.height(value: 170),
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
                                        data: item.service?.title ?? '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        color: AppColors.black700,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      const Gap(height: 4.2),
                                      AppText(
                                        data: "\$${item.service?.price?.toString() ?? ''}",
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Gap(height: 5),
                                          AppText(
                                            data: item.provider?.name ?? '',
                                            // data: item.userName,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            color: AppColors.black400,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                          const Gap(height: 4.2),
                                          AppText(
                                            data: item.service?.category ?? '',
                                            // data: item.userCategory,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            color: AppColors.black400,
                                            fontWeight: FontWeight.w400,
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
                                              constraints: BoxConstraints(
                                                  maxWidth: AppSize.width(
                                                      value: 100)),
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.all(
                                                  AppSize.width(value: 5.0)),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: AppColors.primary),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppSize.width(
                                                            value: 5.0)),
                                                color: AppColors.primary,
                                              ),
                                              child: const AppText(
                                                data: "Pay Now",
                                                color: AppColors.white50,
                                              ),
                                            ),
                                          ),
                                        ),
                                      // if (item.status !=
                                      //         UserHistoryEnum.request &&
                                      //     item.status !=
                                      //         UserHistoryEnum.complete)
                                      // Center(
                                      //   child: Container(
                                      //     alignment: Alignment.center,
                                      //     constraints: BoxConstraints(
                                      //         minWidth:
                                      //             AppSize.width(value: 120),
                                      //         maxWidth:
                                      //             AppSize.width(value: 125),
                                      //         minHeight:
                                      //             AppSize.width(value: 25)),
                                      //     decoration: BoxDecoration(
                                      //       // color: item.status == UserHistoryEnum.pending
                                      //       //     ? AppColors.black50
                                      //       //     : item.status == UserHistoryEnum.reject
                                      //       //         ? AppColors.warning.withOpacity(0.5)
                                      //       //         : AppColors.black100,
                                      //       borderRadius: BorderRadius.circular(
                                      //         AppSize.width(value: 20.0),
                                      //       ),
                                      //     ),
                                      //     child: AppText(
                                      //       data: item.status ?? '',
                                      //       // data: item.status ==
                                      //       //         UserHistoryEnum.pending
                                      //       //     ? "Ongoing"
                                      //       //     : item.status ==
                                      //       //             UserHistoryEnum.reject
                                      //       //         ? "Rejected"
                                      //       //         : "Canceled",
                                      //       color: item.status == 'Accepted'
                                      //           ? AppColors.green
                                      //           : item.status == 'Cancelled'
                                      //           ? AppColors.warning
                                      //           : item.status == 'Upcoming'
                                      //           ? AppColors.primary // Replace with the actual color
                                      //           : item.status == 'Completed'
                                      //           ? AppColors.green // Replace with the actual color
                                      //           : AppColors.gray,
                                      //     ),
                                      //   ),
                                      // ),
                                      // if (item.status !=
                                      //         UserHistoryEnum.request &&
                                      //     item.status ==
                                      //         UserHistoryEnum.complete)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: Get.width * 0.08,
                                              // decoration: BoxDecoration(color: AppColors.green.withOpacity(0.3), borderRadius: BorderRadius.circular(AppSize.width(value: 5))),
                                              child: AppText(
                                                data: item.status ?? '',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: item.status == 'Accepted'
                                                    ? AppColors.green
                                                    : item.status == 'Canceled'
                                                    ? Colors.red
                                                    : item.status == 'Upcoming'
                                                    ? AppColors.primary // Replace with the actual color
                                                    : item.status == 'Completed'
                                                    ? AppColors.green // Replace with the actual color
                                                    : AppColors.gray,
                                              ),
                                            ),
                                          ),

                                          (item.status == 'Accepted') ?Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.toNamed(
                                                    AppRoutes.eReceiptScreen,
                                                    arguments: item);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: Get.width * 0.08,
                                                decoration: BoxDecoration(
                                                    color: AppColors.primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            AppSize.width(
                                                                value: 5))),
                                                child: const AppText(
                                                  data: "View Receipt",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.white50,
                                                ),
                                              ),
                                            ),
                                          ): Container(),
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
                      ),
                    ),

                  ]);
                }
              }));
        });
  }
}
