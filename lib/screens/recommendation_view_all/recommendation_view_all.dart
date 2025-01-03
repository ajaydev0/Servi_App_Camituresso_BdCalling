import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/screens/recommendation_view_all/controllers/recommendation_view_all_controller.dart';
import 'package:servi_app_camituresso/widgets/services_widgets/services_horizontal_card_2.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class RecommendationViewAll extends StatelessWidget {
  const RecommendationViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RecommendationViewAllController());
    final ScrollController scrollController = ScrollController();

    // Detect scroll to bottom
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          controller.hasMore.value &&
          !controller.isLoadingMore.value) {
        controller.getRecommendedPostAndInList(isRefresh: false);
      }
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        forceMaterialTransparency: true,
        title: const AppText(
          data: "Recommendations",
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
                    ),
                  )
                : ListView.builder(
                    controller: scrollController,
                    itemCount: controller.postList.length +
                        (controller.hasMore.value ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == controller.postList.length) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        );
                      }

                      var item = controller.postList[index];
                      return ServicesHorizontalCardTwo(
                        item: item,
                        onTap: () {
                          // controller.changeSavedMode(index);
                        },
                      );
                    },
                  ),
      ),
    );
  }
}
