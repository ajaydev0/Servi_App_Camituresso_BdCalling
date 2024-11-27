import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/screens/edit_profile_screen/controllers/edit_profile_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image_circular.dart';
import 'package:servi_app_camituresso/widgets/app_snack_bar/app_snack_bar.dart';
import 'package:servi_app_camituresso/widgets/inputs/app_input_widget_three.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: EditProfileScreenController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.white50,
            extendBody: true,
            appBar: AppBar(
              forceMaterialTransparency: true,
              centerTitle: true,
              title: const AppText(
                data: "Edit Profile",
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(2),
                child: Container(
                  width: Get.width,
                  height: 2,
                  color: AppColors.black50,
                ),
              ),
            ),
            bottomNavigationBar: GestureDetector(
              onTap: () {
                controller.clickSaveChange();
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: AppSize.height(value: 20.0),
                    vertical: AppSize.height(value: 12.0)),
                padding: EdgeInsets.all(AppSize.width(value: 13)),
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius:
                        BorderRadius.circular(AppSize.height(value: 12.0))),
                child: const AppText(
                  data: "Save Changes",
                  color: AppColors.white50,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSize.width(value: 20.0)),
                  width: Get.width,
                  child: Form(
                    key: controller.editProfileScreenKey,
                    child: Column(
                      children: [
                        const Gap(height: 10),
                        ////////////  image
                        Align(
                          child: GestureDetector(
                            onTap: () {
                              controller.clickImagePic();
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Obx(
                                  () => AppImageCircular(
                                    width: AppSize.height(value: 160),
                                    height: AppSize.height(value: 160),
                                    color: AppColors.fill,
                                    fit: BoxFit.fill,
                                    filePath:
                                        controller.localImagePath.value.isEmpty
                                            ? null
                                            : controller.localImagePath.value,
                                  ),
                                ),
                                Positioned(
                                    bottom: AppSize.height(value: 12.0),
                                    right: 0,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.imageFill,
                                      ),
                                      padding: EdgeInsets.all(
                                          AppSize.width(value: 8.0)),
                                      child: AppImage(
                                        width: AppSize.height(value: 15),
                                        height: AppSize.height(value: 15),
                                        path: AssetsIconsPath.addImage,
                                        iconColor: AppColors.primary,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        const Gap(height: 20.0),
                        const AppText(
                            data: "Update Picture",
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                        const Gap(height: 20.0),
                        AppInputWidgetThree(
                          controller: controller.nameTextEditingController,
                          title: "Name",
                          titleColor: AppColors.black900,
                          fillColor: AppColors.white50,
                          prefix: Container(
                            margin: EdgeInsets.all(AppSize.width(value: 12.0)),
                            child: AppImage(
                              path: AssetsIconsPath.account,
                              iconColor: AppColors.primary,
                              width: AppSize.width(value: 30.0),
                              height: AppSize.width(value: 30.0),
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.border2),
                              borderRadius: BorderRadius.circular(
                                AppSize.width(value: 10.0),
                              )),
                          errBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.warning)),
                        ),
                        AppInputWidgetThree(
                          onTap: () {
                            AppSnackBar.error("You Can't Edit Email");
                          },
                          readOnly: true,
                          title: "Email",
                          controller: controller.emailTextEditingController,
                          // hintText: controller.argData,
                          fillColor: AppColors.white50,
                          titleColor: AppColors.black900,
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.border2),
                              borderRadius: BorderRadius.circular(
                                AppSize.width(value: 10.0),
                              )),
                          errBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.warning)),
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
                          controller: controller.contactTextEditingController,
                          title: "Contact Number",
                          fillColor: AppColors.white50,
                          titleColor: AppColors.black900,
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.border2),
                              borderRadius: BorderRadius.circular(
                                AppSize.width(value: 10.0),
                              )),
                          errBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.warning)),
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
                          onTap: () {
                            controller.callDateOfBirthSet();
                          },
                          controller:
                              controller.dateOfBirthTextEditingController,
                          title: "Date of Birth",
                          readOnly: true,
                          fillColor: AppColors.white50,
                          titleColor: AppColors.black900,
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.border2),
                              borderRadius: BorderRadius.circular(
                                AppSize.width(value: 10.0),
                              )),
                          errBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.warning)),
                          prefix: Container(
                            margin: EdgeInsets.all(AppSize.width(value: 12.0)),
                            child: AppImage(
                              path: AssetsIconsPath.request,
                              width: AppSize.width(value: 30.0),
                              height: AppSize.width(value: 30.0),
                              iconColor: AppColors.primary,
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

                        TextFormField(
                          controller: controller.addressTextEditingController,
                          onTapOutside: ((ajay) {
                            FocusScope.of(context).unfocus();
                          }),
                          minLines: 5,
                          keyboardType: TextInputType.multiline,
                          maxLines: 100,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  AppSize.width(value: 10)),
                              borderSide:
                                  const BorderSide(color: AppColors.border2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  AppSize.width(value: 10)),
                              borderSide:
                                  const BorderSide(color: AppColors.border2),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  AppSize.width(value: 10)),
                              borderSide:
                                  const BorderSide(color: AppColors.border2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  AppSize.width(value: 10)),
                              borderSide:
                                  const BorderSide(color: AppColors.border2),
                            ),
                            fillColor: const Color(0xffffffff),
                            filled: true,
                            prefixIcon: Container(
                              width: AppSize.width(value: 40),
                              height: AppSize.width(value: 120),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AppImage(
                                    path: AssetsIconsPath.location,
                                    iconColor: AppColors.primary,
                                    width: AppSize.width(value: 30.0),
                                    height: AppSize.width(value: 30.0),
                                  ),
                                  Container(),
                                ],
                              ),
                            ),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 35,
                              minHeight: 0,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field is required";
                            }

                            return null;
                          },
                        ),

                        const Gap(height: 50),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
