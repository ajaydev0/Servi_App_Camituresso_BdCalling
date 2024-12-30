import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/screens/payment_webview_screen/controller/payment_webview_screen_controller.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebviewScreen extends StatelessWidget {
  const PaymentWebviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentWebviewScreenController>(
      init: PaymentWebviewScreenController(), // Initialize controller
      builder: (controller) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white,
          ),
          child: Scaffold(
            appBar: AppBar(
              title: const AppText(data: 'Payment Page'),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Obx(
                  () => controller.webLoading.value < 1
                      ? LinearProgressIndicator(
                          value: controller.webLoading.value,
                        )
                      : const SizedBox(),
                ),
                Expanded(
                    child: WebViewWidget(controller: controller.controller)),
              ],
            ),
          ),
        );
      },
    );
  }
}
