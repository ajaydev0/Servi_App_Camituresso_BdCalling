import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/dev_data/dev_list_of_services_data.dart';
import 'package:servi_app_camituresso/models/dev_services_model/dev_services_model.dart';
import 'package:servi_app_camituresso/screens/search_screen/model/serach_page_post_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class SearchScreenController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  RxList<DevServicesModel> listOfServices = RxList([]);
  RxBool isLoading = false.obs;
  RxBool isLoadingCategory = false.obs;
  List<SearchPagePostModel> postList = <SearchPagePostModel>[].obs;
  /////////////// Pagination
  final ScrollController scrollController = ScrollController();
  RxInt paginationCount = 1.obs;
  RxBool hasMore = true.obs;
  RxBool isLoadingMore = false.obs;
  RxBool isLast = false.obs;

///////////////// Api
  Future<void> getSearchPostAndInList({bool isNew = true}) async {
    try {
      isLoading.value = true;

      var data = await Repository().getSearchPostListDataInit();

      if (data.isNotEmpty) {
        postList = data;
        print("✅ Data fetched successfully: $data");
      } else {
        print("❌ No data fetched or API response was empty.");
      }
      update();
    } catch (e) {
      print("Error in getSearchPostAndInList: $e");
    } finally {
      isLoading.value = false;
    }
  }
  // textFeildOnSubmit(){
  //   if () {

  //   }
  // }

  Future<void> callFilterFunctionAPI({bool isNew = true}) async {
    try {
      isLoading.value = true;
      Map<String, dynamic> quaryParameter = {};
      if (textEditingController.text.isNotEmpty) {
        quaryParameter["search"] = textEditingController.text;
      }
      if (selectedListOfServicesString.value.toLowerCase() !=
              "All".toLowerCase() &&
          selectedListOfServicesString.value.isNotEmpty) {
        quaryParameter["category"] = selectedListOfServicesString.value;
      }
      if (selectedListOfServicesStringRating.value != "All" &&
          selectedListOfServicesStringRating.value != "") {
        quaryParameter["rating"] = selectedListOfServicesStringRating.value;
      }
      if (selectedMinPrice.value != 0.0) {
        quaryParameter["minPrice"] = selectedMinPrice.value;
      }
      if (selectedMaxPrice.value != 0.0) {
        quaryParameter["maxPrice"] = selectedMaxPrice.value;
      }

      // print("😒😒😒😒😒 $selectedListOfServicesString");
      // print("Selected Min Price: ${selectedMinPrice.value}");
      // print("Selected Max Price: ${selectedMaxPrice.value}");
      // print("😒😒😒😒😒 $selectedListOfServicesStringRating");
      // print("✅✅✅✅✅✅✅ ${quaryParameter}");
      var data = await Repository()
          .getSearchPostListDataSearch(queryParameters: quaryParameter);

      if (data.isNotEmpty) {
        postList = data;
        print("✅ Data fetched successfully: $data");
      } else if (data.isEmpty) {
        postList = [];
        // AppSnackBar.error("Nothing to Found Here");

        print("❌ List Is Empty, No data fetched or API response was empty.");
      } else {
        print("❌ No data fetched or API response was empty.");
      }
      update();
    } catch (e) {
      print("Error in getSearchPostAndInList: $e");
    } finally {
      isLoading.value = false;
    }
  }

  callSearchFunction(String value) {
    try {
      var data = devListOfServicedData.where(
        (element) {
          return element.title.toLowerCase().contains(value.toLowerCase());
        },
      ).toList();

      if (data.isNotEmpty) {
        listOfServices.clear();
        listOfServices.addAll(data);
        listOfServices.refresh();
      } else {
        listOfServices.clear();
        listOfServices.refresh();
      }
    } catch (e) {
      log("Error form search screen call function : $e");
    }
  }

  searchData() {
    callSearchFunction(textEditingController.text);
  }

  ////////////////  filtering search
  RxList<String> listOfServicesString = <String>[
    "All",
    // "Electrician",
    // "Plumber",
    // "Pet Services",
    // "Home Services",
    // "Personal Services",
  ].obs;
  getCategoryList() async {
    try {
      isLoadingCategory.value = true;
      var data = await Repository().getCategoryListData();
      if (data.runtimeType != Null) {
        for (var element in data) {
          listOfServicesString.add(element.name ?? "");
        }

        update();
      }
    } catch (e) {
      print(e);
    } finally {
      isLoadingCategory.value = false;
    }
  }

  RxString selectedListOfServicesString = RxString("All");
  changeSelectedListOfServicesString(String value) {
    selectedListOfServicesString.value = value;
    listOfServicesString.refresh();
  }

  RxList<String> listOfServicesStringRating = <String>[
    "All",
    "5",
    "4",
    "3",
    "2",
    "1",
  ].obs;
  RxString selectedListOfServicesStringRating = RxString("All");
  changeSelectedListOfServicesStringRating(String value) {
    selectedListOfServicesStringRating.value = value;
    listOfServicesStringRating.refresh();
  }

  RxDouble minPrice = 1.0.obs;
  RxDouble maxPrice = 1000.0.obs;
  RxDouble selectedMinPrice = 50.0.obs;
  RxDouble selectedMaxPrice = 800.0.obs;
  callFilterDataFunction() {
    Get.bottomSheet(
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 20.0)),
          decoration: BoxDecoration(
              color: AppColors.white50,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.width(value: 20.0)),
                topRight: Radius.circular(AppSize.width(value: 20.0)),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Gap(width: 10),
                  const AppText(
                    data: "Filter",
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  IconButton(
                      color: AppColors.black900,
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close))
                ],
              ),
              Container(color: AppColors.black100, height: 2, width: Get.width),
              const Gap(height: 20),
              const AppText(
                data: "Services",
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              const Gap(height: 20),
              SizedBox(
                width: Get.width,
                height: AppSize.width(value: 40),
                child: Obx(
                  () => isLoadingCategory.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listOfServicesString.length,
                          itemBuilder: (context, index) {
                            bool isActive = selectedListOfServicesString
                                .contains(listOfServicesString[index]);
                            return GestureDetector(
                              onTap: () {
                                changeSelectedListOfServicesString(
                                    listOfServicesString[index]);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding:
                                    EdgeInsets.all(AppSize.width(value: 10.0)),
                                margin: EdgeInsets.symmetric(
                                    horizontal: AppSize.width(value: 5.0)),
                                decoration: BoxDecoration(
                                  color: isActive
                                      ? AppColors.primary
                                      : AppColors.white50,
                                  border: Border.all(
                                      color: AppColors.primary, width: 2),
                                  borderRadius: BorderRadius.circular(
                                    AppSize.width(value: 10.0),
                                  ),
                                ),
                                child: AppText(
                                  data: listOfServicesString[index],
                                  fontWeight: FontWeight.w700,
                                  color: isActive
                                      ? AppColors.white50
                                      : AppColors.primary,
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
              const Gap(height: 20),
              const AppText(
                data: "Price",
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              const Gap(height: 30),
              SizedBox(
                width: Get.width,
                height: AppSize.width(value: 30),
                child: Obx(
                  () => FlutterSlider(
                    min: minPrice.value,
                    max: maxPrice.value,
                    rangeSlider: true,
                    trackBar: FlutterSliderTrackBar(
                      inactiveTrackBarHeight: 12,
                      activeTrackBarHeight: 16,
                      inactiveTrackBar: BoxDecoration(
                        color: AppColors.bannerBoxFill,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      activeTrackBar: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    handlerHeight: 100,
                    handlerWidth: 20,
                    tooltip: FlutterSliderTooltip(
                      alwaysShowTooltip: true,
                      direction: FlutterSliderTooltipDirection.top,
                      positionOffset:
                          FlutterSliderTooltipPositionOffset(top: -25),
                      boxStyle: const FlutterSliderTooltipBox(
                          decoration: BoxDecoration(color: Colors.transparent)),
                      textStyle: const TextStyle(
                          color: AppColors.black400,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      format: (value) {
                        return "\$$value";
                      },
                    ),
                    handler: FlutterSliderHandler(
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.black500),
                      ),
                    ),
                    rightHandler: FlutterSliderHandler(
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.black500),
                      ),
                    ),
                    values: [selectedMinPrice.value, selectedMaxPrice.value],
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      // Update the selected price range dynamically
                      selectedMinPrice.value = lowerValue;
                      selectedMaxPrice.value = upperValue;
                    },
                  ),
                ),
              ),
              const Gap(height: 20),
              const AppText(
                data: "Rating",
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              const Gap(height: 20),
              SizedBox(
                width: Get.width,
                height: AppSize.width(value: 40),
                child: Obx(
                  () => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listOfServicesStringRating.length,
                    itemBuilder: (context, index) {
                      bool isActive = selectedListOfServicesStringRating
                          .contains(listOfServicesStringRating[index]);
                      return GestureDetector(
                        onTap: () {
                          changeSelectedListOfServicesStringRating(
                              listOfServicesStringRating[index]);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(AppSize.width(value: 10.0)),
                          margin: EdgeInsets.symmetric(
                              horizontal: AppSize.width(value: 5.0)),
                          decoration: BoxDecoration(
                            color: isActive
                                ? AppColors.primary
                                : AppColors.white50,
                            border:
                                Border.all(color: AppColors.primary, width: 2),
                            borderRadius: BorderRadius.circular(
                              AppSize.width(value: 10.0),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppImage(
                                path: AssetsIconsPath.star,
                                width: AppSize.width(value: 20),
                                height: AppSize.width(value: 20),
                              ),
                              const Gap(width: 8),
                              AppText(
                                data: listOfServicesStringRating[index],
                                fontWeight: FontWeight.w700,
                                color: isActive
                                    ? AppColors.white50
                                    : AppColors.primary,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Gap(height: 60),
              Container(color: AppColors.black100, height: 2, width: Get.width),
              const Gap(height: 30),
              Align(
                child: GestureDetector(
                  onTap: () {
                    callFilterFunctionAPI();
                    // Get.back();
                    // print("😒😒😒😒😒 $selectedListOfServicesString");
                    // print("Selected Min Price: ${selectedMinPrice.value}");
                    // print("Selected Max Price: ${selectedMaxPrice.value}");
                    // print("😒😒😒😒😒 $selectedListOfServicesStringRating");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: AppSize.width(value: 10.0),
                        horizontal: AppSize.width(value: 30.0)),
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius:
                            BorderRadius.circular(AppSize.width(value: 10))),
                    child: const AppText(
                      data: "Apply Filter",
                      color: AppColors.white50,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const Gap(height: 50),
            ],
          ),
        ),
        isScrollControlled: true);
  }

  @override
  void onInit() {
    getSearchPostAndInList(isNew: false);
    getCategoryList();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          !isLoadingMore.value &&
          hasMore.value) {
        // addNewMessageItems();
        getSearchPostAndInList();
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    textEditingController.dispose();
  }
}
