import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/screens/change_password_screen/controllers/change_password_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/widgets/inputs/app_input_widget_three.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ChangePasswordScreenController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: AppText(
                data: "Change Password",
                fontWeight: FontWeight.w600,
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(2),
                child: Container(
                  width: Get.width,
                  height: 1,
                  color: AppColors.black50,
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(AppSize.width(value: 10.0)),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.changePasswordKey,
                  child: Column(
                    children: [
                      AppInputWidgetThree(
                        controller: controller.oldPasswordTextEditingController,
                        title: "Old Password",
                        isPassWord: true,
                        minLines: 1,
                        maxLines: 1,
                        hintText: "* * * * * * * * *",
                        fillColor: AppColors.fill,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.width(value: 10.0)),
                          borderSide: BorderSide.none,
                        ),
                        errBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.width(value: 10.0)),
                          borderSide: const BorderSide(color: AppColors.warning),
                        ),
                      ),
                      AppInputWidgetThree(
                        controller: controller.newPasswordTextEditingController,
                        title: "New Password",
                        isPassWord: true,
                        minLines: 1,
                        maxLines: 1,
                        hintText: "* * * * * * * * *",
                        fillColor: AppColors.fill,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.width(value: 10.0)),
                          borderSide: BorderSide.none,
                        ),
                        errBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.width(value: 10.0)),
                          borderSide: const BorderSide(color: AppColors.warning),
                        ),
                      ),
                      AppInputWidgetThree(
                        controller: controller.confirmPasswordTextEditingController,
                        secondController: controller.newPasswordTextEditingController,
                        title: "Confirm Password",
                        isPassWord: true,
                        minLines: 1,
                        maxLines: 1,
                        hintText: "* * * * * * * * *",
                        fillColor: AppColors.fill,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.width(value: 10.0)),
                          borderSide: BorderSide.none,
                        ),
                        errBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.width(value: 10.0)),
                          borderSide: const BorderSide(color: AppColors.warning),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: GestureDetector(
              onTap: () {
                controller.clickChangePasswordButton();
              },
              child: Container(
                margin: EdgeInsets.all(AppSize.width(value: 10)),
                width: Get.width,
                height: AppSize.height(value: 50),
                alignment: Alignment.center,
                decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(AppSize.width(value: 8.0))),
                child: AppText(
                  data: "Update",
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white50,
                ),
              ),
            ),
          );
        });
  }
}
