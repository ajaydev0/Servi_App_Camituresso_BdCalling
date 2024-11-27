import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class PrivacyAndPolicyScreen extends StatelessWidget {
  const PrivacyAndPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppText(
          data: "Privacy And Policy",
          fontWeight: FontWeight.w600,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Container(
            width: Get.width,
            height: 1,
            color: AppColors.black50,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSize.width(value: 10.0)),
        child: AppText(
            data:
                """Welcome to Servi! We are passionate about connecting people with [the app's core purpose]. Our journey began in [Year], with a simple idea: to make [the key service or benefit the app provides] more accessible and enjoyable for everyone. At Servi, we believe in innovation, simplicity, and putting our users first. Our app is designed to [describe the main function or unique feature of the app]. Whether you're [target audience or user activity], our goal is to provide you with a seamless and engaging experience.
      """),
      ),
    );
  }
}
