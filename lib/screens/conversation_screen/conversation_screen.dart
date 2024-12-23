import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/const/assets_images_path.dart';
import 'package:servi_app_camituresso/screens/conversation_screen/controllers/conversation_card_selection_function.dart';
import 'package:servi_app_camituresso/screens/conversation_screen/controllers/conversation_offer_dialog.dart';
import 'package:servi_app_camituresso/screens/conversation_screen/controllers/conversation_screen_controller.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image_circular.dart';
import 'package:servi_app_camituresso/widgets/inputs/app_input_widget.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ConversationScreenController(),
        builder: (controller) {
          return Scaffold(
            extendBody: true,
            appBar: AppBar(
              backgroundColor: const Color(0xffFBF6E4),
              forceMaterialTransparency: true,
              title: Row(
                children: [
                  AppImageCircular(
                    width: AppSize.width(value: 40),
                    height: AppSize.width(value: 40),
                    url:
                        "${AppApiUrl.domaine}${controller.argData.participants![0].profile}",
                  ),
                  const Gap(width: 10),
                  Expanded(
                      child: AppText(
                          data: controller.argData.participants![0].name ?? "",
                          color: AppColors.black900,
                          fontWeight: FontWeight.w800)),
                ],
              ),
              actions: [
                GestureDetector(
                    onTap: () {
                      conversationOfferDialog(controller);
                    },
                    child: const AppText(
                        data: "Offer",
                        color: AppColors.black900,
                        fontWeight: FontWeight.w500)),
                const Gap(width: 20)
              ],
            ),
            body: Stack(
              fit: StackFit.expand,
              children: [
                AppImage(
                  width: Get.width,
                  height: Get.height,
                  path: AssetsImagesPath.conversation,
                ),
                SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: Obx(
                    () => Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.width(value: 10.0)),
                      child: ListView.builder(
                        controller: controller.scrollController,
                        itemCount: controller.listOfConversation.length,
                        itemBuilder: (context, index) {
                          var item = controller.listOfConversation[index];
                          return conversationCardSelectionFunction(
                            item: item,
                            isLast: index ==
                                controller.listOfConversation.length - 1,
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: AppSize.width(value: 20.0),
                  vertical: AppSize.width(value: 10.0)),
              child: Row(
                children: [
                  Expanded(
                      child: AppInputWidget(
                    controller: controller.messageTextEditingController,
                    fillColor: AppColors.white100,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: AppSize.width(value: 10)),
                    borderRadius:
                        BorderRadius.circular(AppSize.width(value: 20.0)),
                    hintText: "Type a message",
                    suffixIconConstraints:
                        BoxConstraints(maxWidth: AppSize.width(value: 80)),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.callImageSend(ImageSource.camera);
                          },
                          child: AppImage(
                            width: AppSize.width(value: 22),
                            height: AppSize.width(value: 22),
                            path: AssetsIconsPath.camera,
                          ),
                        ),
                        const Gap(width: 10),
                        GestureDetector(
                          onTap: () {
                            controller.callImageSend(ImageSource.gallery);
                          },
                          child: AppImage(
                            width: AppSize.width(value: 22),
                            height: AppSize.width(value: 22),
                            path: AssetsIconsPath.file,
                          ),
                        ),
                        Gap(width: 10),
                      ],
                    ),
                  )),
                  Gap(width: 10),
                  GestureDetector(
                    onTap: () {
                      controller.sendMessage();
                    },
                    child: AppImage(
                      width: AppSize.width(value: 40),
                      height: AppSize.width(value: 40),
                      path: AssetsIconsPath.chatSendButton,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
