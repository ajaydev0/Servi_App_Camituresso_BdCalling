import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/screens/add_and_edit_post_screen/controller/add_and_edit_post_screen_controller.dart';
import 'package:servi_app_camituresso/services/app_storage/app_auth_storage.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/image_user_pic/image_user_pi.dart';
import 'package:servi_app_camituresso/widgets/inputs/app_input_widget.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class AddAndEditPostScreen extends StatelessWidget {
  const AddAndEditPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AddAndEditPostScreenController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              forceMaterialTransparency: true,
              title: Obx(
                () => AppText(
                  data: controller.screenTitle.value,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            body: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSize.width(value: 20.0)),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.addAndEditPostKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(height: 4.5),
                      Obx(() {
                        if (controller.userLocalImage.value.isNotEmpty) {
                          controller.isImageAddCheck.value = false;
                        }
                        return GestureDetector(
                          onTap: () {
                            imageUserTake(controller.userLocalImage);
                          },
                          child: Container(
                            constraints: BoxConstraints(
                              minHeight: AppSize.height(value: 150.0),
                              maxHeight: AppSize.height(value: 200.0),
                            ),
                            decoration: BoxDecoration(
                              border: controller.isImageAddCheck.value
                                  ? Border.all(color: AppColors.warning)
                                  : Border.all(color: AppColors.primary),
                              borderRadius: BorderRadius.circular(
                                  AppSize.width(value: 10)),
                              color: AppColors.white50,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  AppSize.width(value: 10)),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  AppImage(
                                    width: Get.width,
                                    filePath: controller
                                            .userLocalImage.value.isNotEmpty
                                        ? controller.userLocalImage.value
                                        : null,
                                    color: AppColors.white50,
                                  ),
                                  AppImage(
                                    width: AppSize.width(value: 30.0),
                                    height: AppSize.width(value: 30.0),
                                    path: AssetsIconsPath.addImage,
                                    iconColor: controller
                                            .userLocalImage.value.isNotEmpty
                                        ? AppColors.primary
                                        : null,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      ////////// title
                      const Gap(height: 20),
                      const AppText(
                        data: "Job Title",
                        fontWeight: FontWeight.w500,
                      ),
                      const Gap(height: 10),
                      AppInputWidget(
                        controller: controller.titleController,
                        fillColor: AppColors.white50,
                        hintText: "Full Home Cleaning",
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.primary, width: 1),
                          borderRadius:
                              BorderRadius.circular(AppSize.width(value: 10)),
                        ),
                        errBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.warning, width: 1),
                          borderRadius:
                              BorderRadius.circular(AppSize.width(value: 10)),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 100,
                        minLines: 1,
                        textInputAction: TextInputAction.newline,
                      ),

                      ///////////// job price
                      const Gap(height: 20),
                      const AppText(
                        data: "Job Price",
                        fontWeight: FontWeight.w500,
                      ),
                      const Gap(height: 10),
                      AppInputWidget(
                        controller: controller.priceController,
                        prefix: const AppText(
                          data: "  \$",
                          fontSize: 18,
                          color: AppColors.black200,
                          textAlign: TextAlign.end,
                        ),
                        hintText: "00.0",
                        fillColor: AppColors.white50,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.primary, width: 1),
                          borderRadius:
                              BorderRadius.circular(AppSize.width(value: 10)),
                        ),
                        errBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.warning, width: 1),
                          borderRadius:
                              BorderRadius.circular(AppSize.width(value: 10)),
                        ),
                        keyboardType: TextInputType.phone,
                        maxLines: 1,
                        minLines: 1,
                        textInputAction: TextInputAction.next,
                      ),
                      ///////////////// job description
                      const Gap(height: 20),
                      const AppText(
                        data: "Job Description",
                        fontWeight: FontWeight.w500,
                      ),
                      const Gap(height: 10),
                      AppInputWidget(
                        controller: controller.descriptionController,
                        hintText: "Write here..",
                        fillColor: AppColors.white50,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.primary, width: 1),
                          borderRadius:
                              BorderRadius.circular(AppSize.width(value: 10)),
                        ),
                        errBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.warning, width: 1),
                          borderRadius:
                              BorderRadius.circular(AppSize.width(value: 10)),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 100,
                        minLines: 5,
                        textInputAction: TextInputAction.newline,
                      ),
                      /////////// job Pricing Breakdown
                      const Gap(height: 20),
                      const AppText(
                        data: "Pricing Breakdown",
                        fontWeight: FontWeight.w500,
                      ),
                      const Gap(height: 10),
                      AppInputWidget(
                        controller: controller.pricungBreakdownController,
                        hintText: "Write here..",
                        fillColor: AppColors.white50,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.primary, width: 1),
                          borderRadius:
                              BorderRadius.circular(AppSize.width(value: 10)),
                        ),
                        errBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.warning, width: 1),
                          borderRadius:
                              BorderRadius.circular(AppSize.width(value: 10)),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 100,
                        minLines: 5,
                        textInputAction: TextInputAction.newline,
                      ),

                      /////////////  job Category
                      const Gap(height: 10),
                      const AppText(data: "Job Category"),
                      const Gap(height: 10),
                      Obx(
                        () => Container(
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
                                controller.isOpenServicesCategoryList.value,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    AppSize.width(value: 10.0))),
                            expansionAnimationStyle: AnimationStyle(
                              duration: const Duration(seconds: 1),
                              reverseDuration: const Duration(seconds: 1),
                              curve: Curves.ease,
                            ),
                            onExpansionChanged: (value) {
                              controller.isOpenServicesCategoryList.value =
                                  value;
                            },
                            children: List.generate(
                              controller.servicesCategoryList.length,
                              (index) {
                                var item =
                                    controller.servicesCategoryList[index];
                                return GestureDetector(
                                  onTap: () {
                                    controller.isOpenServicesCategoryList
                                        .value = false;
                                    controller.selectedServicesCategory.value =
                                        item;
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
                                      data: item,
                                      color: AppColors.black900,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),

                      ///////////// Job Location
                      const Gap(height: 20),
                      const AppText(
                        data: "Job Location",
                        fontWeight: FontWeight.w500,
                      ),
                      const Gap(height: 10),
                      AppInputWidget(
                        controller: controller.locationController,
                        hintText: "Enter Your Location",
                        fillColor: AppColors.white50,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.primary, width: 1),
                          borderRadius:
                              BorderRadius.circular(AppSize.width(value: 10)),
                        ),
                        errBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.warning, width: 1),
                          borderRadius:
                              BorderRadius.circular(AppSize.width(value: 10)),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 100,
                        minLines: 1,
                        textInputAction: TextInputAction.newline,
                      ),
                      const Gap(height: 50),
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            print(
                                "❤️❤️❤️❤️ Token :  ${AppAuthStorage().getToken()}");
                          },
                          child: Container(
                            width: Get.width,
                            height: AppSize.height(value: 50),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(
                                    AppSize.width(value: 8.0))),
                            child: controller.isLoadingButton.value
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : const AppText(
                                    data: "Value Check",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white50,
                                  ),
                          ),
                        ),
                      ),
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.clickAddAndEditButton();
                          },
                          child: Container(
                            width: Get.width,
                            height: AppSize.height(value: 50),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(
                                    AppSize.width(value: 8.0))),
                            child: controller.isLoadingButton.value
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : const AppText(
                                    data: "Continue",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white50,
                                  ),
                          ),
                        ),
                      ),
                      const Gap(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
