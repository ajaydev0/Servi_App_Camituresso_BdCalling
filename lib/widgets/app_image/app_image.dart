import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_images_path.dart';

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

  final String? path;
  final String? filePath;
  final String? url;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Color color;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    if (filePath != null) {
      return Image.file(
        File(filePath!),
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          log("File image load error: $error");
          return _placeholder();
        },
      );
    }

    if (url != null) {
      return Image.network(
        url!,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          log("Network image load error: $error");
          return _placeholder();
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _loadingPlaceholder();
        },
      );
    }

    if (path != null) {
      return Image.asset(
        path!,
        width: width,
        height: height,
        fit: fit,
        color: iconColor,
        errorBuilder: (context, error, stackTrace) {
          log("Asset image load error: $error");
          return _placeholder();
        },
      );
    }

    return _placeholder();
  }

  Widget _placeholder() {
    return Container(
      width: width,
      height: height,
      color: AppColors.yellow100,
      alignment: Alignment.center,
      child: Icon(
        Icons.image_not_supported,
        color: Colors.grey,
        size: width != null && height != null ? (width! * 0.5) : 50,
      ),
    );
  }

  Widget _loadingPlaceholder() {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      color: AppColors.yellow100,
      child: const CircularProgressIndicator(
        color: Colors.black,
      ),
    );
  }
}
