import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/screens/navigation_screen/controllers/navigation_screen_controller.dart';
import 'package:servi_app_camituresso/screens/navigation_screen/model/notification_screen_model.dart';
import 'package:servi_app_camituresso/screens/navigation_screen/widgets/notification_card.dart';
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
    return Scaffold(
      body: SafeArea(
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
                  () => Visibility(
                      visible: !controller.isLoading.value,
                      replacement: const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                      child: ListView.builder(
                          controller: controller.scrollController,
                          itemCount: _checkData(
                              data: controller.notificationListData.value),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                var updatedList = controller.notificationListData.toList(); // Create a copy
                                updatedList[index].read = true;
                                controller.notificationListData.value = updatedList;
                              },
                              child: NotificationCard(
                                  isRead:
                                      controller.notificationListData[index].read ??
                                          false,
                                  data: controller.notificationListData[index]),
                            );
                          },),),
                ),
              )
            ],
          ),
        ),
      ),
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
// String formatTimeFromUTC(String utcTime) {
//   // Parse the UTC time string into a DateTime object.
//   DateTime parsedDate = DateTime.parse(utcTime);
//
//   // Convert UTC to local time
//   DateTime localDateTime = parsedDate.toLocal();
//
//   // Format the time as "hh:mm a" (12-hour format with AM/PM)
//   // return DateFormat('hh:mm a').format(localDateTime);
//   return timeTextFormat(localDateTime.toIso8601String());
// }
//
// /// notification time conversion
//
// String timeTextFormat(String? formattedString) {
//   try {
//     if (formattedString == null) return "";
//     DateTime dateTime = DateTime.parse(formattedString);
//     final DateTime now = DateTime.now();
//     final Duration difference = now.difference(dateTime);
//
//     if (difference.inDays == 0) {
//       // If the date is today, return the time in hh:mm a format
//       int hour = dateTime.hour;
//       int minute = dateTime.minute;
//       String period = hour >= 12 ? 'pm' : 'am';
//
//       if (hour > 12) {
//         hour -= 12;
//       } else if (hour == 0) {
//         hour = 12;
//       }
//
//       final String minuteStr = minute < 10 ? '0$minute' : '$minute';
//       return '$hour:$minuteStr $period';
//     } else if (difference.inDays == 1) {
//       return '1 day';
//     } else if (difference.inDays < 7) {
//       return '${difference.inDays} days';
//     } else if (difference.inDays < 30) {
//       return '${difference.inDays / 7} week${difference.inDays / 7 > 1 ? 's' : ''}';
//     } else if (difference.inDays < 365) {
//       return '${difference.inDays / 30} month${difference.inDays / 30 > 1 ? 's' : ''}';
//     } else {
//       return '${difference.inDays / 365} year${difference.inDays / 365 > 1 ? 's' : ''} ';
//     }
//   } catch (e) {
//     log("timeTextFormate $e");
//     return "";
//   }
// }
