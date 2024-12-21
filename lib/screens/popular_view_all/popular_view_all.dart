import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/screens/popular_view_all/controllers/popular_view_all_controller.dart';
import 'package:servi_app_camituresso/widgets/services_widgets/services_horizontal_card_2.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class PopularViewAll extends StatelessWidget {
  const PopularViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PopularViewAllController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            forceMaterialTransparency: true,
            title: const AppText(
              data: "Popular ",
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
          ),
          body: Obx(
            () => controller.isError.value
                ? const Center(
                    child: AppText(data: "Error"),
                  )
                : controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ))
                    : controller.postList.isEmpty
                        ? const Center(
                            child: AppText(data: "Empty..."),
                          )
                        : ListView.builder(
                            reverse: false,
                            itemCount: controller.postList.length,
                            itemBuilder: (context, index) {
                              var item = controller.postList[index];

                              return ServicesHorizontalCardTwo(
                                item: item,
                                onTap: () {
                                  controller.changeSavedMode(index);
                                },
                              );
                            },
                          ),
          ),
        );
      },
    );
  }
}
