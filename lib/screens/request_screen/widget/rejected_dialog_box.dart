// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:servi_app_camituresso/const/app_colors.dart';
// import 'package:servi_app_camituresso/screens/request_screen/controllers/request_screen_controller.dart';
// import 'package:servi_app_camituresso/services/repository/repository.dart';
// import 'package:servi_app_camituresso/utils/app_size.dart';
// import 'package:servi_app_camituresso/utils/gap.dart';
// import 'package:servi_app_camituresso/widgets/texts/app_text.dart';

// rejectedDialog(sID, RequestScreenController controller) {
//   Get.dialog(Dialog(
//     backgroundColor: Colors.white,
//     child: Padding(
//       padding: EdgeInsets.all(
//         AppSize.width(value: 10),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Gap(height: 10),
//           const AppText(
//             data: "Reject ?",
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//             color: AppColors.black900,
//           ),
//           const Gap(height: 30),
//           const AppText(
//             data: "Are you sure you want to Reject This Request?",
//             textAlign: TextAlign.center,
//             height: 1.5,
//           ),
//           const Gap(height: 30),
//           Row(
//             children: [
//               Expanded(
//                 child: GestureDetector(
//                   onTap: () {
//                     var context = Get.context;
//                     Navigator.pop(context!);
//                   },
//                   child: Container(
//                     margin: EdgeInsets.all(AppSize.width(value: 5)),
//                     padding: EdgeInsets.all(AppSize.width(value: 5)),
//                     width: Get.width,
//                     height: AppSize.height(value: 50),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         border: Border.all(color: AppColors.black200),
//                         color: AppColors.white50,
//                         borderRadius:
//                             BorderRadius.circular(AppSize.width(value: 8.0))),
//                     child: const AppText(
//                       data: "Cancel",
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700,
//                       color: AppColors.black800,
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: GestureDetector(
//                   onTap: () async {
//                     controller.rejectBookClick(sID);
//                     // var response = Repository().getBookingRequestChangeStatus(
//                     //     id: sID, status: "Rejected");
//                     // print(response);
//                     // var context = Get.context;
//                     // Navigator.pop(context!);
//                     // await AppAuthStorage().storageClear();
//                     // Get.offAllNamed(AppRoutes.signIn);
//                     //Test
//                     // print(AppAuthStorage().box.read("name").toString());
//                     // print(AppAuthStorage().box.read("email").toString());
//                     // print(AppAuthStorage().box.read("password").toString());
//                   },
//                   child: Container(
//                     margin: EdgeInsets.all(AppSize.width(value: 5)),
//                     padding: EdgeInsets.all(AppSize.width(value: 5)),
//                     width: Get.width,
//                     height: AppSize.height(value: 50),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         border: Border.all(color: AppColors.warning),
//                         color: AppColors.warning,
//                         borderRadius: BorderRadius.circular(
//                           AppSize.width(value: 8.0),
//                         )),
//                     child: const AppText(
//                       data: "Confirm",
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700,
//                       color: AppColors.white50,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const Gap(height: 20),
//         ],
//       ),
//     ),
//   ));
// }
