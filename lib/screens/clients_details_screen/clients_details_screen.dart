import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/const/assets_images_path.dart';
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
          return Scaffold(
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
            body: Obx(
              () => controller.isLoading.value
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
                                  path: AssetsImagesPath.nullImage,
                                ),
                              ),
                            ],
                          ),
                          const Gap(height: 10),
                          const AppText(
                            data: "Shanto Hasan",
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          const Gap(height: 10),
                          GestureDetector(
                            onTap: () {
                              // Get.toNamed(
                              //     AppRoutes.conversationScreen,
                              //     arguments: controller.item);
                              // Get.toNamed(
                              //   AppRoutes.conversationScreen,
                              //   arguments: ChatDataModel(
                              //     name: controller.item?.user.name ?? "",
                              //     imageUrl: controller.item?.user.image ??
                              //         AssetsDevImages.devUser,
                              //     isSender: false,
                              //     massage: "test message",
                              //     readeMessage: false,
                              //     time: DateTime(2024, 8, 19, 11),
                              //   ),
                              // );
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
                                    horizontal: 20, vertical: 8),
                                decoration: BoxDecoration(
                                    color: AppColors.primary.withOpacity(.3),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppText(
                                      data: "Booking ID: 846456444",
                                      color: AppColors.gray,
                                    ),
                                    Gap(width: 10),
                                    Icon(
                                      Icons.file_copy,
                                      color: AppColors.black400,
                                      size: 15,
                                    )
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
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  data: "Address",
                                  color: AppColors.gray,
                                  fontSize: 18,
                                ),
                                AppText(
                                  data: "1901 Thornridge Cir. Shiloh",
                                  color: AppColors.black500,
                                  fontSize: 18,
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
                                  data: "Service Details",
                                  color: AppColors.black700,
                                  fontSize: 20,
                                ),
                              ],
                            ),
                          ),
                          const Gap(height: 20),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  data: "Room Clean",
                                  color: AppColors.gray,
                                  fontSize: 18,
                                ),
                                AppText(
                                  data: "\$250",
                                  color: AppColors.black500,
                                  fontSize: 20,
                                ),
                              ],
                            ),
                          ),
                          const Gap(height: 10),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  data: "Room Wash",
                                  color: AppColors.gray,
                                  fontSize: 18,
                                ),
                                AppText(
                                  data: "\$50",
                                  color: AppColors.black500,
                                  fontSize: 20,
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
                          const Gap(height: 20),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  data: "Total",
                                  color: AppColors.black700,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                                AppText(
                                  data: "\$300",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 30),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColors.black400),
                                    borderRadius: BorderRadius.circular(
                                        AppSize.width(value: 20.0))),
                                child: const AppText(
                                  data: "Reject",
                                  color: AppColors.black500,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              const Gap(width: 10),
                              GestureDetector(
                                onTap: () {
                                  // Get.toNamed(
                                  //     AppRoutes.paymentMethodScreen);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 30),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColors.primary),
                                    borderRadius: BorderRadius.circular(
                                        AppSize.width(value: 20.0)),
                                    color: AppColors.primary,
                                  ),
                                  child: const AppText(
                                    data: "Accept",
                                    color: AppColors.white50,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const Gap(width: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
            ),
          );
        });
  }
}
