import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/screens/terms_and_condition_screen/controllers/terms_and_condition_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TermsAndConditionScreenController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const AppText(
              data: "Terms And Condition",
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
                          controller.termsAndConditionData.value,
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
      },
    );
  }
}
