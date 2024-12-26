import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/const/assets_images_path.dart';
import 'package:servi_app_camituresso/screens/conversation_screen/controllers/conversation_screen_controller.dart';
import 'package:servi_app_camituresso/services/app_storage/app_auth_storage.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image_circular.dart';
import 'package:servi_app_camituresso/widgets/inputs/app_input_widget_chat.dart';
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
                    // path: AssetsImagesPath.splash,
                    // url: controller.argData.participants?[0].profile ==
                    //         AppConst.nullImageUrl
                    //     ? "${controller.argData.participants?[0].profile}"
                    //     : "${AppApiUrl.domaine}${controller.argData.participants?[0].profile}",

                    url:
                        "${AppApiUrl.domaine}${controller.argData.participants?[0].profile}",
                  ),
                  const Gap(width: 10),
                  Expanded(
                      child: AppText(
                          // data: "name",
                          // data: "User Name",
                          data: controller.argData.participants?[0].name ?? "",
                          color: AppColors.black900,
                          fontWeight: FontWeight.w800)),
                ],
              ),
              actions: [
                GestureDetector(
                    onTap: () {
                      // conversationOfferDialog(controller);
                    },
                    child: const AppText(
                        data: "Offer",
                        color: AppColors.black900,
                        fontWeight: FontWeight.w500)),
                const Gap(width: 20)
              ],
            ),
            body: Obx(
              () => Stack(
                children: [
                  // Background Image
                  AppImage(
                    width: AppSize.size.width,
                    height: AppSize.size.height,
                    path: AssetsImagesPath.conversation,
                  ),
                  // Chat Container
                  controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                      : Positioned.fill(
                          child: GestureDetector(
                            onTap: () {
                              controller.outSideClick();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 80),
                              child: Obx(
                                () => ListView.builder(
                                  reverse: true,
                                  controller: controller.scrollController,
                                  itemCount:
                                      controller.listOfMessageData.length +
                                          (controller.hasMore.value ? 1 : 0),
                                  itemBuilder: (context, index) {
                                    // Show loading indicator for pagination if it's the last index and more data is being fetched
                                    if (index ==
                                        controller.listOfMessageData.length) {
                                      if (controller.hasMore.value &&
                                          controller.isLoadingMore.value) {
                                        return const Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: CircularProgressIndicator(
                                              color: Colors.black,
                                            ),
                                          ),
                                        );
                                      } else {
                                        return const SizedBox(); // Placeholder when no more data to load
                                      }
                                    }

                                    // Render message item
                                    var item =
                                        controller.listOfMessageData[index];
                                    return Align(
                                      alignment: item.sender ==
                                              AppAuthStorage().getChatID()
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                      child: controller.showMessage(item),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),

            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButtonAnimator:
                FloatingActionButtonAnimator.noAnimation,
            floatingActionButton: AnimatedContainer(
              duration: const Duration(seconds: 200),
              height: AppSize.size.height * 0.057,
              width: AppSize.size.width,
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                right: AppSize.width(value: 10.0),
                left: AppSize.width(value: 10.0),
              ),
              child: controller.isOnTextFeild.value
                  ? Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              controller.isOnTextFeild.value = false;
                              controller.update();
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_right,
                              size: 30,
                            )),
                        Expanded(
                          child: AppInputWidgetChat(
                            hintText: "message",
                            cursorColor: AppColors.gray,
                            focusNode: controller.focuse.value == true
                                ? controller.focusNode
                                : null,
                            filled: true,
                            fillColor: AppColors.white400,
                            textInputAction: TextInputAction.newline,
                            controller: controller.chatController,
                            onTap: () {},
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  AppSize.width(value: 50)),
                              borderSide:
                                  const BorderSide(color: AppColors.gray),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: AppSize.width(value: 20),
                            ),
                          ),
                        ),
                        const Gap(width: 10),
                        InkWell(
                          onTap: () {
                            controller.sendMessage(
                                // controller.chatController.text,
                                // formatTime2(DateTime.now().toString())
                                );
                          },
                          child: const AppImage(
                            path: AssetsIconsPath.chatSendButton,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Looks
                        InkWell(
                          onTap: () {
                            // controller.sendImage(ImageSource.gallery,
                            //     formatTime2(DateTime.now().toString()));
                          },
                          child: const AppImage(
                            path: AssetsIconsPath.imagePick,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // controller.sendImage(ImageSource.camera,
                            //     formatTime2(DateTime.now().toString()));
                          },
                          child: const AppImage(
                            path: AssetsIconsPath.cameraPick,
                          ),
                        ),
                        const Gap(width: 5),
                        if (controller.chatController.text != "")
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: AppInputWidgetChat(
                                hintText: "message",
                                cursorColor: AppColors.black500,
                                onTap: () {
                                  controller.isOnTextFeild.value = true;
                                  controller.focuse.value = true;
                                  controller.update();

                                  controller.focuse.value == true
                                      ? controller.focusNode.requestFocus()
                                      : null;
                                },
                                readOnly: true,
                                filled: true,
                                fillColor: AppColors.white200,
                                textInputAction: TextInputAction.newline,
                                controller: controller.chatController,
                                onFieldSubmitted: (p0) {
                                  // controller.searchData();
                                },
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppSize.width(value: 50)),
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(.7)),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: AppSize.width(value: 20),
                                ),
                              ),
                            ),
                          ),
                        const Gap(width: 5),
                        if (controller.chatController.text == "")
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: AppInputWidgetChat(
                                hintText: "Type a message",
                                readOnly: true,
                                cursorColor: AppColors.black500,
                                onTap: () {
                                  controller.isOnTextFeild.value = true;
                                  controller.focuse.value = true;
                                  controller.update();

                                  controller.focuse.value == true
                                      ? {
                                          controller.focusNode.requestFocus(),
                                          // controller.scrollToBottom()
                                        }
                                      : null;
                                },
                                filled: true,
                                fillColor: AppColors.white300,
                                textInputAction: TextInputAction.newline,
                                controller: controller.chatController,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppSize.width(value: 50)),
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(.7)),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: AppSize.width(value: 20),
                                  // vertical: AppSize.width(value: 6)
                                ),
                              ),
                            ),
                          ),
                        const Gap(width: 5),

                        InkWell(
                          onTap: () {
                            controller.sendMessage(
                                // controller.chatController.text,
                                // formatTime2(DateTime.now().toString())
                                );
                            // controller.conncectSocket();
                            // controller.sendMessageApi();
                            // print(AppAuthStorage().getChatID());

                            // log("${controller.listOfMessageData}");

                            // controller.sendMessage(
                            //     controller.chatController.text,
                            //     formatTime2(DateTime.now().toString()));
                          },
                          child: const AppImage(
                            path: AssetsIconsPath.chatSendButton,
                          ),
                        ),
                      ],
                    ),
            ),
            // floatingActionButtonLocation:
            //     FloatingActionButtonLocation.centerDocked,
            // floatingActionButton: Container(
            //   margin: EdgeInsets.symmetric(
            //       horizontal: AppSize.width(value: 20.0),
            //       vertical: AppSize.width(value: 10.0)),
            //   child: Row(
            //     children: [
            //       Expanded(
            //           child: AppInputWidget(
            //         controller: controller.messageTextEditingController,
            //         fillColor: AppColors.white100,
            //         contentPadding: EdgeInsets.symmetric(
            //             horizontal: AppSize.width(value: 10)),
            //         borderRadius:
            //             BorderRadius.circular(AppSize.width(value: 20.0)),
            //         hintText: "Type a message",
            //         suffixIconConstraints:
            //             BoxConstraints(maxWidth: AppSize.width(value: 80)),
            //         suffixIcon: Row(
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             GestureDetector(
            //               onTap: () {
            //                 controller.callImageSend(ImageSource.camera);
            //               },
            //               child: AppImage(
            //                 width: AppSize.width(value: 22),
            //                 height: AppSize.width(value: 22),
            //                 path: AssetsIconsPath.camera,
            //               ),
            //             ),
            //             const Gap(width: 10),
            //             GestureDetector(
            //               onTap: () {
            //                 controller.callImageSend(ImageSource.gallery);
            //               },
            //               child: AppImage(
            //                 width: AppSize.width(value: 22),
            //                 height: AppSize.width(value: 22),
            //                 path: AssetsIconsPath.file,
            //               ),
            //             ),
            //             Gap(width: 10),
            //           ],
            //         ),
            //       )),
            //       Gap(width: 10),
            //       GestureDetector(
            //         onTap: () {
            //           controller.sendMessage();
            //         },
            //         child: AppImage(
            //           width: AppSize.width(value: 40),
            //           height: AppSize.width(value: 40),
            //           path: AssetsIconsPath.chatSendButton,
            //         ),
            //       )
            //     ],
            //   ),
            // ),
          );
        });
  }
}
