import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/main.dart';
import 'package:servi_app_camituresso/screens/transaction_history_screen/controllers/transaction_history_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/standalone.dart' as tz;


class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: TransactionHistoryScreenController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              forceMaterialTransparency: true,
              title: const AppText(
                data: "Transaction History",
                fontWeight: FontWeight.w600,
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(7),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  width: Get.width,
                  height: 1,
                  color: AppColors.black50,
                ),
              ),
            ),
            body: Visibility(
              visible: !controller.isLoading,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: ListView.builder(
                itemCount:
                    _checkData(data: controller.transactionHistoryModel.data),
                itemBuilder: (context, index) {
                  var item = controller.transactionHistoryModel.data![index];
                  return Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: AppSize.width(value: 8.0),
                        vertical: AppSize.width(value: 5.0)),
                    padding: EdgeInsets.all(AppSize.width(value: 8)),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.black100),
                        borderRadius:
                            BorderRadius.circular(AppSize.width(value: 8.0))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppImage(
                          path: AssetsIconsPath.transactionCard,
                          width: AppSize.width(value: 50),
                        ),
                        Gap(
                          width: AppSize.width(value: 10.0),
                        ),
                        ////////////////  center
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              data: item.payment ?? 'N/A',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(height: 3),
                            const AppText(
                              data: "Transaction ID",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.black200,
                            ),
                            AppText(
                              data: item.txid ?? 'N/A',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ],
                        )),
                        ///////////////////  right side
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AppText(
                              data: "\$ ${item.price ?? 0}",
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                            const Gap(height: 5),
                            AppText(
                              data: _formatDate(controller
                                  .transactionHistoryModel
                                  .data![index]
                                  .updatedAt),
                              fontSize: 12,
                              color: AppColors.black200,
                            ),
                            AppText(
                              data: _convertToLocalTime(controller
                                  .transactionHistoryModel
                                  .data![index]
                                  .updatedAt),
                              fontSize: 12,
                              color: AppColors.black200,
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}

/// Ui logic
_checkData({dynamic data}) {
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
}

_formatDate(dynamic isoDate) {
  // Parse the ISO string to DateTime
  DateTime parsedDate = DateTime.parse(isoDate);

  // Format date to "17 Sep 2023"
  return DateFormat('dd MMM yyyy').format(parsedDate);
}

String _convertToLocalTime(String? isoUtcTime) {
  try {
    // Initialize timezone database
    tz.initializeTimeZones();
    if (isoUtcTime == null) return "";
    // Parse the ISO UTC time
    DateTime utcTime = DateTime.parse(isoUtcTime).toUtc();

    // Get the location for the user's timezone
    tz.Location location = tz.getLocation(userTimezone ?? 'America/Detroit');

    // Convert UTC to the user's local time
    tz.TZDateTime localTime = tz.TZDateTime.from(utcTime, location);

    // Format the local time for display
    String formattedTime = DateFormat('hh:mm a').format(localTime);

    return formattedTime;
  } catch (e) {
    log("convertToLocalTime $e");
    return "";
  }
}
