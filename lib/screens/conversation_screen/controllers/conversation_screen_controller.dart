import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_const.dart';
import 'package:servi_app_camituresso/screens/chat_screen/model/chat_list_model.dart';
import 'package:servi_app_camituresso/screens/conversation_screen/model/message_list_model.dart';
import 'package:servi_app_camituresso/services/repository/post_repository.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';
import 'package:servi_app_camituresso/widgets/app_snack_bar/app_snack_bar.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ConversationScreenController extends GetxController {
  RxList<MessageListModel> listOfMessageData = <MessageListModel>[].obs;
  RxInt selectedIndex = 0.obs;

  rejectBookClick(
      MessageListModel item, RxBool isPending, RxBool isLoadingReject) async {
    try {
      isLoadingReject.value = true;

      var data = await Repository()
          .messageOfferRequestChangeStatus(id: item.sId, status: "Rejected");

      if (data != null) {
        item.offer?.status = "Rejected";
        isPending.value = false;
      }
    } catch (e) {
      print("Error On Reject Method $e");
    } finally {
      isLoadingReject.value = false;
    }
  }

  confirmBookClick(
      MessageListModel item, RxBool isPending, RxBool isLoadingConfirm) async {
    try {
      isLoadingConfirm.value = true;

      var data = await Repository()
          .messageOfferRequestChangeStatus(id: item.sId, status: "Accepted");

      if (data != null) {
        isPending.value = false;
        item.offer?.status = "Accepted";
      }
    } catch (e) {
      print("Error On Reject Method $e");
    } finally {
      isLoadingConfirm.value = false;
    }
  }

  RxBool isLoadingSendOfferButton = false.obs;
  sendOfferButton() {
    if (selectedServicesCategory.value.toLowerCase() ==
        "Select Service".toLowerCase()) {
      isJobCategoryCheck.value = true;
    } else {
      isJobCategoryCheck.value = false;
    }
    if (key.currentState!.validate() && !isJobCategoryCheck.value) {
      sendOfferApiCall();
    }
  }

  //// Send Offer Api
  sendOfferApiCall() async {
    try {
      isLoadingSendOfferButton.value = true;
      Map<String, dynamic> body = {
        "chatId": argData.sId,
        "messageType": "offer",
        "provider": argData.participants?[0].sId,
        "service": selectedServicesID.value,
        "offer": {
          "price": offerAmount.text,
          "description": offerDescription.text
        }
      };
      // Api Call
      await ImageRepository().imageUploadWithData2(
        body: body,
        url: AppApiUrl.sendMessage,
      );
      Get.closeAllDialogs();
      offerAmount.text = "";
      offerDescription.text = "";
      selectedServicesCategory.value = "Select Service";
    } catch (e) {
      print("$e");
    } finally {
      isLoadingSendOfferButton.value = false;
    }
  }

//////// Offer
  final TextEditingController offerAmount = TextEditingController();
  final TextEditingController offerDescription = TextEditingController();

  RxBool isOpenServicesList = false.obs;
  RxBool isLoadingService = false.obs;
  RxBool isJobCategoryCheck = RxBool(false);
  RxString selectedServicesID = "".obs;
  RxString selectedServicesCategory = "Select Service".obs;
  RxList<ChatUserServiceListModel> servicesCategoryList =
      <ChatUserServiceListModel>[].obs;
  getUserServiceList() async {
    try {
      isLoadingService.value = true;
      var data = await Repository()
          .getChatUserServiceListData(userID: argData.participants?[0].sId);
      if (data.runtimeType != Null) {
        for (var element in data) {
          servicesCategoryList.add(element);
        }
        // servicesCategoryList = data;\
        servicesCategoryList.refresh();
        update();
      }
    } catch (e) {
      print(e);
    } finally {
      isLoadingService.value = false;
    }
  }

  //// Socket
  late IO.Socket socket;
  RxBool isLoading = false.obs;

  RxBool isLoadingUploadImage = false.obs;
  RxBool isSendingMessage = false.obs;
  late RxBool initDate = false.obs;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController dateTextController = TextEditingController();
  final TextEditingController chatController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  RxString userType = "".obs;
  RxString userScreen = "".obs;
  final FocusNode focusNode = FocusNode();
  //Image Picker
  final ImagePicker picker = ImagePicker();
  RxBool isOnTextFeild = false.obs;

  RxBool focuse = false.obs;
//////////////////////////////////// Pagination part
  RxInt paginationCount = 1.obs;
  RxBool hasMore = true.obs;
  RxBool isLoadingMore = false.obs;
  RxBool isLast = false.obs;

//////////////////////////////////// Message List

  @override
  void onInit() {
    getArguments();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getUserScreen();
    });

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          !isLoadingMore.value &&
          hasMore.value) {
        addNewMessageItems();
      }
    });
    appSocketConnect();
    getMessageList();
    getUserServiceList();
    super.onInit();
  }

  @override
  void onClose() {
    chatController.dispose();
    scrollController.dispose();
    socket.dispose();
    super.onClose();
  }

//////////////////////////////////// Fetch Initial Messages
  Future<void> getMessageList() async {
    try {
      isLoading.value = true;

      var data = await Repository().getChatMessageListData(
        chatId: argData.sId,
        page: paginationCount.value,
      );

      if (data.isNotEmpty) {
        listOfMessageData.value = data;
        paginationCount.value += 1;
      } else {
        // No more data, set hasMore to false
        hasMore.value = false;
      }
    } catch (e) {
      log("Error in getMessageList: $e");
    } finally {
      isLoading.value = false;
    }
  }

//////////////////////////////////// Load More Messages
  void addNewMessageItems() async {
    if (isLoadingMore.value || !hasMore.value) return;

    try {
      isLoadingMore.value = true;

      var data = await Repository().getChatMessageListData(
        chatId: argData.sId,
        page: paginationCount.value,
      );

      if (data.isNotEmpty) {
        listOfMessageData.addAll(data);
        paginationCount.value += 1;
      } else {
        hasMore.value = false;
      }
    } catch (e) {
      log("Error in addNewMessageItems: $e");
    } finally {
      isLoadingMore.value = false;
    }
  }

  onlyTextSend() async {
    if (chatController.text != "") {
      isSendingMessage.value = true;
      Map<String, dynamic> body = {
        "text": chatController.text,
        "chatId": argData.sId,
        "messageType": "text",
      };
      // Api Call
      var data = await ImageRepository().imageUploadWithData2(
        body: body,
        url: AppApiUrl.sendMessage,
      );
      if (data != null) {
        listOfMessageData.insert(listOfMessageData.length, data);
      }

      update();
      chatController.text = "";
    }
  }

  void sendMessage() async {
    try {
      await onlyTextSend();
    } catch (e) {
      print(" Demo Error $e");
    } finally {
      isSendingMessage.value = false;
    }
  }

  appSocketConnect() {
    try {
      socket = IO.io(
        AppConst.soketUrl,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .setReconnectionAttempts(3)
            .build(),
      );
      socket.connect();
      socket.onConnect((_) {
        log('Connected to the socket server');
      });
      socket.onDisconnect(
        (data) {
          log("socket on disconnect $data");
        },
      );
      socket.onConnectError(
        (data) {
          log("socket on connection error $data");
        },
      );
      socket.onError(
        (data) {
          log("socket on error $data");
        },
      );
      socket.onPing(
        (data) {
          log("socket on ping $data");
        },
      );
      socket.on(
        "getMessage::${argData.sId}",
        (data) {
          log("Socket data received: $data");
          try {
            final message = MessageListModel.fromJson(data);
            listOfMessageData.insert(
                0, message); // Add at the start of the list
            listOfMessageData.refresh();
            // scrollToBottom();
          } catch (e) {
            log("Error parsing message: $e");
          }
        },
      );
    } catch (e) {
      log("error form socket connect : $e");
    }
  }

  ChatListModel argData = ChatListModel();

  // //Get arguments and get value Randomly
  getArguments() {
    if (Get.arguments.runtimeType != Null) {
      argData = Get.arguments;
    }
  }

  outSideClick() {
    FocusManager.instance.primaryFocus?.unfocus();
    isOnTextFeild.value = false;
    focuse.value = false;
  }

  getUserScreen() {
    if (Get.arguments != Null) {
      var argData = Get.arguments;
      userScreen.value = argData.toString();
    }
  }

  void sendImage(ImageSource source, String time) async {
    final pickedFile = await picker.pickImage(source: source);

    try {
      if (pickedFile != null) {
        isLoadingUploadImage.value = true;
        Map<String, dynamic> body = {
          "chatId": argData.sId,
          "messageType": "image",
        };
        // Api Call
        var data = await ImageRepository().imageUploadWithData2(
          body: body,
          imagePath: pickedFile.path,
          url: AppApiUrl.sendMessage,
        );
        if (data != null) {
          AppSnackBar.success("Success");
        }
      }
    } catch (e) {
      print(e);
    } finally {
      isLoadingUploadImage.value = false;
    }
  }
}
