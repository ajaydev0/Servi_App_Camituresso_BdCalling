import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/screens/profile_screen/models/profile_screen_model.dart';
import 'package:servi_app_camituresso/services/api/services/api_patch_services.dart';
import 'package:servi_app_camituresso/services/app_storage/app_auth_storage.dart';
import 'package:servi_app_camituresso/services/repository/post_repository.dart';
import 'package:servi_app_camituresso/widgets/app_snack_bar/app_snack_bar.dart';
import 'package:servi_app_camituresso/widgets/custom_show_date_picker/custom_show_date_picker.dart';
import 'package:servi_app_camituresso/widgets/image_user_pic/image_user_pi.dart';

class EditProfileScreenController extends GetxController {
  RxBool isLoading = false.obs;
  final ImagePicker picker = ImagePicker();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController contactTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();
  GlobalKey<FormState> editProfileScreenKey = GlobalKey<FormState>();
  TextEditingController dateOfBirthTextEditingController =
      TextEditingController();
  DateTime? dateOfBirth;
  var token = AppAuthStorage().box.read("data");
  var argData = Get.arguments;
  RxBool isImgValid = true.obs;
  RxString localImagePath = RxString("");
  ProfileModel profileData = ProfileModel();
  clickImagePic() {
    imageUserTake(localImagePath);
  }

  callDateOfBirthSet() async {
    final pickDateOfBirth = await customShowDatePicker(
      context: Get.context!,
      firstDate: DateTime(1960),
      lastDate: DateTime.now(),
    );
    if (pickDateOfBirth != null) {
      dateOfBirth = pickDateOfBirth;
      String day = pickDateOfBirth.day.toString().padLeft(2, '0');
      String month = pickDateOfBirth.month.toString().padLeft(2, '0');
      String year = pickDateOfBirth.year.toString();
      dateOfBirthTextEditingController.text = "$day-$month-$year";
    }
  }

  refreshFunction() async {
    try {
      isLoading.value = true;
      Map<String, String> body = {
        "name": nameTextEditingController.text,
        "contact": contactTextEditingController.text,
        "dateOfBirth": dateOfBirthTextEditingController.text,
        "location": addressTextEditingController.text,
      };
      var data = await ImageRepository().profilePatchImageUpdate(
          url: AppApiUrl.updateProfileUrl,
          imagePath: localImagePath.value,
          body: body);
      if (data != null) {
        Get.back(times: 2);
        AppSnackBar.success("Profile Updated");
      }
    } catch (e) {
      print("$e");
    } finally {
      isLoading.value = false;
    }
  }

  clickSaveChange() async {
    try {
      isLoading.value = true;
      Map<String, String> body = {
        "name": nameTextEditingController.text,
        "contact": contactTextEditingController.text,
        "dateOfBirth": dateOfBirthTextEditingController.text,
        "location": addressTextEditingController.text,
      };
      var data = await ImageRepository().profilePatchImageUpdate(
          url: AppApiUrl.updateProfileUrl,
          imagePath: localImagePath.value,
          body: body);
      if (data != null) {
        Get.back(times: 2);
        AppSnackBar.success("Profile Updated");
      }
    } catch (e) {
      print("$e");
    } finally {
      isLoading.value = false;
    }
  }

  argSet() {
    if (Get.arguments.runtimeType != Null) {
      profileData = Get.arguments;
      nameTextEditingController.text = profileData.name ?? "";
      emailTextEditingController.text = profileData.email ?? "";
      contactTextEditingController.text = profileData.contact ?? "";
      addressTextEditingController.text = profileData.location ?? "";
      dateOfBirthTextEditingController.text = profileData.dateOfBirth ?? "";
    }
  }

  @override
  void onInit() {
    argSet();

    super.onInit();
  }

  @override
  void onClose() {
    nameTextEditingController.dispose();
    emailTextEditingController.dispose();
    contactTextEditingController.dispose();
    dateOfBirthTextEditingController.dispose();
    addressTextEditingController.dispose();
    super.onClose();
  }
}
