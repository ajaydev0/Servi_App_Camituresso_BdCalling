import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/screens/navigation_screen/controllers/navigation_screen_controller.dart';
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(height: AppSize.height(value: 30)),
              Row(
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
              buildRowWidget(),
              ...List.generate(
                50,
                (index) {
                  // var data = controller.notification;
                  return buildRowWidget(isRead: false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRowWidget({bool isRead = true}) {
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
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.blue,
                  ),
                ),
              if (isRead)
                Gap(
                  width: 6.0,
                ),
              AppImageCircular(
                width: AppSize.width(value: 50),
                height: AppSize.width(value: 50),
                color: AppColors.primary,
              ),
              Gap(width: 8.0),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: RichText(
                            text: TextSpan(
                                text: "Ashwin Bose",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.black600,
                                    fontWeight: FontWeight.bold),
                                children: [
                          TextSpan(text: " "),
                          TextSpan(
                            text: "is requesting to book your Services",
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColors.black600,
                                fontWeight: FontWeight.normal),
                          )
                        ]))),
                    Gap(width: 10),
                    AppText(data: "2m"),
                    Gap(
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
