import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/screens/navigation_screen/model/notification_screen_model.dart';
import 'package:servi_app_camituresso/screens/navigation_screen/screens/notification_screen.dart';
import 'package:servi_app_camituresso/services/app_storage/app_auth_storage.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class NavigationScreenController extends GetxController {
  late IO.Socket socket;
  int pageNumber = 1;

  // observable list and variables
  RxList<Notifications> notificationListData = <Notifications>[].obs;
  RxInt selectedIndex = RxInt(0);
  RxBool isLoading = false.obs;
  RxBool hasMore = true.obs;

  // controller
  final scrollController = ScrollController();

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

  // load notification data
  loadNotificationData() async {
    var response = await Repository().getNotificationData(page: pageNumber);
    if (response.success) {
      if (response.data.notifications.isNotEmpty) {
        if (pageNumber == 1) {
          notificationListData.value = response.data.notifications;
        } else {
          notificationListData.addAll(response.data.notifications);
        }
        pageNumber++;
      } else {
        hasMore.value = false;
      }
    }
  }

  // Get Notification initial Data
  getNotificationInitialData() async {
    try {
      isLoading.value = true;
      await loadNotificationData();
      await Repository().redNotificationData(page: pageNumber);
      log('Notification length: ${notificationListData.length}');
      isLoading.value = false;
    } catch (e) {
      isLoading.value = true;
      log('error form getNotificationInitialData method: $e');
    }
  }

  // notification socket connection
  void appSocketConnect() {
    try {
      socket = IO.io(
        AppApiUrl.socketUrl,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .setReconnectionAttempts(3)
            .build(),
      );

      socket.connect();

      socket.onConnect((_) {
        log('Connected to the socket server');
      });

      socket.onDisconnect((data) {
        log("Socket disconnected: $data");
      });

      socket.onConnectError((data) {
        log("Socket connection error: $data");
      });

      socket.onError((data) {
        log("Socket error: $data");
      });

      socket.onPing((data) {
        log("Socket ping: $data");
      });

      // Listen for notifications and update the list
      socket.on("getNotification::${AppAuthStorage().getChatID()}", (data) {
        log("Notification received: $data");
        try {
          final notification = Notifications.fromJson(data);
          log(notification.toString());
          notificationListData.insert(
              0, notification); // Add new notification to the top
        } catch (e) {
          log("Error processing notification: $e");
        }
      });
    } catch (e) {
      log("Error during socket connection setup: $e");
    }
  }

  // pagination Logic
  onInitializeDataLoad() {
    try {
      getNotificationInitialData();
      scrollController.addListener(
        () {
          if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent) {
            hasMore.value =
                true; // when both are equal then it will be true to access the loadLisData method for check data

            if (hasMore.value) {
              loadNotificationData();
            }
          }
        },
      );
    } catch (e) {
      log("onInitializeDataLoad error: $e");
    }
  }

  @override
  void onInit() {
    onInitializeDataLoad();
    appSocketConnect();
    super.onInit();
  }

  @override
  void onClose() {
    socket.disconnect();
    scrollController.dispose();
  }
}
