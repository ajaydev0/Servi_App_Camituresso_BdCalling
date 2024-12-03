import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/services/repository/post_repository.dart';

class AddAndEditPostScreenController extends GetxController {
  RxBool isLoading = false.obs;
  GlobalKey<FormState> addAndEditPostKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController pricungBreakdownController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  RxString screenTitle = RxString("Add Post");
  RxString userLocalImage = RxString("");
  RxBool isImageAddCheck = RxBool(false);
  RxBool isJobCategoryCheck = RxBool(false);
  RxString selectedServicesCategory = "Select Category".obs;
  RxList<String> servicesCategoryList = <String>[
    "Plumber",
    "Electrician",
    "Home Service",
    "Pet Service",
  ].obs;
  RxBool isOpenServicesCategoryList = false.obs;
  convertFile(imagePath) async {
    // await ImageRepository().imageUpdate(imagePath);
  }

  // Api Call
  clickButton() async {
    //  data2 = await ImageRepository().imageUpdate(userLocalImage.value);

    // try {
    //   isLoading.value = true;
    //   var data = await ImageRepository().amniAri(
    //       titleController,
    //       priceController,
    //       pricungBreakdownController,
    //       descriptionController,
    //       selectedServicesCategory,
    //       locationController);

    //   // Api Call
    //   // var data = await ApiPostServices().apiPostServices(
    //   //   url: AppApiUrl.createPostUrl,
    //   //   body: {
    //   //     "title": titleController.text,
    //   //     "price": priceController.text,
    //   //     "price_breakdown": pricungBreakdownController.text,
    //   //     "description": descriptionController.text,
    //   //     "category": selectedServicesCategory.value,
    //   //     "location": locationController.text,
    //   //     "image": ,
    //   //   },
    //   // );
    //   if (data != null) {
    //     // Get.toNamed(AppRoutes.otpVerificationScreen,
    //     //     arguments: {"email": emailTextEditingController.text});
    //   }
    //   print("😍😍😍😍😍😍😍😍  😍😍😍😍😍😍😍😍");
    // } catch (e) {
    //   log("error form sign up click button $e");
    // } finally {
    //   isLoading.value = false;
    // }
    // print("${titleController.text}");
    // print("${priceController.text}");
    // print("${pricungBreakdownController.text}");
    // print("${descriptionController.text}");
    // print("${locationController.text}");
    // print("${selectedServicesCategory}");
    // print("${userLocalImage.value}");
  }

  onDataSetFunction() {
    try {
      final argData = Get.arguments;
      if (argData.runtimeType != Null) {
        screenTitle.value = "Edit Post";
      }
    } catch (e) {
      log("error form Add post screen on data set function : $e");
    }
  }

  clickAddAndEditButton() {
    try {
      if (userLocalImage.value.isEmpty) {
        isImageAddCheck.value = true;
      } else {
        isImageAddCheck.value = false;
      }
      if (selectedServicesCategory.value.toLowerCase() ==
          "Select Category".toLowerCase()) {
        isJobCategoryCheck.value = true;
      } else {
        isJobCategoryCheck.value = false;
      }
      if (addAndEditPostKey.currentState!.validate()) {
        if (!isImageAddCheck.value && !isJobCategoryCheck.value) {
          Get.toNamed(AppRoutes.addPostSuccessfullyScreen);
        }
      }
    } catch (e) {
      log("error form click add and edit button : $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    onDataSetFunction();
  }

  @override
  void onClose() {
    titleController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    pricungBreakdownController.dispose();
    locationController.dispose();
    super.onClose();
  }
}
