import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/screens/search_screen/controllers/search_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/inputs/app_input_widget_two.dart';
import 'package:servi_app_camituresso/widgets/services_widgets/services_horizontal_card.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SearchScreenController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            forceMaterialTransparency: true,
            title: const AppText(
                data: "Search", fontWeight: FontWeight.w500, fontSize: 22),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(AppSize.height(value: 50)),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: AppSize.width(value: 10.0)),
                    child: AppInputWidgetTwo(
                      // onChanged: controller.callSearchFunction,
                      filled: true,
                      fillColor: AppColors.yellow50,
                      textInputAction: TextInputAction.search,
                      controller: controller.textEditingController,
                      onFieldSubmitted: (p0) {
                        controller.callFilterFunctionAPI();
                        // controller.searchData();
                      },
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppSize.width(value: 10)),
                        borderSide: const BorderSide(color: AppColors.primary),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: AppSize.width(value: 50),
                          vertical: AppSize.width(value: 6)),
                      prefix: Center(
                        child: AppImage(
                            path: AssetsIconsPath.search,
                            width: AppSize.width(value: 30)),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          controller.callFilterDataFunction();
                        },
                        child: Center(
                          child: AppImage(
                              path: AssetsIconsPath.searchButton,
                              width: AppSize.width(value: 30)),
                        ),
                      ),
                    ),
                  ),
                  const Gap(height: 10)
                ],
              ),
            ),
          ),
          body: Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : controller.postList.isEmpty
                    ? const Center(
                        child: AppText(
                          data: "Empty",
                          fontSize: 25,
                          color: Colors.grey,
                        ),
                      )
                    : ListView.builder(
                        controller: controller.scrollController,
                        itemCount: controller.postList.length +
                            (controller.hasMore.value ? 1 : 0),
                        itemBuilder: (context, index) {
                          // Show loading indicator for pagination if it's the last index and more data is being fetched
                          if (index == controller.postList.length) {
                            if (controller.hasMore.value &&
                                controller.isLoadingMore.value) {
                              return const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            } else {
                              return const SizedBox(); // Placeholder when no more data to load
                            }
                          }

                          // Render message item
                          // var item =
                          //     controller.listOfMessageData[index];
                          return ServicesHorizontalCard(
                            item: controller.postList[index],
                          );
                        },

                        // itemBuilder: (context, index) {
                        //   return
                        // },
                      ),
          ),
        );
      },
    );
  }
}
