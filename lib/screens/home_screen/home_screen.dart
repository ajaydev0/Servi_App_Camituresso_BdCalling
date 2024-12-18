import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/dev_data/dev_list_of_category.dart';
import 'package:servi_app_camituresso/models/dev_category/dev_category_model.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/screens/home_screen/controllers/home_screen_controller.dart';
import 'package:servi_app_camituresso/screens/home_screen/widgets/home_screen_card.dart';
import 'package:servi_app_camituresso/screens/home_screen/widgets/home_screen_item_and_build_function.dart';
import 'package:servi_app_camituresso/screens/home_screen/widgets/home_screen_top_widget.dart';
import 'package:servi_app_camituresso/screens/navigation_screen/controllers/navigation_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.navigationScreenController,
  });
  final NavigationScreenController navigationScreenController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeScreenController(),
      builder: (controller) {
        return RefreshIndicator(
          onRefresh: () async {
            await controller.getProfileData();
          },
          child: CustomScrollView(
            slivers: [
              ////////////////  top bar
              SliverToBoxAdapter(
                child: HomeScreenTopWidget(
                  navigationScreenController: navigationScreenController,
                  controller: controller,
                ),
              ),
              if (controller.listOfBanner.isNotEmpty)
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: AppSize.width(value: 10)),
                    width: Get.width,
                    height: AppSize.height(value: 200),
                    child: PageView.builder(
                      controller: controller.listOfBannerPageViewController,
                      itemCount: controller.listOfBanner.length,
                      onPageChanged: controller.onChangeListOfBanner,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSize.width(value: 10)),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(AppSize.width(value: 10)),
                            child: AppImage(
                              fit: BoxFit.fill,
                              path: controller.listOfBanner[index],
                              width: Get.width,
                              // height: AppSize.height(value: 180),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

              if (controller.listOfBanner.isNotEmpty)
                SliverToBoxAdapter(
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.listOfBanner.length,
                        (index) {
                          bool isActive = index ==
                              controller.selectedListOfBannerIndex.value;
                          return AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            margin: EdgeInsets.symmetric(
                                horizontal: AppSize.width(value: 4.2)),
                            width: isActive
                                ? AppSize.width(value: 30)
                                : AppSize.width(value: 10),
                            height: AppSize.width(value: 8),
                            decoration: BoxDecoration(
                                color: isActive
                                    ? AppColors.primary
                                    : AppColors.bannerBoxFill,
                                borderRadius: BorderRadius.circular(
                                    AppSize.width(value: 10))),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              //////////////////  category
              itemTitleOption(
                name: "Services",
                onTapCall: () {
                  Get.toNamed(AppRoutes.servicesScreen);
                },
              ),
              itemBuildFunction(
                dividedValue: 4,
                padding:
                    EdgeInsets.symmetric(horizontal: AppSize.width(value: 8)),
                items: List.generate(
                  devCategoryData.length,
                  (index) {
                    var item = devCategoryData[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.listOfViewServicesScreen,
                            arguments: item);
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
                              path: item.imagePath,
                              height: AppSize.height(value: 40),
                              width: AppSize.height(value: 40),
                            ),
                            Gap(height: 10),
                            AppText(
                              data: item.name,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              ////////////////// popular
              itemTitleOption(
                name: "Popular",
                onTapCall: () {
                  Get.toNamed(
                    AppRoutes.popularViewAllScreen,
                  );
                },
              ),

              itemBuildFunction(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSize.width(value: 8)),
                items: List.generate(
                  controller.popularListOfData.length,
                  (index) {
                    var item = controller.popularListOfData[index];
                    return HomeScreenCard(
                      item: item,
                    );
                  },
                ),
              ),

              ////////////////// Recommendation
              itemTitleOption(
                name: "Recommendation",
                onTapCall: () {
                  Get.toNamed(AppRoutes.listOfViewServicesScreen,
                      arguments: DevCategoryModel(
                          name: "Recommendation", imagePath: "", id: "id10"));
                },
              ),

              itemBuildFunction(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSize.width(value: 8)),
                items: List.generate(
                  controller.reCommendationListOfData.length,
                  (index) {
                    var item = controller.reCommendationListOfData[index];
                    return HomeScreenCard(
                      item: item,
                    );
                  },
                ),
              ),

              SliverToBoxAdapter(
                child: Gap(height: 50),
              )
            ],
          ),
        );
      },
    );
  }
}
