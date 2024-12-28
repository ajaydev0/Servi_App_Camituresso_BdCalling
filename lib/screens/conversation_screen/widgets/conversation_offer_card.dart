import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/models/chat_or_conversations/conversation_data_model.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';
import 'package:servi_app_camituresso/widgets/texts/time_text_format.dart';

class ConversationOfferCard extends StatelessWidget {
  const ConversationOfferCard({super.key, required this.item});
  final ConversationDataModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: Get.width / 2),
          alignment: Alignment.center,
          padding: EdgeInsets.all(AppSize.width(value: 5.0)),
          decoration: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.circular(AppSize.width(value: 5))),
          child: AppText(
            data: "\$${item.offerPice}",
            color: AppColors.white300,
          ),
        ),
        const Gap(height: 4.5),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.width(value: 10.0),
                  vertical: AppSize.width(value: 5.0)),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(AppSize.width(value: 5)),
                border: Border.all(color: AppColors.primary),
              ),
              child: AppText(
                data: "Accepted",
                color: AppColors.white300,
                textAlign: TextAlign.center,
              ),
            ),
            Gap(width: 20),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.width(value: 10.0),
                  vertical: AppSize.width(value: 5.0)),
              decoration: BoxDecoration(
                color: AppColors.white50,
                borderRadius: BorderRadius.circular(AppSize.width(value: 5)),
                border: Border.all(color: AppColors.primary),
              ),
              child: AppText(
                data: "Reject",
                color: AppColors.primary,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        const Gap(height: 4.5),
        AppText(data: item.offerPiceMessage),
        const Gap(height: 4.5),
        Container(
          constraints: BoxConstraints(maxWidth: Get.width / 2),
          alignment:
              item.isSendMe ? Alignment.centerLeft : Alignment.centerRight,
          padding: EdgeInsets.all(AppSize.width(value: 5.0)),
          child: AppText(
            textAlign: TextAlign.end,
            data: timeTextFormate(item.dateTime),
            color: item.isSendMe ? AppColors.black300 : AppColors.white600,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
