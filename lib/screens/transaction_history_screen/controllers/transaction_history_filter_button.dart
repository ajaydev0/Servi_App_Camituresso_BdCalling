import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/screens/transaction_history_screen/controllers/transaction_history_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';

import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

transactionHistoryFilterButton(TransactionHistoryScreenController controller) {
  Get.dialog(
    Dialog(
      backgroundColor: AppColors.white50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.width(value: 10.0)),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSize.width(value: 10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(data: "Filters"),
                GestureDetector(
                    onTap: () {
                      controller.clickClearButton();
                    },
                    child: AppText(data: "Clear")),
              ],
            ),
            Gap(height: 5),
            Container(
              width: Get.width,
              color: AppColors.black100,
              height: 1,
            ),
            Gap(height: 5),
            AppText(
              data: "Period",
              fontWeight: FontWeight.w600,
            ),
            Obx(
              () => Wrap(
                children: List.generate(
                  controller.listOfPeriod.length,
                  (index) {
                    var item = controller.listOfPeriod[index];
                    bool isActive = controller.selectedPeriod.contains(item);
                    return GestureDetector(
                      onTap: () {
                        controller.clickPeriod(item);
                      },
                      child: Container(
                        margin: EdgeInsets.all(AppSize.width(value: 5)),
                        decoration: BoxDecoration(
                            color: isActive ? AppColors.selectedBoxFill.withOpacity(0.5) : AppColors.white50,
                            border: Border.all(color: AppColors.selectedBoxFill.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(AppSize.width(value: 5.0))),
                        padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 10), vertical: AppSize.width(value: 5)),
                        child: AppText(data: item),
                      ),
                    );
                  },
                ),
              ),
            ),
            Gap(height: 5),
            AppText(
              data: "Select period",
              fontWeight: FontWeight.w600,
            ),
            Gap(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    controller.toDatePickFunction();
                  },
                  child: Container(
                    margin: EdgeInsets.all(AppSize.width(value: 5)),
                    decoration:
                        BoxDecoration(color: AppColors.white50, border: Border.all(color: AppColors.selectedBoxFill.withOpacity(0.5)), borderRadius: BorderRadius.circular(AppSize.width(value: 5.0))),
                    padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 10), vertical: AppSize.width(value: 5)),
                    child: Obx(
                      () => Row(
                        children: [
                          AppImage(
                            width: AppSize.width(value: 20),
                            height: AppSize.width(value: 20),
                            path: AssetsIconsPath.request,
                            iconColor: AppColors.selectedBoxFill,
                          ),
                          Gap(width: 5),
                          AppText(
                            data: controller.toFormateDate.value,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
                Gap(width: 5),
                AppText(data: "-"),
                Gap(width: 5),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    controller.formDatePickFunction();
                  },
                  child: Container(
                    margin: EdgeInsets.all(AppSize.width(value: 5)),
                    decoration:
                        BoxDecoration(color: AppColors.white50, border: Border.all(color: AppColors.selectedBoxFill.withOpacity(0.5)), borderRadius: BorderRadius.circular(AppSize.width(value: 5.0))),
                    padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 10), vertical: AppSize.width(value: 5)),
                    child: Obx(
                      () => Row(
                        children: [
                          AppImage(
                            width: AppSize.width(value: 20),
                            height: AppSize.width(value: 20),
                            path: AssetsIconsPath.request,
                            iconColor: AppColors.selectedBoxFill,
                          ),
                          Gap(width: 5),
                          AppText(
                            data: controller.formFormateDate.value,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
              ],
            ),
            Gap(height: 5),
            AppText(
              data: "Status",
              fontWeight: FontWeight.w600,
            ),
            Gap(height: 5),
            Obx(
              () => Wrap(
                children: List.generate(
                  controller.listOfStatus.length,
                  (index) {
                    var item = controller.listOfStatus[index];
                    bool isActive = controller.selectedStatus.contains(item);
                    return GestureDetector(
                      onTap: () {
                        controller.clickStatus(item);
                      },
                      child: Container(
                        margin: EdgeInsets.all(AppSize.width(value: 5)),
                        decoration: BoxDecoration(
                            color: isActive ? AppColors.selectedBoxFill.withOpacity(0.5) : AppColors.white50,
                            border: Border.all(color: AppColors.selectedBoxFill.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(AppSize.width(value: 5.0))),
                        padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 6), vertical: AppSize.width(value: 5)),
                        child: AppText(data: item),
                      ),
                    );
                  },
                ),
              ),
            ),
            Gap(height: 30),
            Align(
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: AppSize.height(value: 20.0), vertical: AppSize.height(value: 12.0)),
                  padding: EdgeInsets.all(AppSize.width(value: 13)),
                  decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(AppSize.height(value: 12.0))),
                  child: AppText(
                    data: "Show results",
                    color: AppColors.white50,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Gap(height: 10),
          ],
        ),
      ),
    ),
  );
}
