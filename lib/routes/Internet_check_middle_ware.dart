// ignore: file_names

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/screens/error_screen/error_screen.dart';
import 'package:servi_app_camituresso/services/connectivity_service/connectivity_service.dart';

class InternetCheckMiddleWare extends GetMiddleware {
  final ConnectivityService connectivityService = Get.find<ConnectivityService>();

  @override
  RouteSettings? redirect(String? route) {
    if (connectivityService.connectionStatus.contains(ConnectivityResult.none)) {
      return const RouteSettings(name: AppRoutes.errorScreen);
    }
    return super.redirect(route);
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    if (connectivityService.connectionStatus.contains(ConnectivityResult.none)) {
      return GetPage(name: AppRoutes.errorScreen, page: () => const ErrorScreen());
    }
    return super.onPageCalled(page);
  }

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    if (connectivityService.connectionStatus.contains(ConnectivityResult.none)) {
      return () => const ErrorScreen();
    }
    return super.onPageBuildStart(page);
  }

  @override
  FutureOr<RouteDecoder?> redirectDelegate(RouteDecoder route) {
    connectivityService.connectionStatus;
    if (connectivityService.connectionStatus.contains(ConnectivityResult.none)) {
      return RouteDecoder.fromRoute(AppRoutes.errorScreen);
    } else {
      return super.redirectDelegate(route);
    }
  }
}
