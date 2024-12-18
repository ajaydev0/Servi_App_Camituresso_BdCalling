import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/services/api/services/api_patch_services.dart';
import 'package:servi_app_camituresso/services/app_storage/app_auth_storage.dart';
import 'package:servi_app_camituresso/services/repository/post_repository.dart';
import 'package:servi_app_camituresso/widgets/app_snack_bar/app_snack_bar.dart';
import 'package:servi_app_camituresso/widgets/custom_show_date_picker/custom_show_date_picker.dart';
import 'package:servi_app_camituresso/widgets/image_user_pic/image_user_pi.dart';

class EditProfileScreenController extends GetxController {
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
      var data = await ImageRepository().imageUpdate(
          imagePath: localImagePath.value,
          name: nameTextEditingController.text,
          number: contactTextEditingController.text,
          dateOfBirth: dateOfBirthTextEditingController.text,
          address: addressTextEditingController.text);
      if (data != null) {}
    } catch (e) {
      print("$e");
    }
  }

  clickSaveChange() async {
    try {
      if (editProfileScreenKey.currentState!.validate()) {
        var data = await ImageRepository().imageUpdate(
            imagePath: localImagePath.value,
            name: nameTextEditingController.text,
            number: contactTextEditingController.text,
            dateOfBirth: dateOfBirthTextEditingController.text,
            address: addressTextEditingController.text);
        if (data != null) {
          Get.back(times: 2);
          AppSnackBar.success("Profile Updated");
        }
      }
    } catch (e) {
      print("$e");
    }
    // var data = ApiPatchServices()
    //     .apiPatchServices(url: AppApiUrl.updateProfileUrl, body: {
    //   "image":
    //       "/data/user/0/com.example.servi_app_camituresso/cache/6de437d5-827b-44ac-9cf2-2251cc3ccf76/1000001863.jpg",
    // });
    // var data = ImageRepository().profileUpdate(imagePath: localImagePath.value);
    // print("$data ➡️➡️➡️➡️➡️➡️➡️➡️➡️➡️➡️");
    // try {
    //   if (editProfileScreenKey.currentState!.validate()) {
    //     try {
    //       var data =
    //           ImageRepository().profileUpdate(imagePath: localImagePath.value);
    //       print("$data ➡️➡️➡️➡️➡️➡️➡️➡️➡️➡️➡️");

    //       // var data = await ApiPatchServices().apiPatchServices(
    //       //     url: AppApiUrl.updateProfileUrl,
    //       //     token: token,
    //       //     body: {
    //       //       "name": nameTextEditingController.text,
    //       //       "contact": contactTextEditingController.text,
    //       //       "dateOfBirth": dateOfBirthTextEditingController.text,
    //       //       "location": addressTextEditingController.text,
    //       //       "images": localImagePath.value,
    //       //     });
    //       // if (data != null) {
    //       //   AppSnackBar.success("Profile Updated");
    //       // } else {
    //       //   return print(data);
    //       // }
    //     } catch (e) {
    //       print("$e");
    //     }

    //     Get.back(times: 2);
    //   }
    // } catch (e) {
    //   log("error form save change: $e");
    // }
  }

  @override
  void onInit() {
    nameTextEditingController.text = argData.data.name;
    emailTextEditingController.text = argData.data.email;
    contactTextEditingController.text = argData.data.contact;
    addressTextEditingController.text = argData.data.location;
    dateOfBirthTextEditingController.text = argData.data.dateOfBirth;

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
