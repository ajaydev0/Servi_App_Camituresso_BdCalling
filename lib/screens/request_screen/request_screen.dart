import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/screens/request_screen/controllers/request_screen_controller.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image_circular.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RequestScreenController(),
      builder: (controller) {
        return RefreshIndicator(
          color: AppColors.primary,
          onRefresh: () async {
            await controller.getBookingList();
          },
          child: Obx(
            () => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const AppText(
                  data: "Booking Request",
                  fontWeight: FontWeight.w700,
                ),
              ),
              body: controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.bookingList.length,
                      itemBuilder: (context, index) {
                        var item = controller.bookingList[index];
                        RxBool isLoadingReject = false.obs;
                        RxBool isLoadingConfirm = false.obs;
                        RxBool isPending = false.obs;

                        if (item.status == "Upcoming") {
                          isPending.value = true;
                        } else {
                          isPending.value = false;
                        }
                        return GestureDetector(
                          onTap: () {
                            // print(controller.bookingList);
                            Get.toNamed(AppRoutes.clientsDetailsScreen,
                                arguments: item.sId);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: AppSize.width(value: 5.0),
                                horizontal: AppSize.width(value: 10.0)),
                            // padding: EdgeInsets.all(AppSize.width(value: 5.0)),
                            decoration: BoxDecoration(
                                color: AppColors.black50,
                                borderRadius: BorderRadius.circular(
                                    AppSize.width(value: 10.0))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            AppSize.width(value: 10.0)),
                                        bottomLeft: Radius.circular(
                                            AppSize.width(value: 10.0))),
                                    child: AppImage(
                                      url:
                                          "${AppApiUrl.domaine}${item.service?.image}",

                                      // path: item.image,
                                      height: AppSize.height(value: 180),
                                    ),
                                  ),
                                ),
                                const Gap(width: 10),
                                Expanded(
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Gap(height: 10),
                                        AppText(
                                          data: item.service?.title ?? "",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          color: AppColors.black700,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        const Gap(height: 5),
                                        AppText(
                                          data: "\$${item.service?.price}",
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        const Gap(height: 5),
                                        Row(
                                          children: [
                                            AppImageCircular(
                                              width: AppSize.width(value: 20),
                                              height: AppSize.width(value: 20),
                                              url:
                                                  "${AppApiUrl.domaine}${item.user?.profile}",
                                            ),
                                            const Gap(width: 5),
                                            AppText(
                                              data: item.user?.name ?? "",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              color: AppColors.black400,
                                              fontWeight: FontWeight.w400,
                                            )
                                          ],
                                        ),
                                        const Gap(height: 20.0),
                                        Obx(
                                          () => isPending.value
                                              ? Row(
                                                  children: [
                                                    Expanded(
                                                      child: GestureDetector(
                                                        onTap: () async {
                                                          controller
                                                              .rejectBookClick(
                                                                  item,
                                                                  isPending,
                                                                  isLoadingReject);
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  AppSize.width(
                                                                      value:
                                                                          5.0)),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: AppColors
                                                                      .primary),
                                                              borderRadius: BorderRadius
                                                                  .circular(AppSize
                                                                      .width(
                                                                          value:
                                                                              5.0))),
                                                          child: isLoadingReject
                                                                  .value
                                                              ? const CupertinoActivityIndicator(
                                                                  color: Colors
                                                                      .black,
                                                                )
                                                              : const AppText(
                                                                  data:
                                                                      "Reject",
                                                                  color: AppColors
                                                                      .primary,
                                                                ),
                                                        ),
                                                      ),
                                                    ),
                                                    const Gap(width: 10),
                                                    Expanded(
                                                      child: GestureDetector(
                                                        onTap: () async {
                                                          controller
                                                              .confirmBookClick(
                                                                  item,
                                                                  isPending,
                                                                  isLoadingConfirm);
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  AppSize.width(
                                                                      value:
                                                                          5.0)),
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: AppColors
                                                                    .primary),
                                                            borderRadius: BorderRadius
                                                                .circular(AppSize
                                                                    .width(
                                                                        value:
                                                                            5.0)),
                                                            color: AppColors
                                                                .primary,
                                                          ),
                                                          child: isLoadingConfirm
                                                                  .value
                                                              ? const CupertinoActivityIndicator(
                                                                  color: Colors
                                                                      .white,
                                                                )
                                                              : const AppText(
                                                                  data:
                                                                      "Accept",
                                                                  color: AppColors
                                                                      .white50,
                                                                ),
                                                        ),
                                                      ),
                                                    ),
                                                    const Gap(width: 10),
                                                  ],
                                                )
                                              : Center(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    constraints: BoxConstraints(
                                                        minWidth: AppSize.width(
                                                            value: 120),
                                                        maxWidth: AppSize.width(
                                                            value: 125),
                                                        minHeight:
                                                            AppSize.width(
                                                                value: 25)),
                                                    decoration: BoxDecoration(
                                                      color: item.status ==
                                                              "Completed"
                                                          ? AppColors.green
                                                              .withOpacity(0.45)
                                                          : item.status ==
                                                                  "Accepted"
                                                              ? AppColors
                                                                  .yellow50
                                                              : item.status ==
                                                                      "Rejected"
                                                                  ? AppColors
                                                                      .warning
                                                                      .withOpacity(
                                                                          0.2)
                                                                  : AppColors
                                                                      .black100,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        AppSize.width(
                                                            value: 20.0),
                                                      ),
                                                    ),
                                                    child: AppText(
                                                      data: item.status ==
                                                              "Accepted"
                                                          ? "Ongoing"
                                                          : item.status ==
                                                                  "Rejected"
                                                              ? "Rejected"
                                                              : item.status ==
                                                                      "Completed"
                                                                  ? "Completed"
                                                                  : "",
                                                      color: item.status ==
                                                              "Completed"
                                                          ? AppColors.green
                                                          : item.status ==
                                                                  "Accepted"
                                                              ? AppColors
                                                                  .yellow500
                                                              : item.status ==
                                                                      "Rejected"
                                                                  ? AppColors
                                                                      .warning
                                                                  : AppColors
                                                                      .black100,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                        ),

                                        // Gap(height: 10),
                                        // if (item.status == "Accepted" ||
                                        //     item.status == "Completed" ||
                                        //     item.status == "Rejected")
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        );
      },
    );
  }
}
