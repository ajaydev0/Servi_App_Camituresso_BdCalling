import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/app_const.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/screens/payment_method_screen/controllers/payment_method_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PaymentMethodScreenController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: AppText(
              data: "Payment Methods",
              fontWeight: FontWeight.w600,
            ),
          ),
          body: Obx(
            () => Column(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.payOnCash.value = true;
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: AppSize.width(value: 20)),
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSize.width(value: 10),
                        vertical: AppSize.width(value: 10.0)),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: controller.payOnCash.value
                                ? AppColors.primary
                                : AppColors.black100,
                            width: 2),
                        borderRadius: BorderRadius.circular(
                          AppSize.width(value: 10),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            AppImage(
                              path: AssetsIconsPath.paymentMethodCard,
                              width: AppSize.width(value: 20),
                              height: AppSize.width(value: 20),
                              iconColor: controller.payOnCash.value
                                  ? AppColors.primary
                                  : AppColors.black100,
                            ),
                            Gap(width: 10),
                            AppText(data: "Cash")
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: AppSize.width(value: 20.0),
                              height: AppSize.width(value: 20.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.payOnCash.value
                                    ? AppColors.primary
                                    : AppColors.white50,
                                border: Border.all(
                                    color: controller.payOnCash.value
                                        ? AppColors.primary
                                        : AppColors.black100,
                                    width: 3),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Gap(
                  height: 20,
                ),
                //////////////////  card

                GestureDetector(
                  onTap: () {
                    controller.payOnCash.value = false;
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: AppSize.width(value: 20)),
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSize.width(value: 10),
                        vertical: AppSize.width(value: 10.0)),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: controller.payOnCash.value
                                ? AppColors.black100
                                : AppColors.primary,
                            width: 2),
                        borderRadius: BorderRadius.circular(
                          AppSize.width(value: 10),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            AppImage(
                              path: AssetsIconsPath.paymentMethodCard,
                              width: AppSize.width(value: 20),
                              height: AppSize.width(value: 20),
                              iconColor: controller.payOnCash.value
                                  ? AppColors.black100
                                  : AppColors.primary,
                            ),
                            Gap(width: 10),
                            AppText(data: "Add new card")
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: AppSize.width(value: 20.0),
                              height: AppSize.width(value: 20.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.payOnCash.value
                                    ? AppColors.white50
                                    : AppColors.primary,
                                border: Border.all(
                                    color: controller.payOnCash.value
                                        ? AppColors.black100
                                        : AppColors.primary,
                                    width: 3),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: GestureDetector(
            onTap: () {
              // Get.back(times: 2);
              Get.toNamed(AppRoutes.paymentWebviewScreen,
                  arguments: AppConst.mercadoPago);
            },
            child: Container(
              margin: EdgeInsets.all(AppSize.width(value: 10)),
              width: Get.width,
              height: AppSize.height(value: 50),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius:
                      BorderRadius.circular(AppSize.width(value: 8.0))),
              child: const AppText(
                data: "Continue",
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.white50,
              ),
            ),
          ),
        );
      },
    );
  }
}
