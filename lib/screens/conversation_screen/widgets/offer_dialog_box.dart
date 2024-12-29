import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/screens/conversation_screen/controllers/conversation_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/inputs/app_input_widget.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

conversationOfferDialog(ConversationScreenController controller) {
  Get.dialog(
    barrierDismissible: false,
    Dialog(
      backgroundColor: AppColors.white50,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSize.width(value: 15.0),
            vertical: AppSize.width(value: 10.0)),
        child: SingleChildScrollView(
          child: Form(
            key: controller.key,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppText(
                      data: "Send Offer",
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.closeAllDialogs();
                          controller.selectedServicesCategory.value =
                              "Select Service";
                        },
                        child: const Icon(Icons.cancel_outlined))
                  ],
                ),
                const Gap(height: 10),
                const AppText(data: "Select Services"),
                const Gap(height: 10),
                Obx(
                  () => controller.isLoadingService.value
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ))
                      : Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: controller.isJobCategoryCheck.value
                                    ? AppColors.warning
                                    : AppColors.primary,
                              ),
                              borderRadius: BorderRadius.circular(
                                  AppSize.width(value: 10))),
                          child: ExpansionTile(
                            key: GlobalKey(),
                            title: AppText(
                                data:
                                    controller.selectedServicesCategory.value),
                            initiallyExpanded:
                                controller.isOpenServicesList.value,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    AppSize.width(value: 10.0))),
                            expansionAnimationStyle: AnimationStyle(
                              duration: const Duration(seconds: 1),
                              reverseDuration: const Duration(seconds: 1),
                              curve: Curves.ease,
                            ),
                            onExpansionChanged: (value) {
                              controller.isOpenServicesList.value = value;
                            },
                            children: List.generate(
                              controller.servicesCategoryList.length,
                              (index) {
                                var item =
                                    controller.servicesCategoryList[index];
                                return GestureDetector(
                                  onTap: () {
                                    controller.isOpenServicesList.value = false;
                                    controller.selectedServicesID.value =
                                        item.sId ?? "";
                                    controller.selectedServicesCategory.value =
                                        item.title ?? "";
                                    controller.isJobCategoryCheck.value = false;
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: AppColors.yellow200,
                                      border: Border(
                                        bottom: BorderSide(
                                            color: AppColors.bannerBoxFill),
                                      ),
                                    ),
                                    width: Get.width,
                                    padding: EdgeInsets.symmetric(
                                        vertical: AppSize.width(value: 10),
                                        horizontal: AppSize.width(value: 10)),
                                    child: AppText(
                                      data: item.title ?? "",
                                      color: AppColors.black900,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                ),
                const Gap(height: 20),
                const AppText(data: "Offer Amount"),
                const Gap(height: 10),
                AppInputWidget(
                  controller: controller.offerAmount,
                  fillColor: AppColors.white50,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.bannerBoxFill, width: 1),
                    borderRadius:
                        BorderRadius.circular(AppSize.width(value: 10)),
                  ),
                  errBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.warning.withOpacity(0.2), width: 1),
                    borderRadius:
                        BorderRadius.circular(AppSize.width(value: 10)),
                  ),
                  keyboardType: TextInputType.phone,
                  style:
                      const TextStyle(color: AppColors.primary, fontSize: 18),
                  prefix: const AppText(
                    data: "  \$ ",
                    fontSize: 18,
                    color: AppColors.primary,
                    textAlign: TextAlign.end,
                  ),
                ),
                const Gap(height: 20),
                const AppText(data: "Service Details"),
                const Gap(height: 10),
                AppInputWidget(
                  controller: controller.offerDescription,
                  fillColor: AppColors.white50,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.bannerBoxFill, width: 1),
                    borderRadius:
                        BorderRadius.circular(AppSize.width(value: 10)),
                  ),
                  errBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.warning.withOpacity(0.2), width: 1),
                    borderRadius:
                        BorderRadius.circular(AppSize.width(value: 10)),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 100,
                  minLines: 5,
                  textInputAction: TextInputAction.newline,
                ),
                const Gap(height: 30),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.sendOfferButton();
                    },
                    child: Container(
                      width: Get.width,
                      height: AppSize.height(value: 50),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(
                            AppSize.width(value: 10),
                          )),
                      child: controller.isLoadingSendOfferButton.value
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const AppText(
                              data: "Send",
                              color: AppColors.white50,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const Gap(height: 10),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
