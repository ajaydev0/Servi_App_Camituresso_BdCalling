import 'package:flutter/material.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class AccountCardWidget extends StatelessWidget {
  const AccountCardWidget({
    super.key,
    required this.title,
    required this.iconPath,
    this.onTap,
    this.iconColor,
  });
  final String iconPath;
  final String title;
  final void Function()? onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: AppSize.width(value: 20.0), vertical: AppSize.width(value: 10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                AppImage(
                  width: AppSize.width(value: 25),
                  height: AppSize.width(value: 25),
                  path: iconPath,
                  iconColor: iconColor ?? AppColors.primary,
                ),
                Gap(width: 10),
                AppText(
                  data: title,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: AppSize.width(value: 15),
            )
          ],
        ),
      ),
    );
  }
}
