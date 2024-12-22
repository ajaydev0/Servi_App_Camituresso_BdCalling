import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/dev_data/dev_list_of_category.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/screens/services_screen/controllers/services_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ServicesScreenController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const AppText(
              data: "Services",
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
          ),
          body: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primary,
                ))
              : controller.categoryList.isEmpty
                  ? const Center(
                      child: AppText(data: "Empty..."),
                    )
                  : Padding(
                      padding: EdgeInsets.all(AppSize.width(value: 10)),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: AppSize.width(value: 10.0),
                            mainAxisSpacing: AppSize.width(value: 10.0)),
                        itemCount: controller.categoryList.length,
                        itemBuilder: (context, index) {
                          var item = controller.categoryList[index];
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.serviceByServiceScreen,
                                  arguments: item.name);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: AppSize.width(value: 100),
                              padding: EdgeInsets.symmetric(
                                  vertical: AppSize.width(value: 8)),
                              decoration: BoxDecoration(
                                  color: AppColors.boxFill,
                                  borderRadius: BorderRadius.circular(
                                      AppSize.width(value: 12))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppImage(
                                    url: "${AppApiUrl.domaine}${item.image}",
                                    height: AppSize.height(value: 40),
                                    width: AppSize.height(value: 40),
                                  ),
                                  const Gap(height: 10),
                                  AppText(
                                    data: item.name ?? "",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
        );
      },
    );
  }
}
