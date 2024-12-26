// ignore_for_file: library_prefixes

import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/app_const.dart';
import 'package:servi_app_camituresso/const/assets_images_path.dart';
import 'package:servi_app_camituresso/screens/chat_screen/model/chat_list_model.dart';
import 'package:servi_app_camituresso/screens/conversation_screen/model/message_list_model.dart';
import 'package:servi_app_camituresso/services/app_storage/app_auth_storage.dart';
import 'package:servi_app_camituresso/services/repository/post_repository.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_image/app_image.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ConversationScreenController extends GetxController {
  //// Socket
  late IO.Socket socket;
  RxBool isLoading = false.obs;
  RxBool isSendingMessage = false.obs;
  late RxBool initDate = false.obs;
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
  RxList<MessageListModel> listOfMessageData = <MessageListModel>[].obs;

  @override
  void onInit() {
    getArguments();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // getUserType();

      getUserScreen();
      // scrollToBottom();
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
        // No more data, set hasMore to false
        hasMore.value = false;
      }
    } catch (e) {
      log("Error in addNewMessageItems: $e");
    } finally {
      isLoadingMore.value = false;
    }
  }

  void sendMessage() async {
    try {
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
          // imagePath: userLocalImage.value,
          url: AppApiUrl.sendMessage,
        );
        if (data != null) {
          listOfMessageData.insert(listOfMessageData.length, data);
        }
        //////////// Get List Abr
        // var messageData =
        //     await Repository().getChatMessageListData(chatId: argData.sId);
        // if (messageData.runtimeType != Null) {
        //   messageList.value = messageData;
        // }
        /////////
        update();
        chatController.text = "";
      }
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

  Widget showMessage(MessageListModel item) {
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
                      AppColors.white100,
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
          const AppText(
            data: "10.00 AM",
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
        decoration: const BoxDecoration(
            color: AppColors.white100,
            borderRadius: BorderRadius.only(
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
                  // Navigator.push(
                  //   Get.context!,
                  //   MaterialPageRoute(
                  //     builder: (_) =>
                  //         FullScreenImageViewer(image: message['image']),
                  //   ),
                  // );
                },
                child: const AppImage(
                  path: AssetsImagesPath.splash,
                  // url: "${AppApiUrl.domaine}${item.image}",
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppText(
                  data: "10.00 AM",
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

  // scrollToBottom() {
  //   if (scrollController.hasClients) {
  //     scrollController.animateTo(
  //       // scrollController.position.extentTotal
  //       //  -
  //       scrollController.position.maxScrollExtent - AppSize.size.height,
  //       duration: const Duration(milliseconds: 500),
  //       curve: Curves.easeInOut,
  //     );
  //   }
  // }

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
  // void sendImage(ImageSource source, String time) async {
  //   final pickedFile = await picker.pickImage(source: source);
  //   if (pickedFile != null) {
  //     myChatData.add({
  //       'user': "professional",
  //       'text': null,
  //       'image': File(pickedFile.path),
  //       'time': time,
  //     });
  //     // scrollToBottom();
  //   }
  // }
}
