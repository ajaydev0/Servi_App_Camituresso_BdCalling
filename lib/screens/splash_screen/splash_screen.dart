import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:servi_app_camituresso/const/assets_images_path.dart';
import 'package:servi_app_camituresso/const/assets_lottie_path.dart';
import 'package:servi_app_camituresso/screens/splash_screen/controllers/splash_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppSize.size = size;
    return GetBuilder(
      init: SplashScreenController(),
      builder: (controller) {
        return Scaffold(
          extendBody: true,
          body: Stack(
            fit: StackFit.expand,
            children: [
              const AppImage(
                fit: BoxFit.fill,
                path: AssetsImagesPath.splash,
              ),
              Positioned(
                bottom: 0,
                left: AppSize.width(value: 100),
                right: AppSize.width(value: 100),
                child: LottieBuilder.asset(AssetsLottiePath.loading),
              )
            ],
          ),
        );
      },
    );
  }
}
