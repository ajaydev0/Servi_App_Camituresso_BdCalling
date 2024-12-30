import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/screens/e_receipt_screen/controllers/e_receipt_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

import 'controllers/e_receipt_details_controller.dart';

class EReceiptScreen extends StatelessWidget {
  final EReceiptDetailController controller =
      Get.put(EReceiptDetailController());
  EReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppText(
          data: "E-Receipt",
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.back(times: 2);
        },
        child: Container(
          margin: EdgeInsets.all(AppSize.width(value: 10)),
          width: Get.width,
          height: AppSize.height(value: 50),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(AppSize.width(value: 8.0))),
          child: AppText(
            data: "Back To Home",
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.white50,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.isError.value) {
          return const Center(child: Text("Error loading data"));
        } else {
          final item = controller.detail;
          final date = controller.getFormattedDate(item.createdAt);
          final time = controller.getFormattedTime(item.createdAt);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width(value: 20.0)),
                child: const AppText(
                    data: "Booking Details",
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
              const Gap(height: 8),
              rowBuild(left: "Booking Date", right: date),
              rowBuild(left: "Booking Time", right: time),
              rowBuild(left: "Client Name", right: item.user.name),
              const Gap(height: 8),
              Container(
                  color: AppColors.primary, width: Get.width, height: 1.5),
              const Gap(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width(value: 20.0)),
                child: const AppText(
                    data: "Service Details",
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
              const Gap(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width(value: 20.0),
                    vertical: AppSize.width(value: 5.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppText(
                      data: "Service Status",
                      color: AppColors.black300,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: Get.width * 0.06,
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.width(value: 10)),
                      decoration: BoxDecoration(
                          color: AppColors.green.withOpacity(0.3),
                          borderRadius:
                              BorderRadius.circular(AppSize.width(value: 10))),
                      child: AppText(
                        data: item.status,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.green,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width(value: 20.0),
                    vertical: AppSize.width(value: 5.0)),
                child: AppText(
                  data: item.service.priceBreakdown,
                  maxLines: null,
                  overflow: TextOverflow.visible,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black500,
                ),
              ),
              // rowBuild(left: item.service.priceBreakdown, right: "\$250"),
              // rowBuild(left: "Room Wash", right: "\$50"),
              const Gap(height: 8),
              Container(
                  color: AppColors.primary, width: Get.width, height: 1.5),
              const Gap(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width(value: 20.0),
                    vertical: AppSize.width(value: 5.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppText(
                      data: "Total",
                      fontWeight: FontWeight.w700,
                      color: AppColors.black700,
                    ),
                    AppText(
                      data: "\$${item.service.price.toString()}",
                      fontWeight: FontWeight.w700,
                      color: AppColors.black700,
                    ),
                  ],
                ),
              ),
              const Gap(height: 8),
              Container(
                  color: AppColors.primary, width: Get.width, height: 1.5),
              const Gap(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width(value: 20.0)),
                child: const AppText(
                    data: "Payment Method",
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
              const Gap(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width(value: 20.0),
                    vertical: AppSize.width(value: 5.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppText(
                      data: "Mercado Pago",
                      fontWeight: FontWeight.w700,
                      color: Color(0xff00BCFF),
                    ),
                    AppText(
                      data: "\$${item.service.price.toString()}",
                      fontWeight: FontWeight.w700,
                      color: AppColors.black700,
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      }),
    );
  }

  Padding rowBuild({required String left, required String right}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.width(value: 20.0),
          vertical: AppSize.width(value: 5.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            data: left,
            color: AppColors.black300,
          ),
          AppText(
            data: right,
            color: AppColors.black500,
          ),
        ],
      ),
    );
  }
}
