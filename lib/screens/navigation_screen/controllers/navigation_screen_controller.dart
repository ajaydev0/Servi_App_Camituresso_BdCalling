import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/screens/navigation_screen/model/notification_model.dart';
import 'package:servi_app_camituresso/screens/navigation_screen/screens/notification_screen.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class NavigationScreenController extends GetxController {
  RxInt selectedIndex = RxInt(0);
  // var notification = GetNotificationModel(
  //   data: Data(
  //     result: [],
  //     unreadCount: null,
  //   ),
  // ).obs;

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
    // var data = await Repository().getNotificationData();
    // notification.value = data;
  }

  @override
  void onInit() {
    // notificationDataGet();
    super.onInit();
  }
}
