import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/dev_data/dev_list_of_services_data.dart';
import 'package:servi_app_camituresso/models/dev_services_model/dev_services_model.dart';
import 'package:servi_app_camituresso/screens/profile_screen/models/profile_screen_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class HomeScreenController extends GetxController {
  // Get Profile Data
  RxBool isLoading = true.obs;
  Rx<ProfileModel> profile = ProfileModel().obs;

  /////////////////////// banner
  Isolate? bannerIsolate;
  RxInt selectedListOfBannerIndex = RxInt(0);
  late PageController listOfBannerPageViewController;
  RxList<String> listOfBanner = RxList([
    "assets/dev_images/banner1.png",
    "assets/dev_images/banner2.png",
    "assets/dev_images/banner3.png",
  ]);
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
      selectedListOfBannerIndex.value = selectedListOfBannerIndex.value + 1;
      if (selectedListOfBannerIndex < listOfBanner.length) {
        listOfBannerPageViewController.animateToPage(
            selectedListOfBannerIndex.value,
            duration: const Duration(seconds: 1),
            curve: Curves.ease);
      } else if (selectedListOfBannerIndex.value == listOfBanner.length - 1) {
        selectedListOfBannerIndex.value = 0;
        listOfBannerPageViewController.animateToPage(
            selectedListOfBannerIndex.value,
            duration: const Duration(seconds: 1),
            curve: Curves.ease);
      } else {
        selectedListOfBannerIndex.value = 0;
        listOfBannerPageViewController.animateToPage(
            selectedListOfBannerIndex.value,
            duration: const Duration(seconds: 1),
            curve: Curves.ease);
      }
    } catch (e) {
      log("Error form change banner page function $e");
    }
  }

  onListOfBannerSetUp() async {
    try {
      listOfBannerPageViewController = PageController(
        initialPage: selectedListOfBannerIndex.value,
      );
      final response = ReceivePort();
      bannerIsolate = await Isolate.spawn(_bannerEntryPoint, response.sendPort);
      response.listen(
        (message) {
          changeListOfBanner();
        },
      );
    } catch (e) {
      log("Error form banner setup function : $e");
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

  // Future<void> profileDataGet() async {
  //   // Get Profile Data
  //   try {
  //     isLoading.value = true;
  //     var profileData = await Repository().getProfileData();
  //     profile.value = profileData;
  //   } catch (e) {
  //     print("Error fetching profile: $e");
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
  getProfileData() async {
    try {
      isLoading.value = true;
      var profileData = await Repository().getProfileData();
      profile.value = profileData;
    } catch (e) {
      print("Error fetching profile: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    // profileDataGet();
    onListOfBannerSetUp();
    onInitialDataLoad();
    // Get Profile Data
    getProfileData();
  }

  @override
  void onClose() {
    super.onClose();
    killDartIsolate();
  }
}
