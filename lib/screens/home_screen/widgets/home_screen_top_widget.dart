import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_images_path.dart';
import 'package:servi_app_camituresso/models/dev_category/dev_category_model.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/screens/home_screen/controllers/home_screen_controller.dart';
import 'package:servi_app_camituresso/screens/navigation_screen/controllers/navigation_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image_circular.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

// class HomeScreenTopWidget extends StatelessWidget {
//   const HomeScreenTopWidget({
//     super.key,
//     required this.navigationScreenController,
//     required this.controller,
//   });

//   final NavigationScreenController navigationScreenController;
//   final HomeScreenController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: Get.width,
//       decoration: BoxDecoration(
//           image: const DecorationImage(
//               image: AssetImage(AssetsImagesPath.backGround), fit: BoxFit.fill),
//           borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(AppSize.width(value: 25.0)),
//               bottomLeft: Radius.circular(AppSize.width(value: 25.0)))),
//       child: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: AppSize.width(value: 20.0),
//               vertical: AppSize.width(value: 20.0)),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Gap(height: 20),
//               Row(
//                 children: [
//                   ////// profile image
//                   GestureDetector(
//                     onTap: () {
//                       Get.toNamed(AppRoutes.profileScreen);
//                     },
//                     child: AppImageCircular(
//                       width: AppSize.width(value: 60),
//                       height: AppSize.width(value: 60),
//                       // path: AssetsDevImages.devUser2,
//                       url: controller.profile.value.data!.profile,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   const Gap(width: 10),

//                   ////////////////  user name & address
//                   Expanded(
//                       child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       AppText(
//                         data: controller.profile.value.data!.name == ""
//                             ? "Name...."
//                             : controller.profile.value.data!.name ?? "",
//                         color: AppColors.black50,
//                         fontWeight: FontWeight.w700,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       const Gap(height: 10),
//                       AppText(
//                         data: controller.profile.value.data!.location == ""
//                             ? "Location...."
//                             : controller.profile.value.data!.location ?? "",
//                         color: AppColors.white600,
//                         fontWeight: FontWeight.w400,
//                         fontSize: 14,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       )
//                     ],
//                   )),
//                   GestureDetector(
//                     onTap: () {
//                       Get.toNamed(AppRoutes.listOfViewServicesScreen,
//                           arguments: DevCategoryModel(
//                               name: "Saved", imagePath: "", id: "id1"));
//                     },
//                     child: AppImage(
//                       path: AssetsImagesPath.savedButton,
//                       width: AppSize.width(value: 30),
//                       height: AppSize.width(value: 30),
//                     ),
//                   ),
//                   const Gap(width: 10),
//                   GestureDetector(
//                     onTap: () {
//                       navigationScreenController.callNotification();
//                     },
//                     child: AppImage(
//                       path: AssetsImagesPath.notificationButton,
//                       width: AppSize.width(value: 30),
//                       height: AppSize.width(value: 30),
//                     ),
//                   ),
//                 ],
//               ),
//               const Gap(height: 30),
//               GestureDetector(
//                 onTap: () {
//                   Get.toNamed(AppRoutes.searchScreen);
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                       borderRadius:
//                           BorderRadius.circular(AppSize.width(value: 100)),
//                       color: AppColors.primary,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.08),
//                           spreadRadius: 5,
//                           blurRadius: 40,
//                           offset: const Offset(-10, 10),
//                         ),
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.08),
//                           spreadRadius: 5,
//                           blurRadius: 40,
//                           offset: const Offset(10, 20),
//                         ),
//                       ]),
//                   child: AppImage(
//                     path: AssetsImagesPath.searchBar,
//                     width: Get.width,
//                     height: AppSize.width(value: 50),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

///
///
///

class HomeScreenTopWidget extends StatelessWidget {
  const HomeScreenTopWidget({
    super.key,
    required this.navigationScreenController,
    required this.controller,
  });

  final NavigationScreenController navigationScreenController;
  final HomeScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(AssetsImagesPath.backGround),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(AppSize.width(value: 25.0)),
          bottomLeft: Radius.circular(AppSize.width(value: 25.0)),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.width(value: 20.0),
            vertical: AppSize.width(value: 20.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(height: 20),
              Row(
                children: [
                  /// Profile Image
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.profileScreen);
                    },
                    child: AppImageCircular(
                      width: AppSize.width(value: 60),
                      height: AppSize.width(value: 60),
                      url:
                          "${AppApiUrl.domaine}${controller.profileData.profile}",
                      // url: controller.profile.value.data?.profile ?? '',
                      // controller.profile.value.data!.profile!
                      fit: BoxFit.fill,
                    ),
                  ),

                  const Gap(width: 10),

                  /// User Name & Address
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          data: controller.profileData.name?.isEmpty ?? true
                              ? "Name...."
                              : controller.profileData.name!,
                          color: AppColors.black50,
                          fontWeight: FontWeight.w700,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Gap(height: 10),
                        AppText(
                          data: controller.profileData.location?.isEmpty ?? true
                              ? "Location...."
                              : controller.profileData.location!,
                          color: AppColors.white600,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.savedScreen);
                      // Get.toNamed(
                      //   AppRoutes.listOfViewServicesScreen,
                      //   arguments: DevCategoryModel(
                      //     name: "Saved",
                      //     imagePath: "",
                      //     id: "id1",
                      //   ),
                      // );
                    },
                    child: AppImage(
                      path: AssetsImagesPath.savedButton,
                      width: AppSize.width(value: 30),
                      height: AppSize.width(value: 30),
                    ),
                  ),
                  const Gap(width: 10),
                  GestureDetector(
                    onTap: () {
                      navigationScreenController.callNotification();
                    },
                    child: AppImage(
                      path: AssetsImagesPath.notificationButton,
                      width: AppSize.width(value: 30),
                      height: AppSize.width(value: 30),
                    ),
                  ),
                ],
              ),
              const Gap(height: 30),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.searchScreen);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppSize.width(value: 100)),
                    color: AppColors.primary,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        spreadRadius: 5,
                        blurRadius: 40,
                        offset: const Offset(-10, 10),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        spreadRadius: 5,
                        blurRadius: 40,
                        offset: const Offset(10, 20),
                      ),
                    ],
                  ),
                  child: AppImage(
                    path: AssetsImagesPath.searchBar,
                    width: Get.width,
                    height: AppSize.width(value: 50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
