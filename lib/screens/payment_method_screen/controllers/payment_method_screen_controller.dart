import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/screens/payment_method_screen/model/payment_create_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class PaymentMethodScreenController extends GetxController {
  RxBool payOnCash = RxBool(true);
  dynamic productPrice = 0.obs;
  PaymentCreateModel createPaymentData = PaymentCreateModel();

  // Function to launch the URL
  void flutterTab(BuildContext context) async {
    final theme = Theme.of(context);
    try {
      await launchUrl(
        Uri.parse(createPaymentData.data ?? ""),
        customTabsOptions: CustomTabsOptions(
          colorSchemes: CustomTabsColorSchemes.defaults(
              // toolbarColor: theme.colorScheme.surface,
              toolbarColor: AppColors.primary),
          shareState: CustomTabsShareState.on,
          urlBarHidingEnabled: true,
          showTitle: true,
          closeButton: CustomTabsCloseButton(
            icon: CustomTabsCloseButtonIcons.back,
          ),
        ),
        safariVCOptions: SafariViewControllerOptions(
          preferredBarTintColor: theme.colorScheme.surface,
          preferredControlTintColor: theme.colorScheme.onSurface,
          barCollapsingEnabled: true,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  createPaymentUrl() async {
    Map<String, dynamic> body = {
      "price": productPrice.value,
    };

    var data = await Repository().createPayment(body);
    if (data != null) {
      createPaymentData = data;
    }
  }

  @override
  void onInit() {
    productPrice.value = Get.arguments;
    createPaymentUrl();
    super.onInit();
  }
}
