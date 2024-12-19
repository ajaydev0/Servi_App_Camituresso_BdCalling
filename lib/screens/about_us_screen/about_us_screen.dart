import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/screens/about_us_screen/controllers/about_us_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AboutUsScreenController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const AppText(
                data: "About us",
                fontWeight: FontWeight.w600,
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(2),
                child: Container(
                  width: Get.width,
                  height: 1,
                  color: AppColors.black50,
                ),
              ),
            ),
            body: Obx(
              () => controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ))
                  : Padding(
                      padding: EdgeInsets.all(AppSize.width(value: 20.0)),
                      child: SingleChildScrollView(
                        child: SizedBox(
                          width: AppSize.size.width,
                          child: HtmlWidget(
                            controller.aboutUsData.value,
                            customStylesBuilder: (element) {
                              if (element.localName == 'span' &&
                                  element.attributes['style']
                                          ?.contains('white-space:pre-wrap') ==
                                      true) {
                                return {'white-space': 'normal'};
                              }
                              return null;
                            },
                            textStyle: const TextStyle(
                                fontSize: 16, color: AppColors.black800),
                          ),
                        ),
                      )),
            ),
          );
        });
  }
}
