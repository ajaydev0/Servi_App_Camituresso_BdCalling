import 'package:flutter/material.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';

class Gap extends StatelessWidget {
  const Gap({
    super.key,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.height(value: height ?? 0),
      width: AppSize.width(value: width ?? 0),
    );
  }
}
