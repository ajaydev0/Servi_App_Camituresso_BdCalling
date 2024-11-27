import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/routes/app_routes_file.dart';
import 'package:servi_app_camituresso/utils/app_theme.dart';

class MainAppEntry extends StatelessWidget {
  const MainAppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Servi",
      enableLog: true,
      initialRoute: AppRoutes.initial,
      theme: appThemeData,
      getPages: appRoutesFile,
      defaultTransition: Transition.zoom,
      themeMode: ThemeMode.light,
      defaultGlobalState: true,
      transitionDuration: const Duration(microseconds: 250),
    );
  }
}
