import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/screens/transaction_history_screen/controllers/transaction_history_filter_button.dart';
import 'package:servi_app_camituresso/screens/transaction_history_screen/controllers/transaction_history_screen_controller.dart';
import 'package:servi_app_camituresso/screens/transaction_history_screen/controllers/transaction_status_enum.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';
import 'package:servi_app_camituresso/widgets/texts/time_date_format.dart';
import 'package:servi_app_camituresso/widgets/texts/time_text_format.dart';

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
              title: AppText(
                data: "Change Password",
                fontWeight: FontWeight.w600,
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(7),
                child: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  width: Get.width,
                  height: 1,
                  color: AppColors.black50,
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    transactionHistoryFilterButton(controller);
                  },
                  child: AppImage(
                    height: AppSize.width(value: 35),
                    path: AssetsIconsPath.searchButton,
                  ),
                ),
                Gap(
                  width: 20,
                )
              ],
            ),
            body: ListView.builder(
              itemCount: controller.listOfData.length,
              itemBuilder: (context, index) {
                var item = controller.listOfData[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: AppSize.width(value: 8.0), vertical: AppSize.width(value: 5.0)),
                  padding: EdgeInsets.all(AppSize.width(value: 8)),
                  decoration: BoxDecoration(border: Border.all(color: AppColors.black100), borderRadius: BorderRadius.circular(AppSize.width(value: 8.0))),
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
                            data: item.to,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                          ),
                          AppText(
                            data: "From ${item.form}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: 3),
                          AppText(
                            data: "Transaction ID",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.black200,
                          ),
                          AppText(
                            data: item.transactionId,
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
                            data: "\$ ${item.transactionAmount}",
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 6.0)),
                            margin: EdgeInsets.symmetric(vertical: AppSize.width(value: 5.0)),
                            decoration: BoxDecoration(
                              color: item.status == TransactionStatusEnum.confirm
                                  ? AppColors.green.withOpacity(0.2)
                                  : item.status == TransactionStatusEnum.pending
                                      ? Color(0xffEA00FF).withOpacity(0.2)
                                      : AppColors.warning.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(AppSize.width(value: 8.0)),
                            ),
                            child: AppText(
                              data: item.status == TransactionStatusEnum.confirm
                                  ? "Confirm"
                                  : item.status == TransactionStatusEnum.pending
                                      ? "Pending"
                                      : "Cancel",
                              color: item.status == TransactionStatusEnum.confirm
                                  ? AppColors.green
                                  : item.status == TransactionStatusEnum.pending
                                      ? Color(0xffA340DD)
                                      : AppColors.warning,
                            ),
                          ),
                          Gap(height: 5),
                          AppText(
                            data: timeDateFormate(item.time),
                            fontSize: 12,
                            color: AppColors.black200,
                          ),
                          AppText(
                            data: timeTextFormate(item.time),
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
          );
        });
  }
}
