import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/screens/clients_details_screen/controllers/clients_details_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class ClientsDetailsScreen extends StatelessWidget {
  const ClientsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ClientsDetailsScreenController(),
        builder: (controller) {
          return Obx(
            () => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const AppText(
                  data: "Clients Details",
                  fontWeight: FontWeight.w600,
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(2),
                  child: Container(
                    width: Get.width,
                    height: 1,
                    color: AppColors.black50,
                  ),
                ),
              ),
              body: controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ))
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          const Gap(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                child: AppImage(
                                  height: AppSize.size.height * 0.15,
                                  width: AppSize.size.width * 0.35,
                                  url:
                                      "${AppApiUrl.domaine}${controller.itemDetails.user?.profile}",
                                ),
                              ),
                            ],
                          ),
                          const Gap(height: 10),
                          AppText(
                            data: controller.itemDetails.user?.name ?? "",
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          const Gap(height: 10),
                          controller.isLoadingForChat.value
                              ? const Center(
                                  child: CupertinoActivityIndicator(
                                    color: Colors.black,
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () async {
                                    controller.clickOnMessageButton();
                                  },
                                  child: AppImage(
                                    path: AssetsIconsPath.chatFill,
                                    width: AppSize.width(value: 25),
                                    height: AppSize.width(value: 25),
                                  ),
                                ),
                          const Gap(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 1.3,
                                  // width: AppSize.size.width * 0.25,
                                  color: AppColors.primary.withOpacity(.5),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                // height: AppSize.width(value: 30),
                                // width: AppSize.width(value: 100),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 0),
                                decoration: BoxDecoration(
                                    color: AppColors.primary.withOpacity(.3),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppText(
                                      data:
                                          "Booking ID: ${controller.itemDetails.offerId}",
                                      color: AppColors.gray,
                                    ),
                                    // Gap(width: 10),
                                    IconButton(
                                        onPressed: () {
                                          controller.copyToClipboard(context,
                                              controller.itemDetails.offerId);
                                        },
                                        tooltip: 'Copy to Clipboard',
                                        icon: const Icon(
                                          Icons.file_copy,
                                          color: AppColors.black400,
                                          size: 15,
                                        ))
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 1.3,
                                  // width: AppSize.size.width * 0.25,
                                  color: AppColors.primary.withOpacity(.5),
                                ),
                              ),
                            ],
                          ),
                          const Gap(height: 30),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                AppText(
                                  data: "Client Details",
                                  color: AppColors.black700,
                                  fontSize: 20,
                                ),
                              ],
                            ),
                          ),
                          const Gap(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const AppText(
                                  data: "Address",
                                  color: AppColors.gray,
                                  fontSize: 18,
                                ),
                                Expanded(
                                  child: AppText(
                                    data:
                                        controller.itemDetails.user?.location ??
                                            "",
                                    color: AppColors.black500,
                                    fontSize: 18,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Gap(height: 30),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 1.3,
                                  // width: AppSize.size.width * 0.25,
                                  color: AppColors.primary.withOpacity(.5),
                                ),
                              ),
                            ],
                          ),
                          const Gap(height: 30),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                AppText(
                                  data: "Price Breakdown",
                                  color: AppColors.black700,
                                  fontSize: 20,
                                ),
                              ],
                            ),
                          ),
                          const Gap(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                AppText(
                                  data: controller.itemDetails.service
                                          ?.priceBreakdown ??
                                      "",
                                  color: AppColors.gray,
                                  fontSize: 18,
                                  // textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                          // const Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 20),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       AppText(
                          //         data: "Room Clean",
                          //         color: AppColors.gray,
                          //         fontSize: 18,
                          //       ),
                          //       AppText(
                          //         data: "\$250",
                          //         color: AppColors.black500,
                          //         fontSize: 20,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // const Gap(height: 10),
                          // const Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 20),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       AppText(
                          //         data: "Room Wash",
                          //         color: AppColors.gray,
                          //         fontSize: 18,
                          //       ),
                          //       AppText(
                          //         data: "\$50",
                          //         color: AppColors.black500,
                          //         fontSize: 20,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          const Gap(height: 30),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 1.3,
                                  // width: AppSize.size.width * 0.25,
                                  color: AppColors.primary.withOpacity(.5),
                                ),
                              ),
                            ],
                          ),
                          const Gap(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const AppText(
                                  data: "Total",
                                  color: AppColors.black700,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                                AppText(
                                  data:
                                      "\$${controller.itemDetails.service?.price}",
                                  color: AppColors.black700,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                          const Gap(height: 20),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 1.3,
                                  // width: AppSize.size.width * 0.25,
                                  color: AppColors.primary.withOpacity(.5),
                                ),
                              ),
                            ],
                          ),
                          const Gap(height: 50),
                          // if (controller.itemDetails.status != "Upcoming")

                          controller.isPending.value
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        print(controller.itemDetails.status);
                                        controller.rejectBookClick(
                                            controller.itemDetails);
                                        // Get.toNamed(
                                        //     AppRoutes.paymentMethodScreen);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 30),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.black400),
                                            borderRadius: BorderRadius.circular(
                                                AppSize.width(value: 20.0))),
                                        child: controller.isLoadingReject.value
                                            ? const CupertinoActivityIndicator(
                                                color: Colors.black,
                                              )
                                            : const AppText(
                                                data: "Reject",
                                                color: AppColors.black500,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                              ),
                                      ),
                                    ),
                                    const Gap(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        print(controller.itemDetails.status);
                                        controller.confirmBookClick(
                                            controller.itemDetails);
                                        // Get.toNamed(
                                        //     AppRoutes.paymentMethodScreen);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 30),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.primary),
                                          borderRadius: BorderRadius.circular(
                                              AppSize.width(value: 20.0)),
                                          color: AppColors.primary,
                                        ),
                                        child: controller.isLoadingConfirm.value
                                            ? const CupertinoActivityIndicator(
                                                color: Colors.white,
                                              )
                                            : const AppText(
                                                data: "Accept",
                                                color: AppColors.white50,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
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
                                        minWidth: AppSize.width(value: 120),
                                        maxWidth: AppSize.width(value: 150),
                                        minHeight: AppSize.width(value: 40)),
                                    decoration: BoxDecoration(
                                      color: controller.itemDetails.status ==
                                              "Completed"
                                          ? AppColors.green.withOpacity(0.45)
                                          : controller.itemDetails.status ==
                                                  "Accepted"
                                              ? AppColors.yellow50
                                              : controller.itemDetails.status ==
                                                      "Rejected"
                                                  ? AppColors.warning
                                                      .withOpacity(0.2)
                                                  : AppColors.blue,
                                      borderRadius: BorderRadius.circular(
                                        AppSize.width(value: 20.0),
                                      ),
                                    ),
                                    child: AppText(
                                      data: controller.itemDetails.status ?? "",
                                      // data: controller.itemDetails.status ==
                                      //         "Accepted"
                                      //     ? "Ongoing"
                                      //     : controller.itemDetails.status ==
                                      //             "Rejected"
                                      //         ? "Rejected"
                                      //         : controller.itemDetails.status ==
                                      //                 "Completed"
                                      //             ? "Completed"
                                      //             : "",
                                      color: controller.itemDetails.status ==
                                              "Completed"
                                          ? AppColors.green
                                          : controller.itemDetails.status ==
                                                  "Accepted"
                                              ? AppColors.yellow500
                                              : controller.itemDetails.status ==
                                                      "Rejected"
                                                  ? AppColors.warning
                                                  : AppColors.black100,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
            ),
          );
        });
  }
}
