import 'dart:async';
import 'dart:developer';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/screens/home_screen/model/bannar_model.dart';
import 'package:servi_app_camituresso/screens/popular_view_all/model/get_popular_post_model.dart';
import 'package:servi_app_camituresso/screens/profile_screen/models/profile_screen_model.dart';
import 'package:servi_app_camituresso/screens/recommendation_view_all/model/get_recommended_post_model.dart';
import 'package:servi_app_camituresso/services/app_storage/app_auth_storage.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class HomeScreenController extends GetxController {
  RxBool isLoading = true.obs;

  /////////////////////// banner
  Isolate? bannerIsolate;
  RxInt selectedListOfBannerIndex = RxInt(0);
  late PageController listOfBannerPageViewController;

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

  /// Profile Data Get
  ProfileModel profileData = ProfileModel();
  getProfileData() async {
    try {
      isLoading.value = true;
      var data = await Repository().getProfileData();
      if (data != null) {
        profileData = data;
        update();
        AppAuthStorage().setChatID(profileData.sId ?? "");
      }
    } catch (e) {
      print("Error fetching profile: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Bannar Data Get
  RxBool isLoadingBannar = false.obs;

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

  /// Service Category Data Get
  RxBool isLoadingCategory = false.obs;
  List<dynamic> categoryList = [].obs;
  getCategoryList() async {
    try {
      isLoadingCategory.value = true;
      var data = await Repository().getCategoryListData();
      if (data.runtimeType != Null) {
        categoryList = data;
        update();
      }
    } catch (e) {
      print(e);
    } finally {
      isLoadingCategory.value = false;
    }
  }

  ///////////////////////// Popular Post List
  RxBool isLoadingPopular = false.obs;
  List<PopularPostModel> popularPostList = <PopularPostModel>[].obs;
  getPopularPostList() async {
    try {
      isLoadingPopular.value = true;
      var data = await Repository().getPopularPostData();
      if (data.runtimeType != Null) {
        popularPostList = data;
        update();
      }
    } catch (e) {
      print(e);
    } finally {
      isLoadingPopular.value = false;
    }
  }

  RxBool isLoadingRecommended = false.obs;
  List<RecommendedPostModel> recommendedPostList = <RecommendedPostModel>[].obs;

  int currentPage = 1;
  bool hasMoreData = true;

  Future<void> getRecommendedPostList({bool isLoadMore = false}) async {
    if (isLoadingRecommended.value) return; // Prevent duplicate requests

    try {
      isLoadingRecommended.value = true;

      if (!isLoadMore) {
        currentPage = 1; // Reset to first page if not loading more
        recommendedPostList.clear(); // Clear the list for a fresh load
        hasMoreData = true;
      }

      var data = await Repository().getRecommendationrPostData(
        page: currentPage,
        limit: 10,
      );

      if (data.isNotEmpty) {
        recommendedPostList.addAll(data);
        currentPage++; // Increment the page for the next load
      } else {
        hasMoreData = false; // No more data to load
      }

      update();
    } catch (e) {
      print("Error fetching recommended posts: $e");
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
    // onInitialDataLoad();
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
