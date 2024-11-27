import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

Widget itemBuildFunction({required List<Widget> items, required EdgeInsetsGeometry padding, double dividedValue = 2}) {
  // >>>>>>>>>>>>>>>>>>>>>> dynamic horizontal list view builder using Sliver  <<<<<<<<<<<<<<<<<<<<<<

  return SliverToBoxAdapter(
    child: LayoutBuilder(builder: (context, boxConstraints) {
      double dynamicHeight = boxConstraints.maxWidth / dividedValue;
      return SizedBox(
        width: Get.width,
        height: dynamicHeight,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return FittedBox(
              child: Padding(
                padding: padding,
                child: items[index],
              ),
            );
          },
        ),
      );
    }),
  );
}

SliverToBoxAdapter itemTitleOption({required void Function()? onTapCall, required String name}) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            data: name,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
          GestureDetector(
            onTap: onTapCall,
            child: const AppText(
              data: "View All",
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    ),
  );
}
