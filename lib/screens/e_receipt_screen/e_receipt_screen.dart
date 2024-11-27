import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/screens/e_receipt_screen/controllers/e_receipt_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class EReceiptScreen extends StatelessWidget {
  const EReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: EReceiptScreenController(),
      builder: (controller) {
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
              decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(AppSize.width(value: 8.0))),
              child: AppText(
                data: "Back To Home",
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.white50,
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 20.0)),
                child: AppText(data: "Booking Details", fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Gap(height: 8),
              rowBuild(left: "Booking Date", right: "05-05-2024"),
              rowBuild(left: "Booking Time", right: "10:00 AM"),
              rowBuild(left: "Client Name", right: "Lionel Messi"),
              Gap(height: 8),
              Container(color: AppColors.primary, width: Get.width, height: 1.5),
              Gap(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 20.0)),
                child: AppText(data: "Service Details", fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Gap(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 20.0), vertical: AppSize.width(value: 5.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      data: "Service Status",
                      color: AppColors.black300,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: Get.width * 0.06,
                      padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 10)),
                      decoration: BoxDecoration(color: AppColors.green.withOpacity(0.3), borderRadius: BorderRadius.circular(AppSize.width(value: 10))),
                      child: AppText(
                        data: "Completed",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.green,
                      ),
                    ),
                  ],
                ),
              ),
              rowBuild(left: "Room Clean", right: "\$250"),
              rowBuild(left: "Room Wash", right: "\$50"),
              Gap(height: 8),
              Container(color: AppColors.primary, width: Get.width, height: 1.5),
              Gap(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 20.0), vertical: AppSize.width(value: 5.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      data: "Total",
                      fontWeight: FontWeight.w700,
                      color: AppColors.black700,
                    ),
                    AppText(
                      data: "\$300",
                      fontWeight: FontWeight.w700,
                      color: AppColors.black700,
                    ),
                  ],
                ),
              ),
              Gap(height: 8),
              Container(color: AppColors.primary, width: Get.width, height: 1.5),
              Gap(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 20.0)),
                child: AppText(data: "Payment Method", fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Gap(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 20.0), vertical: AppSize.width(value: 5.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      data: "Mercado Pago",
                      fontWeight: FontWeight.w700,
                      color: Color(0xff00BCFF),
                    ),
                    AppText(
                      data: "\$300",
                      fontWeight: FontWeight.w700,
                      color: AppColors.black700,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Padding rowBuild({required String left, required String right}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 20.0), vertical: AppSize.width(value: 5.0)),
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
