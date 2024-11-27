import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/screens/list_off_view_services/controllers/list_off_view_services_controller.dart';
import 'package:servi_app_camituresso/widgets/services_widgets/services_horizontal_card.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class ListOfViewServices extends StatelessWidget {
  const ListOfViewServices({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ListOffViewServicesController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            forceMaterialTransparency: true,
            title: AppText(
              data: controller.model?.name ?? "All",
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

                              return ServicesHorizontalCard(
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
