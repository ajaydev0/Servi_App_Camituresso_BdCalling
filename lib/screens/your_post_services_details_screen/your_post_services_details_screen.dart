import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_dev_images.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/const/assets_images_path.dart';
import 'package:servi_app_camituresso/models/chat_or_conversations/chat_data_model.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/screens/services_details_screen/widgets/services_add_edit_review.dart';
import 'package:servi_app_camituresso/screens/services_details_screen/widgets/services_details_delete_dialog_warning.dart';
import 'package:servi_app_camituresso/screens/services_details_screen/controllers/services_details_screen_controller.dart';
import 'package:servi_app_camituresso/screens/services_details_screen/widgets/services_review_delete_dialog_warning.dart';
import 'package:servi_app_camituresso/screens/services_details_screen/widgets/glass_mor_Phish_item.dart';
import 'package:servi_app_camituresso/screens/your_post_services_details_screen/controllers/your_post_services_details_screen_controller.dart';
import 'package:servi_app_camituresso/user_type.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image_circular.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class YourPostServicesDetailsScreen extends StatelessWidget {
  const YourPostServicesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: YourPostServicesDetailsScreenController(),
        builder: (controller) {
          return Obx(
            () => RefreshIndicator(
              color: AppColors.primary,
              onRefresh: () async {
                await controller.getServiceDetailsData();
              },
              child: controller.isLoading.value
                  ? Container(
                      height: AppSize.size.height,
                      width: AppSize.size.width,
                      color: Colors.white,
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.primary,
                      )),
                    )
                  : Scaffold(
                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Booking button <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> floating position <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                      floatingActionButtonLocation:
                          FloatingActionButtonLocation.centerDocked,
                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> button <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                      floatingActionButton: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.paymentMethodScreen);
                        },
                        child: Container(
                          margin: EdgeInsets.all(AppSize.width(value: 10)),
                          width: Get.width,
                          height: AppSize.height(value: 50),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(
                                  AppSize.width(value: 8.0))),
                          child: const AppText(
                            data: "Book Now",
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white50,
                          ),
                        ),
                      ),
                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> booking screen body  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                      body: CustomScrollView(
                        slivers: [
                          // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> booking screen top stack card <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

                          // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> contain image, back button, saved button <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

                          SliverToBoxAdapter(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomRight:
                                    Radius.circular(AppSize.width(value: 20)),
                                bottomLeft:
                                    Radius.circular(AppSize.width(value: 20)),
                              ),
                              // >>>>>>>>>>>>>>>>>>>>>> widget height 30% of screen <<<<<<<<<<<<<<<<<<<<<<
                              child: SizedBox(
                                width: Get.width,
                                height: AppSize.height(value: 350),
                                child: Stack(
                                  alignment: Alignment.center,
                                  fit: StackFit.expand,
                                  children: [
                                    AppImage(
                                      url:
                                          "${AppApiUrl.domaine}${controller.serviceDetails.image}",
                                    ),
                                    Positioned(
                                      top: AppSize.width(value: 30),
                                      left: AppSize.width(value: 30),
                                      right: AppSize.width(value: 30),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // >>>>>>>>>>>>>>>>>>>>>> back button <<<<<<<<<<<<<<<<<<<<<<
                                          GestureDetector(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: AppImage(
                                              width: AppSize.width(value: 30),
                                              height: AppSize.width(value: 30),
                                              path: AssetsIconsPath.backButton,
                                            ),
                                          ),
                                          ////////////  saved button

                                          /// api data use on this
                                          ///  if (selectedUser == UserType.user)
                                          // GestureDetector(
                                          //     onTap: () {
                                          //     },
                                          //     child: AppImage(
                                          //       width: AppSize.width(value: 30),
                                          //       height: AppSize.width(value: 30),
                                          //       path: value == true ? AssetsIconsPath.savaDed : AssetsIconsPath.notSavaDed2,
                                          //     ),
                                          // ),
                                          /////////////// use only dev ui
                                          if (selectedUser == UserType.user)
                                            ValueBuilder<bool?>(
                                              initialValue: false,
                                              builder: (snapshot, updater) =>
                                                  GestureDetector(
                                                onTap: () {
                                                  if (snapshot != null) {
                                                    updater(!snapshot);
                                                  }
                                                },
                                                child: AppImage(
                                                  width:
                                                      AppSize.width(value: 30),
                                                  height:
                                                      AppSize.width(value: 30),
                                                  path: snapshot == true
                                                      ? AssetsIconsPath.savaDed
                                                      : AssetsIconsPath
                                                          .notSavaDed2,
                                                ),
                                              ),
                                            ),
                                          // >>>>>>>>>>>>>>>>>>>>>> edit and removed button  <<<<<<<<<<<<<<<<<<<<<<
                                          // >>>>>>>>>>>>>>>>>>>>>> pop up this button item show <<<<<<<<<<<<<<<<<<<<<<
                                          if (selectedUser ==
                                              UserType.servicesProvider)
                                            PopupMenuButton<String>(
                                              enableFeedback: true,
                                              child: AppImage(
                                                width: AppSize.width(value: 30),
                                                height:
                                                    AppSize.width(value: 30),
                                                path:
                                                    AssetsIconsPath.popUpButton,
                                              ),
                                              color: Colors.transparent,
                                              elevation: 0,
                                              clipBehavior: Clip.hardEdge,
                                              offset: Offset.zero,
                                              // menuPadding: EdgeInsets.zero,
                                              padding: EdgeInsets.zero,
                                              position: PopupMenuPosition.under,
                                              itemBuilder: (context) {
                                                return [
                                                  // >>>>>>>>>>>>>>>>>>>>>> edit button  <<<<<<<<<<<<<<<<<<<<<<
                                                  // >>>>>>>>>>>>>>>>>>>>>> when click goto edit screen <<<<<<<<<<<<<<<<<<<<<<
                                                  PopupMenuItem(
                                                    height: AppSize.width(
                                                        value: 30),
                                                    padding: EdgeInsets.zero,
                                                    child: const ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                10.0),
                                                        topRight:
                                                            Radius.circular(
                                                                10.0),
                                                      ),
                                                      child: GlassMorPhishItem(
                                                          child: AppImage(
                                                        height: 300,
                                                        path: AssetsImagesPath
                                                            .editButtonImage,
                                                        fit: BoxFit.fill,
                                                      )),
                                                    ),
                                                    onTap: () {
                                                      Get.toNamed(
                                                          AppRoutes
                                                              .addPostAndEditScreen,
                                                          arguments: controller
                                                              .serviceDetails);
                                                    },
                                                  ),
                                                  PopupMenuItem(
                                                    height: AppSize.width(
                                                        value: 30),
                                                    padding: EdgeInsets.zero,
                                                    child: const ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                10.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10.0),
                                                      ),
                                                      child: GlassMorPhishItem(
                                                          child: AppImage(
                                                        fit: BoxFit.fill,
                                                        path: AssetsImagesPath
                                                            .detailsButtonImage,
                                                      )),
                                                    ),
                                                    onTap: () {
                                                      servicesDetailsDeleteDialogWarning();
                                                    },
                                                  ),
                                                ];
                                              },
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.all(AppSize.width(value: 10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: AppText(
                                          // data: controller.item.title ?? "",
                                          data:
                                              controller.serviceDetails.title ??
                                                  "",

                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.black700,
                                        ),
                                      ),
                                      AppText(
                                        data:
                                            "\$${controller.serviceDetails.price}",
                                        // data: "",
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.primary,
                                      )
                                    ],
                                  ),
                                  const Gap(height: 15),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            AppImageCircular(
                                              width: AppSize.width(value: 30),
                                              height: AppSize.width(value: 30),
                                              url:
                                                  "${AppApiUrl.domaine}${controller.serviceDetails.user?.profile}",
                                            ),
                                            const Gap(width: 8),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AppText(
                                                    data: controller
                                                            .serviceDetails
                                                            .user
                                                            ?.name ??
                                                        "",
                                                    color: AppColors.black400,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                AppText(
                                                    data: controller
                                                            .serviceDetails
                                                            .category ??
                                                        "",
                                                    // data: "",
                                                    fontSize: 14,
                                                    color: AppColors.black400,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      ///////////////////// goto conversation
                                      // GestureDetector(
                                      //   onTap: () {
                                      //     // Get.toNamed(
                                      //     //     AppRoutes.conversationScreen,
                                      //     //     arguments: controller.item);
                                      //     // Get.toNamed(
                                      //     //   AppRoutes.conversationScreen,
                                      //     //   arguments: ChatDataModel(
                                      //     //     name: controller.item?.user.name ?? "",
                                      //     //     imageUrl: controller.item?.user.image ??
                                      //     //         AssetsDevImages.devUser,
                                      //     //     isSender: false,
                                      //     //     massage: "test message",
                                      //     //     readeMessage: false,
                                      //     //     time: DateTime(2024, 8, 19, 11),
                                      //     //   ),
                                      //     // );
                                      //   },
                                      //   child: AppImage(
                                      //     path: AssetsIconsPath.chatFill,
                                      //     width: AppSize.width(value: 35),
                                      //     height: AppSize.width(value: 35),
                                      //   ),
                                      // )
                                    ],
                                  ),
                                  const Gap(height: 10),
                                  Row(
                                    children: [
                                      AppImage(
                                        path: AssetsIconsPath.location,
                                        width: AppSize.width(value: 15),
                                        height: AppSize.width(value: 15),
                                        iconColor: AppColors.black900,
                                      ),
                                      const Gap(width: 8),
                                      Expanded(
                                          child: AppText(
                                        data: controller
                                                .serviceDetails.location ??
                                            "",

                                        // data: "2972 Westheimer Rd. Santa Ana, Illinois 85486 ",
                                      ))
                                    ],
                                  ),
                                  const Gap(height: 10),
                                ],
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              width: Get.width,
                              color: AppColors.primary,
                              height: 2,
                              margin: EdgeInsets.only(
                                  bottom: AppSize.width(value: 20)),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.all(AppSize.width(value: 10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const AppText(
                                    data: "Description",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const Gap(height: 10),
                                  AppText(
                                    height: 2,
                                    textAlign: TextAlign.justify,
                                    data:
                                        controller.serviceDetails.description ??
                                            "",
                                    // data: "",
                                  ),
                                  // data:
                                  //     """Hello, I'm Marc Marquez, a certified electrician with over [X] years of experience in providing reliable and efficient electrical services. From fixing faulty wiring and installing new lighting fixtures to upgrading electrical panels and ensuring your home or business meets safety standards, I'm here to help with all your electrical needs. I take pride in delivering high-quality work, ensuring your safety and satisfaction with every job. Whether it's a minor repair or a major installation, you can count on me to get the job done right. Book my services through this app, and I'll be at your location in no time. """),
                                  const Gap(height: 20),
                                  const AppText(
                                    data: "Price Breakdown",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const Gap(height: 10),
                                  AppText(
                                    height: 2,
                                    textAlign: TextAlign.justify,
                                    data: controller
                                            .serviceDetails.priceBreakdown ??
                                        "",
                                    // data: "",
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //////////////  app bar pinned
                          // include title and add review button
                          const SliverAppBar(
                            automaticallyImplyLeading: false,
                            forceMaterialTransparency: false,
                            backgroundColor: AppColors.white50,
                            pinned: true,
                            title: AppText(
                              data: "Top Reviews",
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            actions: [
                              // GestureDetector(
                              //   onTap: () {
                              //     controller.reviewRating = 3;
                              //     // serviceAddEditReview(
                              //     //     buttonText: "Add Review",
                              //     //     controller: controller);
                              //   },
                              //   child: Container(
                              //     padding: EdgeInsets.symmetric(
                              //         horizontal: AppSize.width(value: 20.0),
                              //         vertical: AppSize.width(value: 8.0)),
                              //     decoration: BoxDecoration(
                              //         color: AppColors.primary,
                              //         borderRadius: BorderRadius.circular(
                              //             AppSize.width(value: 10.0))),
                              //     child: const AppText(
                              //       data: "Add Riview",
                              //       color: AppColors.white50,
                              //       fontWeight: FontWeight.w600,
                              //     ),
                              //   ),
                              // ),
                              // const Gap(width: 20)
                            ],
                          ),
                          SliverAnimatedList(
                            initialItemCount:
                                controller.serviceDetails.reviews?.length ?? 0,
                            itemBuilder: (context, index, animation) {
                              bool isLast =
                                  controller.reviewList.length - 1 == index;
                              var item =
                                  controller.serviceDetails.reviews?[index];
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom:
                                        isLast ? AppSize.width(value: 80) : 0),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: AppSize.width(value: 10),
                                      vertical: AppSize.width(value: 5.0)),
                                  padding: EdgeInsets.all(
                                      AppSize.width(value: 10.0)),
                                  decoration: BoxDecoration(
                                      color: AppColors.yellow50,
                                      borderRadius: BorderRadius.circular(
                                          AppSize.width(value: 10))),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          AppImageCircular(
                                            width: AppSize.width(value: 30),
                                            height: AppSize.width(value: 30),
                                            url:
                                                "${AppApiUrl.domaine}${item?.user?.profile}",
                                          ),
                                          const Gap(width: 8),
                                          Expanded(
                                              child: AppText(
                                            // data: "Courtney Henry",

                                            data: item?.user?.name ?? "",
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.black400,
                                          )),
                                          // if (CommentOwner.owner ==
                                          //     selectedCommentOwner)
                                          // PopupMenuButton<String>(
                                          //   enableFeedback: true,
                                          //   color: Colors.transparent,
                                          //   elevation: 0,
                                          //   clipBehavior: Clip.hardEdge,
                                          //   offset: Offset.zero,
                                          //   // menuPadding: EdgeInsets.zero,
                                          //   padding: EdgeInsets.zero,
                                          //   position: PopupMenuPosition.under,
                                          //   itemBuilder: (context) {
                                          //     return [
                                          //       PopupMenuItem(
                                          //         height:
                                          //             AppSize.width(value: 30),
                                          //         padding: EdgeInsets.zero,
                                          //         child: const ClipRRect(
                                          //           borderRadius:
                                          //               BorderRadius.only(
                                          //             topLeft:
                                          //                 Radius.circular(10.0),
                                          //             topRight:
                                          //                 Radius.circular(10.0),
                                          //           ),
                                          //           child: GlassMorPhishItem(
                                          //               child: AppImage(
                                          //             height: 300,
                                          //             path: AssetsImagesPath
                                          //                 .editButtonImage,
                                          //             fit: BoxFit.fill,
                                          //           )),
                                          //         ),
                                          //         onTap: () {
                                          //           // serviceAddEditReview(
                                          //           //     buttonText:
                                          //           //         "Update Review",
                                          //           //     controller:
                                          //           //         controller);
                                          //         },
                                          //       ),
                                          //       PopupMenuItem(
                                          //         height:
                                          //             AppSize.width(value: 30),
                                          //         padding: EdgeInsets.zero,
                                          //         child: const ClipRRect(
                                          //           borderRadius:
                                          //               BorderRadius.only(
                                          //             bottomLeft:
                                          //                 Radius.circular(10.0),
                                          //             bottomRight:
                                          //                 Radius.circular(10.0),
                                          //           ),
                                          //           child: GlassMorPhishItem(
                                          //               child: AppImage(
                                          //             fit: BoxFit.fill,
                                          //             path: AssetsImagesPath
                                          //                 .detailsButtonImage,
                                          //           )),
                                          //         ),
                                          //         onTap: () {
                                          //           servicesReviewDeleteDialogWarning();
                                          //         },
                                          //       ),
                                          //     ];
                                          //   },
                                          //   child: AppImage(
                                          //     width: AppSize.width(value: 30),
                                          //     height: AppSize.width(value: 30),
                                          //     path: AssetsIconsPath.popUpButton,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      const Gap(height: 8),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          RatingBar.builder(
                                            initialRating:
                                                item?.rating.toDouble() ?? 0.0,
                                            ignoreGestures: true,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.zero,
                                            itemSize:
                                                AppSize.width(value: 20.0),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                          const AppText(
                                            data: "2 mins ago",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black200,
                                          )
                                        ],
                                      ),
                                      const Gap(height: 20),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: AppText(
                                              textAlign: TextAlign.justify,
                                              data: item?.comment ?? "",
                                            ),
                                          ),
                                        ],
                                      )
                                      // data:
                                      //     """Consequat velit qui adipisicing sunt do rependerit ad laborum tempor ullamco exercitation. Ullamco tempor adipisicing et voluptate aaiugdh aiughdu"""),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          // SliverToBoxAdapter(
                          //   child: Observer(
                          //     builder: (context) {
                          //       // print(controller.serviceDetails?.value?.price);
                          //       if (controller.isLoading.value) {
                          //         return const CircularProgressIndicator(
                          //             color: Colors.black);
                          //       }
                          //       return ListView.builder(
                          //         itemCount:

                          //         // itemCount: 0,
                          //         itemBuilder: (context, index) {

                          //           return
                          //         },
                          //       );
                          //     },
                          //   ),
                          // ),

                          SliverToBoxAdapter(
                            child: Gap(
                              height: AppSize.height(value: 70),
                            ),
                          )
                        ],
                      ),
                    ),
            ),
          );
        });
  }
}
