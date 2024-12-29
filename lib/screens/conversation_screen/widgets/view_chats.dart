import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/screens/conversation_screen/controllers/conversation_screen_controller.dart';
import 'package:servi_app_camituresso/screens/conversation_screen/model/message_list_model.dart';
import 'package:servi_app_camituresso/screens/conversation_screen/widgets/full_view_image.dart';
import 'package:servi_app_camituresso/screens/conversation_screen/widgets/message_time_format.dart';
import 'package:servi_app_camituresso/services/app_storage/app_auth_storage.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

Widget showMessage(
    MessageListModel item, int index, ConversationScreenController controller) {
  RxBool isload = false.obs;
  if (item.messageType == "text") {
    // if Text value is no null then Show Text
    return Column(
      crossAxisAlignment: item.sender == AppAuthStorage().getChatID()
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.symmetric(vertical: AppSize.height(value: 10)),
            constraints: BoxConstraints(
              maxWidth: AppSize.size.width * 0.7,
            ),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color:
                    //  message["user"] == "professional"
                    //     ? AppColors.chatBoxColor
                    //     :
                    item.sender == AppAuthStorage().getChatID()
                        ? const Color(0xffE9D7A1)
                        : AppColors.white100,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: item.sender == AppAuthStorage().getChatID()
                      ? const Radius.circular(20)
                      : const Radius.circular(0),
                  bottomRight: item.sender == AppAuthStorage().getChatID()
                      ? const Radius.circular(0)
                      : const Radius.circular(20),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  data: item.text ?? "",
                  color: AppColors.black900,
                  fontSize: 16,
                  textAlign: TextAlign.justify,
                  height: 1.5,
                ),
              ],
            )),
        AppText(
          data: formatTime(item.createdAt ?? ""),
          color: AppColors.black900,
          fontSize: 12,
        ),
      ],
    );
  } else if (item.messageType == "image") {
    // if Image value is no null then Show Image
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: AppSize.height(value: 10),
      ),
      constraints: BoxConstraints(
        maxWidth: AppSize.size.width * 0.7,
        // maxHeight: AppSize.size.height * 0.20
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: item.sender == AppAuthStorage().getChatID()
              ? const Color(0xffE9D7A1)
              : AppColors.white100,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20))),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  Get.context!,
                  MaterialPageRoute(
                    builder: (_) => FullScreenImageViewer(
                        image: "${AppApiUrl.domaine}${item.image}"),
                  ),
                );
              },
              child: AppImage(
                // path: AssetsImagesPath.splash,
                url: "${AppApiUrl.domaine}${item.image}",
                height: 250,
                fit: BoxFit.fitWidth,
              ),
              //  Image.file(
              //   "",
              //   // message['image'],
              //   height: 250,
              //   fit: BoxFit.fitWidth,
              // ),
            ),
          ),
          const Gap(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppText(
                data: formatTime(item.createdAt ?? ""),
                // data: message["time"],
                color: AppColors.black400,
                fontSize: 12,
              ),
            ],
          ),
        ],
      ),
    );
  } else if (item.messageType == "offer" &&
      item.sender == AppAuthStorage().getChatID()) {
    // if Image value is no null then Show Image
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: AppSize.height(value: 10),
      ),
      constraints: BoxConstraints(
        maxWidth: AppSize.size.width * 0.7,
        // maxHeight: AppSize.size.height * 0.20
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: item.sender == AppAuthStorage().getChatID()
              ? const Color(0xffE9D7A1)
              : AppColors.white100,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20))),
      child: Column(
        children: [
          const AppText(
            data: "Offer Request",
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          const Gap(height: 20),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.green),
            height: 40,
            // width: AppSize.size.width,
            child: AppText(
              data: "\$${item.offer?.price}",
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const Gap(height: 20),
          GestureDetector(
              onTap: () {
                // Navigator.push(
                //   Get.context!,
                //   MaterialPageRoute(
                //     builder: (_) => FullScreenImageViewer(
                //         image: "${AppApiUrl.domaine}${item.image}"),
                //   ),
                // );
              },
              child: AppText(
                data: item.offer?.status ?? "",
                fontWeight: FontWeight.w500,
              )
              // AppImage(
              //   // path: AssetsImagesPath.splash,
              //   url: "${AppApiUrl.domaine}${item.image}",
              //   height: 100,
              //   fit: BoxFit.fitWidth,
              // ),
              //  Image.file(
              //   "",
              //   // message['image'],
              //   height: 250,
              //   fit: BoxFit.fitWidth,
              // ),
              ),
          const Gap(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppText(
                data: formatTime(item.createdAt ?? ""),
                // data: message["time"],
                color: AppColors.black400,
                fontSize: 12,
              ),
            ],
          ),
        ],
      ),
    );
  } else if (item.messageType == "offer") {
    // if Image value is no null then Show Image
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: AppSize.height(value: 10),
      ),
      constraints: BoxConstraints(
        maxWidth: AppSize.size.width * 0.7,
        // maxHeight: AppSize.size.height * 0.20
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: item.sender == AppAuthStorage().getChatID()
              ? const Color(0xffE9D7A1)
              : AppColors.white100,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20))),
      child: Column(
        children: [
          const AppText(
            data: "Offer Request",
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          const Gap(height: 20),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.green),
            height: 40,
            // width: AppSize.size.width,
            child: AppText(
              data: "\$${item.offer?.price}",
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const Gap(height: 20),
          if (item.offer?.status == "Accepted" ||
              item.offer?.status == "Rejected")
            AppText(
              data: item.offer?.status ?? "",
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          if (item.offer?.status == "Upcoming")
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      var data = await Repository()
                          .messageOfferRequestChangeStatus(
                              id: item.sId, status: "Rejected");

                      if (data != null) {
                        print("➡️➡️➡️ Clicked $index");
                        // controller.listOfMessageData.value.removeAt(index);
                        controller.listOfMessageData[index] = data;

                        controller.update();
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.width(value: 5.0),
                          vertical: AppSize.width(value: 10.0)),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primary),
                          borderRadius:
                              BorderRadius.circular(AppSize.width(value: 5.0))),
                      child: isload.value
                          ? const CupertinoActivityIndicator(
                              color: Colors.black,
                            )
                          : const AppText(
                              data: "Reject",
                              color: AppColors.primary,
                            ),
                    ),
                  ),
                ),
                const Gap(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      controller.rejectBookClick(item, index);
                      //   var data = await Repository()
                      //       .messageOfferRequestChangeStatus(
                      //           id: item.sId, status: "Accepted");

                      //   if (data != null) {
                      //     // listOfMessageData.removeAt(index);
                      //     print("➡️➡️➡️ Clicked $index");

                      //     // Update the list and explicitly refresh it
                      //     // controller.listOfMessageData.removeAt(index);
                      //     // await listOfMessageData.refresh();
                      //     controller.listOfMessageData.removeAt(index);

                      //     controller.listOfMessageData.insert(index, data);
                      //     // controller.update();

                      //     // listOfMessageData.insert(index, data);
                      //     controller.listOfMessageData
                      //         .refresh(); // This will notify observers of the changes
                      //   }
                      //   // controller.rejectBookClick(item, index);
                    },
                    // onTap: () {
                    //   // controller.confirmBookClick(item, index);
                    //   // Get.toNamed(AppRoutes
                    //   //     .paymentMethodScreen);
                    // },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.width(value: 5.0),
                          vertical: AppSize.width(value: 10.0)),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary),
                        borderRadius:
                            BorderRadius.circular(AppSize.width(value: 5.0)),
                        color: AppColors.primary,
                      ),
                      child: const AppText(
                        data: "Accept",
                        color: AppColors.white50,
                      ),
                    ),
                  ),
                ),
                const Gap(width: 10),
              ],
            ),
          const Gap(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppText(
                data: formatTime(item.createdAt ?? ""),
                // data: message["time"],
                color: AppColors.black400,
                fontSize: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }

  return const SizedBox();
}
