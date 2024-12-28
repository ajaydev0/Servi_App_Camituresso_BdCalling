import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/screens/navigation_screen/controllers/navigation_screen_controller.dart';
import 'package:servi_app_camituresso/screens/navigation_screen/model/notification_screen_model.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image_circular.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    NavigationScreenController controller =
        Get.find<NavigationScreenController>();
    return SafeArea(
      top: false,
      child: Container(
        color: AppColors.white50,
        height: Get.height,
        child: Column(
          children: [
            Gap(height: AppSize.height(value: 30)),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButton(),
                AppText(
                  data: "Notifications",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                Gap(width: 20)
              ],
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                    itemCount:
                        _checkData(data: controller.notificationListData.value),
                    itemBuilder: (context, index) {
                      return buildRowWidget(
                          isRead: controller.notificationListData[index].read ??
                              false,
                          data: controller.notificationListData[index]
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildRowWidget({bool isRead = true, required Notifications data}) {
    return Column(
      children: [
        Container(
          color: isRead ? AppColors.read : AppColors.white50,
          padding: EdgeInsets.symmetric(
              vertical: AppSize.width(value: 20),
              horizontal: AppSize.width(value: 10.0)),
          child: Row(
            children: [
              if (isRead)
                Container(
                  width: AppSize.width(value: 10.0),
                  height: AppSize.width(value: 10.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.blue,
                  ),
                ),
              if (isRead)
                const Gap(
                  width: 6.0,
                ),
              AppImageCircular(
                url: AppApiUrl.profileImage(url: data.sender!.profile!),
                width: AppSize.width(value: 50),
                height: AppSize.width(value: 50),
                fit: BoxFit.cover,
                color: AppColors.primary,
              ),
              const Gap(width: 8.0),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: RichText(
                            text: TextSpan(
                                text: data.sender?.name ?? 'N/A',
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: AppColors.black600,
                                    fontWeight: FontWeight.bold),
                                children: [
                          const TextSpan(text: " "),
                          TextSpan(
                            text: data.text,
                            style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.black600,
                                fontWeight: FontWeight.normal),
                          )
                        ]))),
                    const Gap(width: 10),
                    const AppText(data: "2m"),
                    const Gap(
                      width: 4.0,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

/// Ui logic
int _checkData({dynamic data}) {
  try {
    if (data != null) {
      if (data.isNotEmpty) {
        return data.length;
      }
    } else {
      return 0;
    }
  } catch (e) {
    log("error form checkData method : $e");
    return 0;
  }
  return 0;
}
