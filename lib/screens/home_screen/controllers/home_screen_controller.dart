import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/dev_data/dev_list_of_services_data.dart';
import 'package:servi_app_camituresso/models/dev_services_model/dev_services_model.dart';
import 'package:servi_app_camituresso/screens/home_screen/model/bannar_model.dart';
import 'package:servi_app_camituresso/screens/popular_view_all/model/get_popular_post_model.dart';
import 'package:servi_app_camituresso/screens/profile_screen/models/profile_screen_model.dart';
import 'package:servi_app_camituresso/screens/recommendation_view_all/model/get_recommended_post_model.dart';
import 'package:servi_app_camituresso/screens/services_screen/model/category_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class HomeScreenController extends GetxController {
  RxBool isLoading = true.obs;

  /////////////////////// banner
  Isolate? bannerIsolate;
  RxInt selectedListOfBannerIndex = RxInt(0);
  late PageController listOfBannerPageViewController;
  // RxList<String> listOfBanner = RxList([
  //   "assets/dev_images/banner1.png",
  //   "assets/dev_images/banner2.png",
  //   "assets/dev_images/banner3.png",
  // ]);
  bool isForwardDirection = true;
  onChangeListOfBanner(int index) {
    try {
      selectedListOfBannerIndex.value = index;
      listOfBannerPageViewController.animateToPage(
          selectedListOfBannerIndex.value,
          duration: const Duration(seconds: 1),
          curve: Curves.ease);
    } catch (e) {
      log("error form on change banner Screen $e");
    }
  }

  changeListOfBanner() {
    try {
      if (isForwardDirection) {
        selectedListOfBannerIndex.value++;
        if (selectedListOfBannerIndex.value >= bannarList.length - 1) {
          isForwardDirection = false;
        }
      } else {
        selectedListOfBannerIndex.value--;
        if (selectedListOfBannerIndex.value <= 0) {
          isForwardDirection = true;
        }
      }

      if (selectedListOfBannerIndex.value >= 0 &&
          selectedListOfBannerIndex.value < bannarList.length) {
        listOfBannerPageViewController.animateToPage(
          selectedListOfBannerIndex.value,
          duration: const Duration(seconds: 1),
          curve: Curves.ease,
        );
      }
    } catch (e) {
      log("Error from change banner page function: $e");
    }
  }

  onListOfBannerSetUp() async {
    try {
      final response = ReceivePort();
      bannerIsolate = await Isolate.spawn(_bannerEntryPoint, response.sendPort);
      response.listen((message) {
        if (message == "message") {
          changeListOfBanner();
        }
      });
    } catch (e) {
      log("Error from banner setup function: $e");
    }
  }

  killDartIsolate() {
    bannerIsolate?.kill();
  }

  _bannerEntryPoint(SendPort sendPort) {
    Timer.periodic(
      const Duration(seconds: 4),
      (timer) {
        sendPort.send("message");
      },
    );
  }
///////////////////////// home screen data

  RxList<DevServicesModel> popularListOfData = <DevServicesModel>[].obs;
  RxList<DevServicesModel> reCommendationListOfData = <DevServicesModel>[].obs;

  onInitialDataLoad() {
    try {
      for (var element in devListOfServicedData) {
        if (element.category == "id1") {
          popularListOfData.add(element);
        }
      }
      for (var element in devListOfServicedData) {
        if (element.category == "id10") {
          reCommendationListOfData.add(element);
        }
      }

      popularListOfData.refresh();
      reCommendationListOfData.refresh();
    } catch (e) {
      print(e);
    }
  }

  ProfileModel profileData = ProfileModel();
  getProfileData() async {
    try {
      isLoading.value = true;
      var data = await Repository().getProfileData();
      if (data != null) {
        profileData = data;
        update();
      }
    } catch (e) {
      print("Error fetching profile: $e");
    } finally {
      isLoading.value = false;
    }
  }

  ////////////////////// Get Bannar List
  RxBool isLoadingBannar = false.obs;
  // List<dynamic> bannarList = [].obs;
  List<BannarModel> bannarList = <BannarModel>[];
  getBannarList() async {
    try {
      isLoadingBannar.value = true;
      var repoResponse = await Repository().getBannarListData();

      bannarList = repoResponse;
      update();
    } catch (e) {
      print(e);
    } finally {
      isLoadingBannar.value = false;
    }
  }

  ////////////////////// Service Category Get
  RxBool isLoadingCategory = false.obs;
  List<dynamic> categoryList = [].obs;
  getCategoryList() async {
    try {
      isLoadingCategory.value = true;
      var data = await Repository().getCategoryListData();
      if (data != null) {
        for (var element in data) {
          categoryList.add(CategoryModel.fromJson(element));
          update();
        }
      }
    } catch (e) {
      print(e);
    } finally {
      isLoadingCategory.value = false;
    }
  }

  ///////////////////////// Popular Post List
  RxBool isLoadingPopular = false.obs;
  List<dynamic> popularPostList = [].obs;
  getPopularPostList() async {
    try {
      isLoadingPopular.value = true;
      var data = await Repository().getPopularPostData();
      if (data != null) {
        for (var element in data) {
          popularPostList.add(PopularPostModel.fromJson(element));
          update();
        }
      }
    } catch (e) {
      print(e);
    } finally {
      isLoadingPopular.value = false;
    }
  }

  ///////////////////////// Recoommended Post List
  RxBool isLoadingRecommended = false.obs;
  List<dynamic> recommendedPostList = [].obs;
  getRecommendedPostList() async {
    try {
      isLoadingRecommended.value = true;
      var data = await Repository().getRecommendationrPostData();
      if (data != null) {
        for (var element in data) {
          recommendedPostList.add(RecommendedPostModel.fromJson(element));
          update();
        }
      }
    } catch (e) {
      print(e);
    } finally {
      isLoadingRecommended.value = false;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    listOfBannerPageViewController = PageController(
      initialPage: selectedListOfBannerIndex.value,
    );
    onListOfBannerSetUp();
    onInitialDataLoad();
    // Get Profile Data
    getProfileData();
    // Bannar
    getBannarList();
    // Get Service Category List
    getCategoryList();
    // Get Popular Post List
    getPopularPostList();
    // Get Recommended Post List
    getRecommendedPostList();
  }

  @override
  void onClose() {
    super.onClose();
    killDartIsolate();
  }
}
