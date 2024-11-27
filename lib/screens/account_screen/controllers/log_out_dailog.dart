import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/services/app_storage/app_auth_storage.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

logOutDialog() {
  Get.dialog(Dialog(
    child: Padding(
      padding: EdgeInsets.all(
        AppSize.width(value: 10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap(height: 10),
          AppText(
            data: "Log out",
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.black900,
          ),
          Gap(height: 30),
          AppText(
            data:
                "Are you sure you want to log out? You'll need to login again to use the app.",
            textAlign: TextAlign.center,
            height: 1.5,
          ),
          Gap(height: 30),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    var context = Get.context;
                    Navigator.pop(context!);
                  },
                  child: Container(
                    margin: EdgeInsets.all(AppSize.width(value: 5)),
                    padding: EdgeInsets.all(AppSize.width(value: 5)),
                    width: Get.width,
                    height: AppSize.height(value: 50),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary),
                        color: AppColors.white50,
                        borderRadius:
                            BorderRadius.circular(AppSize.width(value: 8.0))),
                    child: const AppText(
                      data: "Cancel",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    await AppAuthStorage().storageClear();
                    Get.offAllNamed(AppRoutes.signIn);
                    //Test
                    // print(AppAuthStorage().box.read("name").toString());
                    // print(AppAuthStorage().box.read("email").toString());
                    // print(AppAuthStorage().box.read("password").toString());
                  },
                  child: Container(
                    margin: EdgeInsets.all(AppSize.width(value: 5)),
                    padding: EdgeInsets.all(AppSize.width(value: 5)),
                    width: Get.width,
                    height: AppSize.height(value: 50),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary),
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(
                          AppSize.width(value: 8.0),
                        )),
                    child: AppText(
                      data: "Log out",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white50,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Gap(height: 20),
        ],
      ),
    ),
  ));
}
