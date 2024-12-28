import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/screens/navigation_screen/model/notification_screen_model.dart';
import 'package:servi_app_camituresso/screens/navigation_screen/screens/notification_screen.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class NavigationScreenController extends GetxController {
  RxInt selectedIndex = RxInt(0);
  RxList<Notifications> notificationListData = <Notifications>[].obs;
  RxBool isLoading = false.obs;

  changeIndex(int index) {
    selectedIndex.value = index;
  }

  ////////////////  notification
  callNotification() {
    showGeneralDialog(
      context: Get.context!,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 1000),
      pageBuilder: (context, animation, secondaryAnimation) {
        return const NotificationScreen();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: CurvedAnimation(parent: animation, curve: Curves.easeInOut)
              .drive(Tween<Offset>(
            begin: const Offset(0, -1.0),
            end: Offset.zero,
          )),
          child: child,
        );
      },
    );
  }

  // Get Notification Data
  notificationDataGet() async {
    try{
      isLoading.value = true;
      var response = await Repository().getNotificationData();
      notificationListData.value = response.data.notifications;
      log('Notification length: ${notificationListData.length}');
      isLoading.value = false;
    }catch(e){
      isLoading.value = true;
      log('error form notificationDataGet method: $e');
    }
  }

  @override
  void onInit() {
    notificationDataGet();
    super.onInit();
  }
}
