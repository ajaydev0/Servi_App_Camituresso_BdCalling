import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/app_const.dart';
import 'package:servi_app_camituresso/const/assets_icons_path.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/screens/chat_screen/controllers/chat_screen_controller.dart';
import 'package:servi_app_camituresso/widgets/texts/time_text_format.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image_circular.dart';
import 'package:servi_app_camituresso/widgets/inputs/app_input_widget.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ChatScreenController(),
      builder: (controller) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(AppSize.width(value: 100)),
            child: SafeArea(
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: AppSize.height(value: 20),
                    vertical: AppSize.height(value: 12)),
                child: AppInputWidget(
                  filled: true,
                  fillColor: AppColors.black50,
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (p0) {},
                  prefix: Center(
                    child: AppImage(
                      width: AppSize.width(value: 30),
                      height: AppSize.width(value: 30),
                      path: AssetsIconsPath.search,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: AppSize.width(value: 10)),
                  borderRadius: BorderRadius.circular(AppSize.width(value: 50)),
                ),
              ),
            ),
          ),
          body: ListView.builder(
            itemCount: controller.chatList.length,
            itemBuilder: (context, index) {
              var item = controller.chatList[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.conversationScreen, arguments: item);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
                  decoration: BoxDecoration(
                      color:
                          // item.readeMessage
                          true
                              ? AppColors.black50
                              : AppColors.black50.withOpacity(0.3),
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppSize.width(value: 30)))
                      //  false
                      //     // index == 0 && !item.readeMessage
                      //     ? BorderRadius.only(
                      //         topLeft: Radius.circular(AppSize.width(value: 30)),
                      //         topRight: Radius.circular(AppSize.width(value: 30)),
                      //       )
                      //     : true
                      //         //  !item.readeMessage && item.isLast
                      //         ? BorderRadius.only(
                      //             bottomLeft:
                      //                 Radius.circular(AppSize.width(value: 30)),
                      //             bottomRight:
                      //                 Radius.circular(AppSize.width(value: 30)),
                      //           )
                      //         : null,
                      ),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: AppSize.width(value: 10.0),
                      vertical: 2,
                    ),
                    decoration: const BoxDecoration(
                        border: Border(
                            // bottom:
                            //  true
                            //  !item.readeMessage && item.isLast
                            // ? BorderSide.none
                            // :
                            // BorderSide(color: AppColors.black200),
                            )),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: AppImageCircular(
                        url: item.participants![0].profile ==
                                AppConst.nullImageUrl
                            ? item.participants![0].profile
                            : "${AppApiUrl.domaine}${item.participants![0].profile}",
                        // url:
                        //     "${AppApiUrl.domaine}${item.participants![0].profile}",
                        width: AppSize.width(value: 50),
                        height: AppSize.width(value: 50),
                      ),
                      title: AppText(
                        data: item.participants![0].name ?? "",
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      // trailing: AppText(
                      //   data: timeTextFormate(item.lastMessage?.createdAt.toString() ?? ""),
                      //   color: AppColors.black200,
                      // ),
                      subtitle:
                          //  true
                          //  item.isSender
                          // ? Row(
                          //     children: [
                          //       AppText(data: "You: "),
                          //       Expanded(
                          //           child: AppText(
                          //         data: item.lastMessage?.text ?? "",
                          //         color: AppColors.black300,
                          //       ))
                          //     ],
                          //   )
                          // :
                          AppText(
                        data: item.lastMessage?.text ?? "",
                        color: AppColors.black300,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
