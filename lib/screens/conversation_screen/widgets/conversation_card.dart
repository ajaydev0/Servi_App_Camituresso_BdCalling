import 'package:flutter/widgets.dart';

import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/models/chat_or_conversations/conversation_data_model.dart';

import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';
import 'package:servi_app_camituresso/widgets/texts/time_text_format.dart';

class ConversationCard extends StatelessWidget {
  const ConversationCard({super.key, required this.item});
  final ConversationDataModel item;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          data: item.message,
          color: item.isSendMe ? AppColors.black700 : AppColors.white50,
        ),
        const Gap(height: 4.5),
        AppText(
          data: timeTextFormate(item.dateTime),
          color: item.isSendMe ? AppColors.black300 : AppColors.white600,
          fontSize: 12,
        ),
      ],
    );
  }
}
