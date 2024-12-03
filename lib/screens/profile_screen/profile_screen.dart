import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/screens/profile_screen/controllers/profile_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/inputs/app_input_widget_three.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileScreenController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        forceMaterialTransparency: true,
        title: const AppText(
          data: "Profile",
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.editProfileScreen,
                  arguments: controller.profile.value);
            },
            child: AppImage(
              width: AppSize.width(value: 22),
              height: AppSize.width(value: 22),
              path: AssetsIconsPath.actionEdit,
            ),
          ),
          const Gap(width: 20)
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.primary,
          ));
        } else {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width(value: 20.0)),
                width: Get.width,
                child: Column(
                  children: [
                    // controller.isNetworkImage!.value
                    //     ?
                    // AppImageCircular(
                    //   url: controller.profile.value.data!.profile ?? '',
                    //   width: AppSize.height(value: 140),
                    //   height: AppSize.height(value: 140),
                    //   fit: BoxFit.fill,
                    // ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: AppImage(
                        width: AppSize.height(value: 160),
                        height: AppSize.height(value: 160),
                        // color: AppColors.fill,
                        fit: BoxFit.fill,
                        url:
                            "${AppApiUrl.domaine}${controller.profile.value.data?.profile}",
                      ),
                    ),
                    // AppImageCircular(
                    //   url: controller.profile.value.data!.profile ?? "",
                    //   width: AppSize.height(value: 140),
                    //   height: AppSize.height(value: 140),
                    //   fit: BoxFit.fill,
                    // ),

                    // : AppImageCircular(
                    //     // path: controller.profile.value.data.profile,
                    //     // url: controller.profile.value.data.profile,
                    //     filePath: controller.profile.value.data.profile,

                    //     width: AppSize.height(value: 140),
                    //     height: AppSize.height(value: 140),
                    //     fit: BoxFit.fill,
                    //   ),
                    AppInputWidgetThree(
                      title: "Name",
                      hintText: controller.profile.value.data!.name == ""
                          ? "Empty...."
                          : controller.profile.value.data!.name ?? "",
                      elevation: 3,
                      readOnly: true,
                      titleColor: AppColors.black900,
                      elevationColor: AppColors.black50,
                      fillColor: AppColors.fill,
                      prefix: Container(
                        margin: EdgeInsets.all(AppSize.width(value: 12.0)),
                        child: AppImage(
                          path: AssetsIconsPath.account,
                          iconColor: AppColors.primary,
                          width: AppSize.width(value: 30.0),
                          height: AppSize.width(value: 30.0),
                        ),
                      ),
                    ),
                    AppInputWidgetThree(
                      title: "Email",
                      hintText: controller.profile.value.data!.email == ""
                          ? "Empty...."
                          : controller.profile.value.data!.email ?? "",
                      elevation: 3,
                      readOnly: true,
                      titleColor: AppColors.black900,
                      elevationColor: AppColors.black50,
                      fillColor: AppColors.fill,
                      prefix: Container(
                        margin: EdgeInsets.all(AppSize.width(value: 12.0)),
                        child: AppImage(
                          path: AssetsIconsPath.mail,
                          width: AppSize.width(value: 30.0),
                          height: AppSize.width(value: 30.0),
                        ),
                      ),
                    ),
                    AppInputWidgetThree(
                      title: "Contact Number",
                      hintText: controller.profile.value.data!.contact == ""
                          ? "Empty...."
                          : controller.profile.value.data!.contact ?? "",
                      elevation: 3,
                      titleColor: AppColors.black900,
                      elevationColor: AppColors.black50,
                      fillColor: AppColors.fill,
                      readOnly: true,
                      prefix: Container(
                        margin: EdgeInsets.all(AppSize.width(value: 12.0)),
                        child: AppImage(
                          path: AssetsIconsPath.call,
                          width: AppSize.width(value: 30.0),
                          height: AppSize.width(value: 30.0),
                        ),
                      ),
                    ),
                    AppInputWidgetThree(
                      title: "Date of Birth",
                      hintText: controller.profile.value.data!.dateOfBirth == ""
                          ? "Empty...."
                          : controller.profile.value.data!.dateOfBirth ?? "",
                      elevation: 3,
                      readOnly: true,
                      titleColor: AppColors.black900,
                      elevationColor: AppColors.black50,
                      fillColor: AppColors.fill,
                      prefix: Container(
                        margin: EdgeInsets.all(AppSize.width(value: 12.0)),
                        child: AppImage(
                          path: AssetsIconsPath.request,
                          iconColor: AppColors.primary,
                          width: AppSize.width(value: 30.0),
                          height: AppSize.width(value: 30.0),
                        ),
                      ),
                    ),
                    const Gap(height: 15),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        data: "Address",
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black900,
                      ),
                    ),
                    const Gap(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.fill,
                        borderRadius: BorderRadius.circular(
                          AppSize.width(value: 10.0),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(AppSize.width(value: 12.0)),
                            child: AppImage(
                              path: AssetsIconsPath.location,
                              width: AppSize.width(value: 30.0),
                              height: AppSize.width(value: 30.0),
                              iconColor: AppColors.primary,
                            ),
                          ),
                          const Gap(width: 5),
                          Expanded(
                              child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This Field Is Required";
                              }
                              return null;
                            },
                            minLines: 5,
                            maxLines: null,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              hintText:
                                  controller.profile.value.data!.location == ""
                                      ? "Empty...."
                                      : controller.profile.value.data!.location,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: AppColors.black500),
                            ),
                          ))
                        ],
                      ),
                    ),
                    const Gap(height: 50)
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
