import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/screens/services_details_screen/models/service_details_model.dart';
import 'package:servi_app_camituresso/services/repository/post_repository.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';
import 'package:servi_app_camituresso/widgets/app_snack_bar/app_snack_bar.dart';

class AddAndEditPostScreenController extends GetxController {
  RxBool isAdultServices = false.obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingButton = false.obs;
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
    // "Plumber",
    // "Electrician",
    // "Home Service",
    // "Pet Service",
  ].obs;
  getCategoryList() async {
    try {
      isLoading.value = true;
      var data = await Repository().getCategoryListData();
      if (data.runtimeType != Null) {
        for (var element in data) {
          servicesCategoryList.add(element.name ?? "");
        }
        // servicesCategoryList = data;
        update();
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  RxBool isOpenServicesCategoryList = false.obs;
  convertFile(imagePath) async {
    // await ImageRepository().imageUpdate(imagePath);
  }
  ServiceDetailsModel serviceDetails = ServiceDetailsModel();
  onDataSetFunction() {
    try {
      final argData = Get.arguments;
      if (argData.runtimeType != Null) {
        screenTitle.value = "Edit Post";
        serviceDetails = Get.arguments;
        /////////// Value Asign....
        titleController.text = serviceDetails.title ?? "";
        priceController.text = serviceDetails.price.toString() ?? "";
        pricungBreakdownController.text = serviceDetails.priceBreakdown ?? "";
        descriptionController.text = serviceDetails.description ?? "";
        locationController.text = serviceDetails.location ?? "";
        selectedServicesCategory.value = serviceDetails.category ?? "";
        // userLocalImage.value = serviceDetails.image ?? "";
      }
    } catch (e) {
      log("error form Add post screen on data set function : $e");
    }
  }

  addPostLogic() async {
    try {
      isLoadingButton.value = true;
      Map<String, String> body = {
        "title": titleController.text,
        "price": priceController.text,
        "price_breakdown": pricungBreakdownController.text,
        "description": descriptionController.text,
        "location": locationController.text,
        "category": selectedServicesCategory.value,
      };
      // Api Call
      var data = await ImageRepository().imageUploadWithData(
        body: body,
        imagePath: userLocalImage.value,
        url: AppApiUrl.createPostUrl,
      );
      if (data != null) {
        Get.back();
        AppSnackBar.success("Create Sucessful");
      }
    } catch (e) {
      print("$e");
    } finally {
      isLoadingButton.value = false;
    }
  }

  editPostLogic() async {
    try {
      isLoadingButton.value = true;
      Map<String, String> body = {
        "title": titleController.text,
        "price": priceController.text,
        "price_breakdown": pricungBreakdownController.text,
        "description": descriptionController.text,
        "location": locationController.text,
        "category": selectedServicesCategory.value,
      };
      // Api Call
      var data = await ImageRepository().profilePatchImageUpdate(
        body: body,
        imagePath: userLocalImage.value,
        url: "${AppApiUrl.updatePostUrl}${serviceDetails.sId}",
      );
      if (data != null) {
        Get.back();
        AppSnackBar.success("Update Sucessful");
      }
    } catch (e) {
      print("$e");
    } finally {
      isLoadingButton.value = false;
    }
  }

  clickAddAndEditButton() {
    try {
      if (userLocalImage.value.isEmpty && screenTitle.value == "Add Post") {
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
          if (screenTitle.value == "Add Post") {
            addPostLogic();
          } else if (screenTitle.value == "Edit Post") {
            editPostLogic();
          }
        }
      }
    } catch (e) {
      log("error form click add and edit button : $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCategoryList();
    onDataSetFunction();
    print("${Get.arguments} ➡️➡️➡️➡️➡️➡️➡️➡️");
  }

  @override
  void onClose() {
    titleController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    pricungBreakdownController.dispose();
    locationController.dispose();
    selectedServicesCategory.value = "";
    userLocalImage.value = "";
    super.onClose();
  }
}
