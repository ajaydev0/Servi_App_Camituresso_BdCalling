import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/services/repository/post_repository.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';
import 'package:servi_app_camituresso/widgets/app_snack_bar/app_snack_bar.dart';

class AddAndEditPostScreenController extends GetxController {
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
    "Plumber",
    "Electrician",
    "Home Service",
    "Pet Service",
  ].obs;
  RxBool isOpenServicesCategoryList = false.obs;
  convertFile(imagePath) async {
    // await ImageRepository().imageUpdate(imagePath);
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
      var data = await ImageRepository()
          .imageUploadWithData(body: body, imagePath: userLocalImage.value);
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

  editPostLogic() {
    AppSnackBar.success("edit Post Logic");
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
    onDataSetFunction();
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
