import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/models/chat_or_conversations/conversation_data_model.dart';
import 'package:servi_app_camituresso/screens/conversation_screen/widgets/conversation_card.dart';
import 'package:servi_app_camituresso/screens/conversation_screen/widgets/conversation_offer_card.dart';
import 'package:servi_app_camituresso/screens/conversation_screen/widgets/conversation_offer_status_card.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';

Widget conversationCardSelectionFunction({required ConversationDataModel item, bool isLast = false}) {
  return Padding(
    padding: isLast ? EdgeInsets.only(bottom: AppSize.width(value: 60)) : const EdgeInsets.all(0.0),
    child: Align(
      alignment: item.isSendMe ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(AppSize.width(value: 10.0)),
        margin: EdgeInsets.symmetric(vertical: AppSize.width(value: 8)),
        constraints: BoxConstraints(maxWidth: Get.width * 0.8),
        decoration: BoxDecoration(
          color: item.isSendMe ? AppColors.white50 : AppColors.primary,
          borderRadius: item.isSendMe
              ? BorderRadius.only(
                  topLeft: Radius.circular(AppSize.width(value: 10)),
                  topRight: Radius.circular(AppSize.width(value: 10)),
                  bottomRight: Radius.circular(AppSize.width(value: 10)),
                )
              : BorderRadius.only(
                  topLeft: Radius.circular(AppSize.width(value: 10)),
                  topRight: Radius.circular(AppSize.width(value: 10)),
                  bottomLeft: Radius.circular(AppSize.width(value: 10)),
                ),
        ),
        child: item.message.isNotEmpty
            ? ConversationCard(
                item: item,
              )
            : item.sendOffer
                ? ConversationOfferCard(
                    item: item,
                  )
                : item.image != null
                    ? AspectRatio(
                        aspectRatio: 1.5,
                        child: AppImage(
                          filePath: item.image!,
                        ),
                      )
                    : ConversationOfferStatusCard(
                        item: item,
                      ),

////////////  try api data this condition
        //               Column(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     if (item.message.isNotEmpty) ConversationCard(item: item),
        //     if (item.sendOffer) ConversationOfferCard(item: item),
        //     if (item.image != null)
        //       AspectRatio(
        //         aspectRatio: 2,
        //         child: AppImage(filePath: item.image!),
        //       ),
        //     if (item.offerPice.isNotEmpty && item.offer)
        //       ConversationOfferStatusCard(
        //         item: item,
        //       ),
        //   ],
        // ),
      ),
    ),
  );
}
