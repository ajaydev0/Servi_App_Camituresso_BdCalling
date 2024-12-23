import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/screens/services_details_screen/controllers/services_details_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/inputs/app_input_widget.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

serviceAddEditReview(
    {required String buttonText,
    required ServicesDetailsScreenController controller}) {
  Get.dialog(Dialog(
    backgroundColor: AppColors.white100,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.width(value: 10.0))),
    child: Padding(
      padding: EdgeInsets.all(AppSize.width(value: 20.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
                onTap: () {
                  // Get.back();
                  Get.closeAllDialogs();
                },
                child: Icon(Icons.cancel_outlined)),
          ),
          Gap(height: 5),
          AppText(
            data: "Your overall rating of this product",
            color: AppColors.black500,
            fontWeight: FontWeight.w400,
          ),
          Gap(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingBar.builder(
                initialRating: 3,
                ignoreGestures: false,
                minRating: 1,
                direction: Axis.horizontal,
                // allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.zero,
                itemSize: AppSize.width(value: 30.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating.toInt());
                  controller.reviewRating = rating.toInt();
                },
              ),
            ],
          ),
          Gap(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: AppText(
              data: "Add detailed review",
              fontWeight: FontWeight.w400,
              color: AppColors.black900,
            ),
          ),
          Gap(height: 10),
          Form(
            key: controller.addAndEditReviewKey,
            child: AppInputWidget(
              controller: controller.reviewController,
              hintText: "Write here..",
              fillColor: AppColors.white50,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.black200, width: 1),
                borderRadius: BorderRadius.circular(AppSize.width(value: 10)),
              ),
              errBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.warning, width: 1),
                borderRadius: BorderRadius.circular(AppSize.width(value: 10)),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 100,
              minLines: 5,
              textInputAction: TextInputAction.newline,
            ),
          ),
          Gap(height: 20),
          Obx(
            () => controller.isLoadingReview.value
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  )
                : GestureDetector(
                    onTap: () async {
                      await controller.clickAddAndEditReviewButton();
                    },
                    child: Container(
                      width: Get.width,
                      height: AppSize.height(value: 50),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius:
                              BorderRadius.circular(AppSize.width(value: 8.0))),
                      child: AppText(
                        data: buttonText,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white50,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    ),
  ));
}
