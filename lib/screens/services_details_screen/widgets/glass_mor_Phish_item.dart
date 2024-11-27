import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';

class GlassMorPhishItem extends StatelessWidget {
  final Widget child;

  const GlassMorPhishItem({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.width(value: 100),
      height: AppSize.width(value: 30),
      child: FittedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.yellow300,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: AppColors.yellow300,
                ),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
