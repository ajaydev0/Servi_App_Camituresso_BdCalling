import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/services/api/services/api_post_services.dart';
import 'package:servi_app_camituresso/widgets/app_snack_bar/app_snack_bar.dart';

class OtpVerificationScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isEmailVerification = RxBool(false);
  GlobalKey<FormState> verificationCodeKey = GlobalKey<FormState>();
  TextEditingController otp1TextEditingController = TextEditingController();
  TextEditingController otp2TextEditingController = TextEditingController();
  TextEditingController otp3TextEditingController = TextEditingController();
  TextEditingController otp4TextEditingController = TextEditingController();
  TextEditingController otp5TextEditingController = TextEditingController();
  TextEditingController otp6TextEditingController = TextEditingController();
  RxString argMail = RxString("");
  final RxInt _seconds = 0.obs;
  RxInt get seconds => _seconds;
  late Isolate _isolate;

  setArgData() {
    try {
      var argData = Get.arguments;
      if (argData.runtimeType != Null) {
        if (argData is String) {
          argMail.value = argData.toString();
        } else if (argData is Map) {
          argMail.value = argData["email"];
          isEmailVerification.value = true;
        }
      }
      startTimer();
    } catch (e) {
      log("error form otp verification arg set data function : $e");
    }
  }

  clickVerificationCodeButton() async {
    try {
      if (verificationCodeKey.currentState!.validate()) {
        isLoading.value = true;
        String merge =
            "${otp1TextEditingController.text}${otp2TextEditingController.text}${otp3TextEditingController.text}${otp4TextEditingController.text}${otp5TextEditingController.text}${otp6TextEditingController.text}";
        int otpMerge = int.parse(merge);
        if (isEmailVerification.value) {
          // This is for Sign Up Verification OTP
          var data = await ApiPostServices().apiPostServices(
            url: AppApiUrl.verifyEmailUrl,
            body: {"email": argMail.value, "oneTimeCode": otpMerge},
          );

          if (data != null) {
            Get.back(times: 2);
            AppSnackBar.success("Authentication Successful");
          }
        } else {
          // This is for Forget Password Verification OTP
          isLoading.value = true;
          var data = await ApiPostServices().apiPostServices(
            url: AppApiUrl.verifyEmailUrl,
            body: {"email": argMail.value, "oneTimeCode": otpMerge},
          );

          if (data != null) {
            Get.toNamed(AppRoutes.resetPasswordScreen, arguments: data["data"]);
          }
        }
      }
    } catch (e) {
      log("error form click verification code function button : $e");
    } finally {
      isLoading.value = false;
    }
  }

  clickResendOTP() async {
    var url = AppApiUrl.baseUrl;
    var data = await ApiPostServices().apiPostServices(
      url: "$url/auth/forgot-password",
      body: {"email": argMail.toString()},
    );
    if (data != null) {
      AppSnackBar.success("Code Sended your E-Mail...");
    }
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;

    if (minutes > 0) {
      return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
    } else {
      return '$remainingSeconds';
    }
  }

  void startTimer() async {
    try {
      final receivePort = ReceivePort();
      _isolate = await Isolate.spawn(_isolateEntryPoint, receivePort.sendPort);
      receivePort.listen((data) {
        _seconds.value = data as int;
        if (_seconds.value <= 0) {
          stopTimer();
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }

  reCallStatTimer() {
    if (seconds.value == 0) {
      startTimer();
      // Call to Send OTP
      clickResendOTP();
    }
  }

  void stopTimer() {
    try {
      _isolate.kill(priority: Isolate.immediate);
      _seconds.value = 0;
    } catch (e) {
      log(e.toString());
    }
  }

  static void _isolateEntryPoint(SendPort sendPort) {
    int seconds = 120;

    void timerCallback(Timer timer) {
      seconds--;
      sendPort.send(seconds);
      if (seconds <= 0) {
        timer.cancel();
      }
    }

    Timer.periodic(const Duration(seconds: 1), timerCallback);
  }

  @override
  void onClose() {
    super.onClose();
    stopTimer();
  }

  @override
  void onInit() {
    super.onInit();
    setArgData();
  }
}
