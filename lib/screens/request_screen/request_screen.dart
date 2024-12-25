import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/screens/request_screen/controllers/booking_request_enum.dart';
import 'package:servi_app_camituresso/screens/request_screen/controllers/request_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image_circular.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RequestScreenController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const AppText(
              data: "Booking Request",
              fontWeight: FontWeight.w700,
            ),
          ),
          body: ListView.builder(
            itemCount: controller.listOfRequest.length,
            itemBuilder: (context, index) {
              var item = controller.listOfRequest[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.clientsDetailsScreen);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: AppSize.width(value: 5.0),
                      horizontal: AppSize.width(value: 10.0)),
                  // padding: EdgeInsets.all(AppSize.width(value: 5.0)),
                  decoration: BoxDecoration(
                      color: AppColors.black50,
                      borderRadius:
                          BorderRadius.circular(AppSize.width(value: 10.0))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft:
                                  Radius.circular(AppSize.width(value: 10.0)),
                              bottomLeft:
                                  Radius.circular(AppSize.width(value: 10.0))),
                          child: AppImage(
                            path: item.image,
                            height: AppSize.height(value: 180),
                          ),
                        ),
                      ),
                      Gap(width: 10),
                      Expanded(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Gap(height: 10),
                              AppText(
                                data: item.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                color: AppColors.black700,
                                fontWeight: FontWeight.w600,
                              ),
                              Gap(height: 5),
                              AppText(
                                data: "\$${item.amount}",
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                              Gap(height: 5),
                              Row(
                                children: [
                                  AppImageCircular(
                                    width: AppSize.width(value: 20),
                                    height: AppSize.width(value: 20),
                                    path: item.userImage,
                                  ),
                                  Gap(width: 5),
                                  AppText(
                                    data: item.userName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    color: AppColors.black400,
                                    fontWeight: FontWeight.w400,
                                  )
                                ],
                              ),
                              Gap(height: 20.0),
                              if (item.status == BookingRequestEnum.request)
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(
                                            AppSize.width(value: 5.0)),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.primary),
                                            borderRadius: BorderRadius.circular(
                                                AppSize.width(value: 5.0))),
                                        child: AppText(
                                          data: "Reject",
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ),
                                    Gap(width: 10),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                              AppRoutes.paymentMethodScreen);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(
                                              AppSize.width(value: 5.0)),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.primary),
                                            borderRadius: BorderRadius.circular(
                                                AppSize.width(value: 5.0)),
                                            color: AppColors.primary,
                                          ),
                                          child: AppText(
                                            data: "Accept",
                                            color: AppColors.white50,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Gap(width: 10),
                                  ],
                                ),
                              if (item.status != BookingRequestEnum.request)
                                Center(
                                  child: Container(
                                    alignment: Alignment.center,
                                    constraints: BoxConstraints(
                                        minWidth: AppSize.width(value: 120),
                                        maxWidth: AppSize.width(value: 125),
                                        minHeight: AppSize.width(value: 25)),
                                    decoration: BoxDecoration(
                                      color: item.status ==
                                              BookingRequestEnum.complete
                                          ? AppColors.green.withOpacity(0.45)
                                          : item.status ==
                                                  BookingRequestEnum.pending
                                              ? AppColors.yellow200
                                              : item.status ==
                                                      BookingRequestEnum.reject
                                                  ? AppColors.warning
                                                      .withOpacity(0.5)
                                                  : AppColors.black100,
                                      borderRadius: BorderRadius.circular(
                                        AppSize.width(value: 20.0),
                                      ),
                                    ),
                                    child: AppText(
                                      data: item.status ==
                                              BookingRequestEnum.complete
                                          ? "Completed"
                                          : item.status ==
                                                  BookingRequestEnum.pending
                                              ? "Ongoing"
                                              : item.status ==
                                                      BookingRequestEnum.reject
                                                  ? "Rejected"
                                                  : "Canceled",
                                      color: item.status ==
                                              BookingRequestEnum.complete
                                          ? AppColors.green
                                          : item.status ==
                                                  BookingRequestEnum.pending
                                              ? AppColors.primary
                                              : item.status ==
                                                      BookingRequestEnum.reject
                                                  ? AppColors.warning
                                                  : AppColors.bannerBoxFill,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
