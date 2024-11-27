import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/screens/account_screen/account_screen.dart';
import 'package:servi_app_camituresso/screens/chat_screen/chat_screen.dart';
import 'package:servi_app_camituresso/screens/home_screen/home_screen.dart';
import 'package:servi_app_camituresso/screens/navigation_screen/controllers/navigation_screen_controller.dart';
import 'package:servi_app_camituresso/screens/request_screen/request_screen.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: NavigationScreenController(),
        builder: (controller) {
          return Scaffold(
            body: Obx(
              () => IndexedStack(
                index: controller.selectedIndex.value,
                children: [
                  ////////// index 0
                  HomeScreen(
                    navigationScreenController: controller,
                  ),
                  ////////// index 1
                  RequestScreen(),
                  /////////// index 2
                  ChatScreen(),
                  /////////// index 3
                  AccountScreen(
                    navigationScreenController: controller,
                  )
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.addPostAndEditScreen);
              },
              child: Container(
                margin: EdgeInsets.only(top: AppSize.width(value: 20)),
                padding: EdgeInsets.all(AppSize.width(value: 4)),
                decoration: BoxDecoration(
                  color: AppColors.white50,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  padding: EdgeInsets.all(AppSize.width(value: 12)),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add,
                    color: AppColors.white50,
                    size: AppSize.width(value: 35),
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.symmetric(vertical: AppSize.width(value: 8)),
              decoration: BoxDecoration(color: AppColors.white50),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //////////////////  home
                    GestureDetector(
                      onTap: () {
                        controller.changeIndex(0);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppImage(
                            path: AssetsIconsPath.home,
                            width: Get.width * 0.08,
                            height: Get.width * 0.08,
                            iconColor: controller.selectedIndex.value == 0
                                ? AppColors.primary
                                : AppColors.black300,
                          ),
                          AppText(
                            data: "Home",
                            color: controller.selectedIndex.value == 0
                                ? AppColors.primary
                                : AppColors.black300,
                          )
                        ],
                      ),
                    ),

                    ////////////  request
                    GestureDetector(
                      onTap: () {
                        controller.changeIndex(1);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppImage(
                            path: AssetsIconsPath.request,
                            width: Get.width * 0.08,
                            height: Get.width * 0.08,
                            iconColor: controller.selectedIndex.value == 1
                                ? AppColors.primary
                                : AppColors.black300,
                          ),
                          AppText(
                            data: "Request",
                            color: controller.selectedIndex.value == 1
                                ? AppColors.primary
                                : AppColors.black300,
                          )
                        ],
                      ),
                    ),
                    Gap(width: 30),

                    /////////////  chat
                    GestureDetector(
                      onTap: () {
                        controller.changeIndex(2);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppImage(
                            path: AssetsIconsPath.chat,
                            width: Get.width * 0.08,
                            height: Get.width * 0.08,
                            iconColor: controller.selectedIndex.value == 2
                                ? AppColors.primary
                                : AppColors.black300,
                          ),
                          AppText(
                            data: "Chat",
                            color: controller.selectedIndex.value == 2
                                ? AppColors.primary
                                : AppColors.black300,
                          )
                        ],
                      ),
                    ),
                    //////////// account
                    GestureDetector(
                      onTap: () {
                        controller.changeIndex(3);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppImage(
                            path: AssetsIconsPath.account,
                            width: Get.width * 0.08,
                            height: Get.width * 0.08,
                            iconColor: controller.selectedIndex.value == 3
                                ? AppColors.primary
                                : AppColors.black300,
                          ),
                          AppText(
                            data: "Account",
                            color: controller.selectedIndex.value == 3
                                ? AppColors.primary
                                : AppColors.black300,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // bottomNavigationBar: Container(
            //   decoration: BoxDecoration(color: AppColors.white100),
            //   child: BottomNavigationBar(
            //     backgroundColor: AppColors.white50,
            //     selectedItemColor: AppColors.primary,
            //     unselectedItemColor: AppColors.black200,
            //     showUnselectedLabels: true,
            //     type: BottomNavigationBarType.fixed,
            //     items: [
            //       BottomNavigationBarItem(
            //           icon: AppImage(
            //             path: AssetsIconsPath.home,
            //             width: Get.width * 0.08,
            //           ),
            //           label: "Home",
            //           backgroundColor: AppColors.white50),
            //       BottomNavigationBarItem(
            //           icon: AppImage(
            //             path: AssetsIconsPath.home,
            //             width: Get.width * 0.08,
            //           ),
            //           label: "Home",
            //           backgroundColor: AppColors.white50),
            //       BottomNavigationBarItem(
            //           icon: AppImage(
            //             path: AssetsIconsPath.home,
            //             width: Get.width * 0.08,
            //           ),
            //           label: "Home",
            //           backgroundColor: AppColors.white50),
            //       BottomNavigationBarItem(
            //           icon: AppImage(
            //             path: AssetsIconsPath.home,
            //             width: Get.width * 0.08,
            //           ),
            //           label: "Home",
            //           backgroundColor: AppColors.white50),
            //       BottomNavigationBarItem(
            //           icon: AppImage(
            //             path: AssetsIconsPath.home,
            //             width: Get.width * 0.08,
            //           ),
            //           label: "Home",
            //           backgroundColor: AppColors.white50),
            //     ],
            //   ),
            // ),
          );
        });
  }
}
