import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    this.color = Colors.yellow,
    this.fit = BoxFit.fill,
    this.height,
    this.path,
    this.url,
    this.width,
    this.filePath,
    this.iconColor,
  });
  // >>>>>>>>>>>>>>>>>>>>>> parameter accept this data  <<<<<<<<<<<<<<<<<<<<<<
  final String? path;
  final String? filePath;
  final String? url;
  final BoxFit? fit;
  final double? width; // >>>>>>>>>>>>>>>>>>>>>> width and height provide by default size when parameter not provide <<<<<<<<<<<<<<<<<<<<<<
  final double? height;
  final Color color;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    // >>>>>>>>>>>>>>>>>>>>>> file image is first <<<<<<<<<<<<<<<<<<<<<<
    if (filePath != null) {
      return Image.file(
        File(filePath!),
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          log("error form file image : $error");
          return Container(
            width: width,
            height: height,
            color: AppColors.yellow100,
          );
        },
      );
    }

    // >>>>>>>>>>>>>>>>>>>>>> second network image  <<<<<<<<<<<<<<<<<<<<<<
    if (url != null) {
      return Image.network(
        url!,
        width: width,
        height: height,
        fit: fit,
        // >>>>>>>>>>>>>>>>>>>>>> when failed load image  <<<<<<<<<<<<<<<<<<<<<<
        errorBuilder: (context, error, stackTrace) {
          log(error.toString());
          return Container(
            width: width,
            height: height,
            color: AppColors.yellow100,
          );
        },
        // >>>>>>>>>>>>>>>>>>>>>> when image is loading <<<<<<<<<<<<<<<<<<<<<<
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: width,
            height: height,
            color: AppColors.yellow100,
            child: const SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(),
            ),
          );
        },
      );
    }

    // >>>>>>>>>>>>>>>>>>>>>> thread local image or assets <<<<<<<<<<<<<<<<<<<<<<
    if (path != null) {
      return Image.asset(
        path!,
        width: width,
        height: height,
        fit: fit,
        color: iconColor,
        // >>>>>>>>>>>>>>>>>>>>>> when load fail image  <<<<<<<<<<<<<<<<<<<<<<
        errorBuilder: (context, error, stackTrace) {
          log(error.toString());
          return Container(
            width: width,
            height: height,
            color: AppColors.yellow100,
          );
        },
      );
    }
    // >>>>>>>>>>>>>>>>>>>>>>by default widget return  <<<<<<<<<<<<<<<<<<<<<<
    return Container(
      width: width,
      height: height,
      color: color,
    );
  }
}
