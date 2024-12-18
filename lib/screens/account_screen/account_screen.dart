import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/models/dev_category/dev_category_model.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/screens/account_screen/controllers/log_out_dailog.dart';
import 'package:servi_app_camituresso/screens/account_screen/widgets/account_card_widget.dart';
import 'package:servi_app_camituresso/screens/navigation_screen/controllers/navigation_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';

import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({
    super.key,
    required this.navigationScreenController,
  });
  final NavigationScreenController navigationScreenController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        forceMaterialTransparency: true,
        title: const AppText(
          data: "Menu",
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(AppSize.width(value: 10.0)),
              child: const AppText(
                  data: "Account", fontWeight: FontWeight.w600, fontSize: 24),
            ),
            AccountCardWidget(
              title: "Profile",
              iconPath: AssetsIconsPath.user,
              onTap: () {
                Get.toNamed(AppRoutes.profileScreen);
              },
            ),
            AccountCardWidget(
              title: "Your Post",
              iconPath: AssetsIconsPath.yourPost,
              onTap: () {
                Get.toNamed(AppRoutes.listOfViewServicesScreen,
                    arguments: DevCategoryModel(
                        name: "Your Post", id: "id1", imagePath: ""));
              },
            ),
            AccountCardWidget(
              title: "User History",
              iconPath: AssetsIconsPath.userHistory,
              onTap: () {
                Get.toNamed(AppRoutes.userHistoryScreen);
              },
            ),
            AccountCardWidget(
              title: "Change Password",
              iconPath: AssetsIconsPath.password,
              onTap: () {
                Get.toNamed(AppRoutes.changePasswordScreen);
              },
            ),
            AccountCardWidget(
              title: "Transaction History",
              iconPath: AssetsIconsPath.transactionHistory,
              onTap: () {
                Get.toNamed(AppRoutes.transactionHistoryScreen);
              },
            ),
            AccountCardWidget(
              title: "Notifications",
              iconPath: AssetsIconsPath.notification,
              onTap: () {
                navigationScreenController.callNotification();
              },
            ),
            Padding(
              padding: EdgeInsets.all(AppSize.width(value: 10.0)),
              child: const AppText(
                  data: "More", fontWeight: FontWeight.w600, fontSize: 24),
            ),
            AccountCardWidget(
              title: "About Us",
              iconPath: AssetsIconsPath.about,
              onTap: () {
                Get.toNamed(AppRoutes.aboutUsScreen);
              },
            ),
            AccountCardWidget(
              title: "Terms & Condition",
              iconPath: AssetsIconsPath.about,
              onTap: () {
                Get.toNamed(AppRoutes.termsAndConditionScreen);
              },
            ),
            AccountCardWidget(
              title: "Privacy Policy",
              iconPath: AssetsIconsPath.privacyPolicy,
              onTap: () {
                Get.toNamed(AppRoutes.privacyAndPolicyScreen);
              },
            ),
            const Gap(height: 30),
            AccountCardWidget(
              title: "Log Out",
              iconPath: AssetsIconsPath.logOut,
              iconColor: AppColors.warning,
              onTap: () {
                logOutDialog();
              },
            ),
          ],
        ),
      ),
    );
  }
}
