// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:servi_app_camituresso/const/app_colors.dart';
// import 'package:servi_app_camituresso/screens/conversation_screen/controllers/conversation_screen_controller.dart';
// import 'package:servi_app_camituresso/utils/app_size.dart';
// import 'package:servi_app_camituresso/utils/gap.dart';
// import 'package:servi_app_camituresso/widgets/inputs/app_input_widget.dart';
// import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

// conversationOfferDialog(ConversationScreenController controller) {
//   Get.dialog(
//     Dialog(
//       backgroundColor: AppColors.white50,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 15.0), vertical: AppSize.width(value: 10.0)),
//         child: SingleChildScrollView(
//           child: Form(
//             key: controller.sendOffDialogKey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     AppText(
//                       data: "Send Offer",
//                       fontWeight: FontWeight.w500,
//                       fontSize: 20,
//                     ),
//                     GestureDetector(
//                         onTap: () {
//                           Get.back();
//                         },
//                         child: Icon(Icons.cancel_outlined))
//                   ],
//                 ),
//                 Gap(height: 10),
//                 AppText(data: "Select Services"),
//                 Gap(height: 10),
//                 Obx(
//                   () => Container(
//                     decoration: BoxDecoration(
//                         border: Border.all(
//                           color: AppColors.bannerBoxFill,
//                         ),
//                         borderRadius: BorderRadius.circular(AppSize.width(value: 10))),
//                     child: ExpansionTile(
//                       key: GlobalKey(),
//                       title: AppText(data: controller.selectedServices.value),
//                       initiallyExpanded: controller.isOpenServicesList.value,
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.width(value: 10.0))),
//                       expansionAnimationStyle: AnimationStyle(
//                         duration: Duration(seconds: 1),
//                         reverseDuration: Duration(seconds: 1),
//                         curve: Curves.ease,
//                       ),
//                       onExpansionChanged: (value) {
//                         controller.isOpenServicesList.value = value;
//                       },
//                       children: List.generate(
//                         controller.servicesList.length,
//                         (index) {
//                           var item = controller.servicesList[index];
//                           return GestureDetector(
//                             onTap: () {
//                               controller.isOpenServicesList.value = false;
//                               controller.selectedServices.value = item;
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: AppColors.yellow400,
//                                 border: Border(
//                                   bottom: BorderSide(color: AppColors.bannerBoxFill),
//                                 ),
//                               ),
//                               width: Get.width,
//                               padding: EdgeInsets.symmetric(vertical: AppSize.width(value: 10), horizontal: AppSize.width(value: 10)),
//                               child: AppText(data: item),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//                 Gap(height: 20),
//                 AppText(data: "Offer Amount"),
//                 Gap(height: 10),
//                 AppInputWidget(
//                   controller: controller.offerAmountTextEditingController,
//                   fillColor: AppColors.white50,
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.bannerBoxFill, width: 1),
//                     borderRadius: BorderRadius.circular(AppSize.width(value: 10)),
//                   ),
//                   errBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.warning.withOpacity(0.2), width: 1),
//                     borderRadius: BorderRadius.circular(AppSize.width(value: 10)),
//                   ),
//                   keyboardType: TextInputType.phone,
//                   style: TextStyle(color: AppColors.primary, fontSize: 18),
//                   prefix: AppText(
//                     data: "  \$ ",
//                     fontSize: 18,
//                     color: AppColors.primary,
//                     textAlign: TextAlign.end,
//                   ),
//                 ),
//                 Gap(height: 20),
//                 AppText(data: "Service Details"),
//                 Gap(height: 10),
//                 AppInputWidget(
//                   controller: controller.serviceDetailsTextEditingController,
//                   fillColor: AppColors.white50,
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.bannerBoxFill, width: 1),
//                     borderRadius: BorderRadius.circular(AppSize.width(value: 10)),
//                   ),
//                   errBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.warning.withOpacity(0.2), width: 1),
//                     borderRadius: BorderRadius.circular(AppSize.width(value: 10)),
//                   ),
//                   keyboardType: TextInputType.multiline,
//                   maxLines: 100,
//                   minLines: 5,
//                   textInputAction: TextInputAction.newline,
//                 ),
//                 Gap(height: 30),
//                 GestureDetector(
//                   onTap: () {
//                     controller.sendOfferButton();
//                   },
//                   child: Container(
//                     width: Get.width,
//                     height: AppSize.height(value: 50),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         color: AppColors.primary,
//                         borderRadius: BorderRadius.circular(
//                           AppSize.width(value: 10),
//                         )),
//                     child: AppText(data: "Send", color: AppColors.white50, fontSize: 18, fontWeight: FontWeight.w500),
//                   ),
//                 ),
//                 Gap(height: 10),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
