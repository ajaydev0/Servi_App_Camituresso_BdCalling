import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/screens/chat_screen/model/chat_list_model.dart';
import 'package:servi_app_camituresso/screens/clients_details_screen/model/booking_request_details_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class ClientsDetailsScreenController extends GetxController {
  RxBool isLoadingReject = false.obs;
  RxBool isLoadingConfirm = false.obs;
  RxBool isPending = false.obs;
  rejectBookClick(
    BookingRequestDetailsModel item,
  ) async {
    try {
      isLoadingReject.value = true;
      var data = await Repository()
          .getBookingRequestChangeStatus(id: item.sId, status: "Rejected");

      if (data != null) {
        item.status = "Rejected";
        isPending.value = false;
      }
    } catch (e) {
      print("Error On Reject Method $e");
    } finally {
      isLoadingReject.value = false;
    }
  }

  confirmBookClick(
    BookingRequestDetailsModel item,
  ) async {
    try {
      isLoadingConfirm.value = true;

      var data = await Repository()
          .getBookingRequestChangeStatus(id: item.sId, status: "Accepted");

      if (data != null) {
        item.status = "Accepted";
        isPending.value = false;
      }
    } catch (e) {
      print("Error On Reject Method $e");
    } finally {
      isLoadingConfirm.value = false;
    }
  }

  RxBool isLoading = false.obs;
  RxString aboutUsData = "".obs;
  BookingRequestDetailsModel itemDetails = BookingRequestDetailsModel();
  getServiceDetailsData() async {
    try {
      isLoading.value = true;
      if (Get.arguments.runtimeType != Null) {
        var repoResponse =
            await Repository().getBookingRequestDetailsData(Get.arguments);
        if (repoResponse != null) {
          itemDetails = repoResponse;
          if (itemDetails.status?.toLowerCase() == "upcoming") {
            isPending.value = true;
          } else {
            isPending.value = false;
          }
        }
      } else {
        print("Something Else");
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void copyToClipboard(BuildContext context, text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied to Clipboard!'),
        duration: Duration(milliseconds: 500),
      ),
    );
  }

/////////////////////////// Chat Button Logic
  RxBool isLoadingForChat = false.obs;
  clickOnMessageButton() async {
    print(itemDetails.user?.sId);
    try {
      isLoadingForChat.value = true;
      var createChatResponse =
          await Repository().createChat(chatId: itemDetails.user?.sId);
      var chatListResponse = await Repository().getChatListData();

      if (createChatResponse != null && chatListResponse.runtimeType != Null) {
        print("❗❗❗❗❗❗${createChatResponse.sId}");
        print("❗❗❗❗❗❗${chatListResponse}");

        var data = chatListResponse.where(
          (element) {
            return element.sId!
                .toLowerCase()
                .contains(createChatResponse.sId?.toLowerCase() ?? "");
          },
        ).toList();
        if (data.isNotEmpty) {
          ChatListModel sendData = ChatListModel();
          sendData = data[0];
          Get.toNamed(AppRoutes.conversationScreen, arguments: sendData);
          print("Data Ache");
          print(data);
          print(sendData);
        }
        print("❗❗❗❗❗❗${data}");

        // AppSnackBar.success("Chat Create Successful");
      }
    } catch (e) {
      print("Chat Create Exception $e");
    } finally {
      isLoadingForChat.value = false;
    }
    //
  }

  @override
  void onInit() {
    getServiceDetailsData();

    // getAboutUsData();
    super.onInit();
  }
}
