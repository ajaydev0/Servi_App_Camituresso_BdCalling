import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/screens/navigation_screen/model/notification_screen_model.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image_circular.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class NotificationCard extends StatelessWidget {
  final bool isRead;
  final Notifications data;
  const NotificationCard({super.key, required this.isRead, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: !isRead ? AppColors.read : AppColors.white50,
          padding: EdgeInsets.symmetric(
              vertical: AppSize.width(value: 20),
              horizontal: AppSize.width(value: 10.0)),
          child: Row(
            children: [
              if (!isRead)
                Container(
                  width: AppSize.width(value: 10.0),
                  height: AppSize.width(value: 10.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.blue,
                  ),
                ),
              if (!isRead)
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
                    AppText(data: formatTimeFromUTC(data.createdAt.toString())),
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

/// formate date and time

String formatTimeFromUTC(String utcTime) {
  // Parse the UTC time string into a DateTime object.
  DateTime parsedDate = DateTime.parse(utcTime);

  // Convert UTC to local time
  DateTime localDateTime = parsedDate.toLocal();

  // Format the time as "hh:mm a" (12-hour format with AM/PM)
  // return DateFormat('hh:mm a').format(localDateTime);
  return timeTextFormat(localDateTime.toIso8601String());
}

/// notification time conversion

String timeTextFormat(String? formattedString) {
  try {
    if (formattedString == null) return "";
    DateTime dateTime = DateTime.parse(formattedString);
    final DateTime now = DateTime.now();
    final Duration difference = now.difference(dateTime);

    if (difference.inDays == 0) {
      // If the date is today, return the time in hh:mm a format
      int hour = dateTime.hour;
      int minute = dateTime.minute;
      String period = hour >= 12 ? 'pm' : 'am';

      if (hour > 12) {
        hour -= 12;
      } else if (hour == 0) {
        hour = 12;
      }

      final String minuteStr = minute < 10 ? '0$minute' : '$minute';
      return '$hour:$minuteStr $period';
    } else if (difference.inDays == 1) {
      return '1 day';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days';
    } else if (difference.inDays < 30) {
      return '${difference.inDays / 7} week${difference.inDays / 7 > 1 ? 's' : ''}';
    } else if (difference.inDays < 365) {
      return '${difference.inDays / 30} month${difference.inDays / 30 > 1 ? 's' : ''}';
    } else {
      return '${difference.inDays / 365} year${difference.inDays / 365 > 1 ? 's' : ''} ';
    }
  } catch (e) {
    log("timeTextFormate $e");
    return "";
  }
}

