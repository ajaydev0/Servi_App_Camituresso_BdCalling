import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/screens/services_details_screen/models/get_service_details_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';
import 'package:servi_app_camituresso/widgets/app_snack_bar/app_snack_bar.dart';

class ServicesDetailsScreenController extends GetxController {
  RxBool isLoadingReview = false.obs;
  RxBool isLoading = false.obs;
  TextEditingController reviewController = TextEditingController();
  int reviewRating = 3;
  GlobalKey<FormState> addAndEditReviewKey =
      GlobalKey<FormState>(debugLabel: UniqueKey().toString());
  dynamic item;
  RxList<String> listOfComment = RxList.generate(50, (index) {
    return "index is $index";
  });
  List<dynamic> reviewList = [].obs;

  clickAddAndEditReviewButton() async {
    try {
      if (addAndEditReviewKey.currentState!.validate()) {
        isLoadingReview.value = true;
        await Repository().createReview(
            id: Get.arguments,
            comment: reviewController.text,
            rating: reviewRating);

        Get.back();
        isLoadingReview.value = false;
        AppSnackBar.success("Review Added Successful");
      }
    } catch (e) {
      log("error form add and edit review button:$e");
    } finally {
      isLoadingReview.value = false;
    }
  }

  getServiceDetailsData() async {
    try {
      isLoading.value = true;
      if (Get.arguments.runtimeType != Null) {
        var data = await Repository().getServiceDetailsData(Get.arguments);
        if (data != null) {
          item = data;
          // isLoading.value = false;
          for (var element in data["reviews"]) {
            reviewList.add(GetReviewListModel.fromJson(element));
            update();
          }
        }
      } else {
        print("Something Else");
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await getServiceDetailsData();
  }
}
