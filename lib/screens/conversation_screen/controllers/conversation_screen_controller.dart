import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/const/app_colors.dart';
import 'package:servi_app_camituresso/const/app_const.dart';
import 'package:servi_app_camituresso/screens/chat_screen/model/chat_list_model.dart';
import 'package:servi_app_camituresso/screens/conversation_screen/list/chat_list.dart';
import 'package:servi_app_camituresso/screens/conversation_screen/model/message_list_model.dart';
import 'package:servi_app_camituresso/screens/conversation_screen/widgets/full_view_image.dart';
import 'package:servi_app_camituresso/services/app_storage/app_auth_storage.dart';
import 'package:servi_app_camituresso/services/repository/post_repository.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/utils/gap.dart';
import 'package:servi_app_camituresso/widgets/app_snack_bar/app_snack_bar.dart';
import 'package:servi_app_camituresso/widgets/texts/app_text.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class ConversationScreenController extends GetxController {
  //// Socket
  late Socket socket;
  RxBool isLoading = false.obs;
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
  List<MessageListModel> messageList = <MessageListModel>[];
  getMessageList() async {
    try {
      isLoading.value = true;
      var data = await Repository().getChatMessageListData(chatId: argData.sId);
      if (data.runtimeType != Null) {
        messageList = data;

        update();
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void sendMessage(String text, String time) {
    if (text.isNotEmpty) {
      myChatData.add({
        'user': "professional",
        'text': text,
        'time': time,
      });
      chatController.text = "";
      scrollToBottom();
    }
  }

  void sendImage(ImageSource source, String time) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      myChatData.add({
        'user': "professional",
        'text': null,
        'image': File(pickedFile.path),
        'time': time,
      });
      scrollToBottom();
    }
  }

  Widget showMessage(MessageListModel item) {
    if (item.messageType == "text") {
      // if Text value is no null then Show Text
      return Column(
        crossAxisAlignment: item.sender?.sId == AppAuthStorage().getChatID()
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
                    bottomLeft: item.sender?.sId == AppAuthStorage().getChatID()
                        ? const Radius.circular(20)
                        : const Radius.circular(0),
                    bottomRight:
                        item.sender?.sId == AppAuthStorage().getChatID()
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
            // ClipRRect(
            //   borderRadius: const BorderRadius.all(
            //     Radius.circular(10),
            //   ),
            //   // child: GestureDetector(
            //   //   onTap: () {
            //   //     // Navigator.push(
            //   //     //   Get.context!,
            //   //     //   MaterialPageRoute(
            //   //     //     builder: (_) =>
            //   //     //         FullScreenImageViewer(image: message['image']),
            //   //     //   ),
            //   //     // );
            //   //   },
            //   //   // child:
            //   //   //  Image.file(
            //   //   //   "",
            //   //   //   // message['image'],
            //   //   //   height: 250,
            //   //   //   fit: BoxFit.fitWidth,
            //   //   // ),
            //   // ),
            // ),
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

    //  else if (message["quotation"] != null) {
    //   // if Quotation value is no null then Show Quotation
    //   return Column(
    //     crossAxisAlignment: CrossAxisAlignment.end,
    //     children: [
    //       Container(
    //         margin: EdgeInsets.symmetric(vertical: AppSize.height(value: 10)),
    //         constraints: BoxConstraints(
    //           maxWidth: AppSize.size.width * 0.7,
    //         ),
    //         decoration: const BoxDecoration(
    //             color: AppColors.dark500,
    //             borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(20),
    //                 topRight: Radius.circular(20),
    //                 bottomLeft: Radius.circular(20))),
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             SizedBox(
    //               height: AppSize.size.height * 0.10,
    //               width: AppSize.size.width * 020,
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                 children: [
    //                   AppText(
    //                     data: "Quotation",
    //                     fontSize: 20,
    //                     color: Colors.amber[800],
    //                     fontWeight: FontWeight.w500,
    //                   ),
    //                   AppText(
    //                     data: message["quotation"],
    //                     fontSize: 17,
    //                     color: AppColors.white50,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             const Gap(height: 20),
    //           ],
    //         ),
    //       ),
    //       AppText(
    //         data: message["time"],
    //         color: AppColors.dark500,
    //         fontSize: 12,
    //       ),
    //     ],
    //   );
    // }
    return const SizedBox();
  }

  scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.extentTotal +
            scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  outSideClick() {
    // isOnTextFeild.value = !isOnTextFeild.value;
    FocusManager.instance.primaryFocus?.unfocus();
    isOnTextFeild.value = false;
    focuse.value = false;
    // print("Focus Value ${focuse.value} 😂😂😂😂😂😂😂");
  }

  // getUserType() {
  //   // Get User Type
  //   if (selectedUser == Usertype.professional) {
  //     userType.value = "professional";
  //   } else if (selectedUser == Usertype.user) {
  //     userType.value = "user";
  //   }
  // }

  getUserScreen() {
    if (Get.arguments != Null) {
      var argData = Get.arguments;
      userScreen.value = argData.toString();
    }
  }

  sendMessageApi() async {
    try {
      isLoading.value = true;
      Map<String, dynamic> body = {
        "text": chatController.text,
        "chatId": argData.sId,
        "messageType": "text",
      };
      // Api Call
      var data = await ImageRepository().imageUploadWithData(
        body: body,
        // imagePath: userLocalImage.value,
        url: AppApiUrl.sendMessage,
      );
      if (data != null) {
        // Get.back();
        print("❤️❤️❤️❤️❤️❤️ ${data}");
        AppSnackBar.success("Message Send Sucessful");
      }
    } catch (e) {
      print("$e");
    } finally {
      isLoading.value = false;
    }
  }

  appSocketConnect() {
    try {
      socket = io(
        AppConst.soketUrl,
        OptionBuilder()
            .setTransports(['websocket'])
            .setReconnectionAttempts(3)
            .build(),
      );

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
      // if (selectedUser == UserType.user) {
      //   if (userData != null) {
      socket.on(
        "getMessage:: dhfkdhfkdfdhfk",
        (data) {
          // appSocketNotificationRead(data);
        },
      );
      //   }
      // } else {
      //   if (musiciansDataModel != null) {
      //     socket.on(
      //       "get-notification::${musiciansDataModel?.sId ?? ""}",
      //       (data) {
      //         appSocketNotificationRead(data);
      //       },
      //     );
      //   }
      // }
    } catch (e) {
      log("error form socket connect : $e");
    }
  }

  conncectSocket() {
    print("❤️❤️❤️❤️❤️❤️❤️❤️❤️ 1");

    socket.onConnect((_) {
      print('connected');
      socket.emit('msg', 'test');
    });
    print(socket.connected);

    print("❤️❤️❤️❤️❤️❤️❤️❤️❤️ 2");
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // getUserType();

      getUserScreen();
      scrollToBottom();
    });
    getArguments();
    getMessageList();
    // appSocketConnect();
    super.onInit();
  }

  @override
  void onClose() {
    chatController.dispose();
    scrollController.dispose();
    super.onClose();
  }
  // TextEditingController messageTextEditingController = TextEditingController();
  // TextEditingController offerAmountTextEditingController =
  //     TextEditingController();
  // TextEditingController serviceDetailsTextEditingController =
  //     TextEditingController();
  // GlobalKey<FormState> sendOffDialogKey = GlobalKey<FormState>();
  // ScrollController scrollController = ScrollController();
  // RxList<String> servicesList = <String>[
  //   "Plumber",
  //   "Electrician",
  //   "Home Service",
  //   "Pet Service",
  // ].obs;
  // RxString selectedServices = RxString("Select Services");
  // RxBool isOpenServicesList = RxBool(false);

  // ChatDataModel? chatDataModel;
  // RxList<ConversationDataModel> listOfConversation = RxList();
  // RxString localImage = RxString("");
  ChatListModel argData = ChatListModel();

  // messageScrollUp({int value = 50}) {
  //   try {
  //     if (scrollController.hasClients) {
  //       scrollController.position.animateTo(
  //         scrollController.position.maxScrollExtent +
  //             AppSize.height(value: value),
  //         duration: const Duration(seconds: 2),
  //         curve: Curves.ease,
  //       );
  //     }
  //   } catch (e) {
  //     log("error form scroll up function");
  //   }
  // }

  // sendMessage() {
  //   try {
  //     if (messageTextEditingController.text.isNotEmpty) {
  //       listOfConversation.add(
  //         ConversationDataModel(
  //             dateTime: DateTime.now(),
  //             message: messageTextEditingController.text),
  //       );
  //       listOfConversation.refresh();
  //       messageTextEditingController.clear();
  //       FocusManager.instance.primaryFocus?.unfocus();
  //       messageScrollUp();
  //     }
  //   } catch (e) {
  //     log("error form send message: $e");
  //   }
  // }

  // callImageSend(ImageSource source) async {
  //   try {
  //     FocusManager.instance.primaryFocus?.unfocus();
  //     await userImagePic(source, localImage);

  //     if (localImage.isNotEmpty) {
  //       listOfConversation.add(ConversationDataModel(
  //           dateTime: DateTime.now(), image: localImage.value));
  //       listOfConversation.refresh();
  //       localImage.value = "";
  //       messageScrollUp(value: 500);
  //     }
  //   } catch (e) {
  //     log("error form call image send function : $e");
  //   }
  // }

  // onSetFunctionData() {
  //   try {
  //     var argData = Get.arguments;
  //     if (argData.runtimeType != Null) {
  //       chatDataModel = argData;
  //     }
  //     listOfConversation.addAll(listOfDevConversationData);
  //     listOfConversation.refresh();
  //   } catch (e) {
  //     log("Error form conversation chat data function : $e");
  //   }
  // }

  // sendOfferButton() {
  //   try {
  //     if (sendOffDialogKey.currentState!.validate()) {
  //       listOfConversation.add(
  //         ConversationDataModel(
  //           dateTime: DateTime.now(),
  //           offerPice: offerAmountTextEditingController.text,
  //           offerPiceMessage: serviceDetailsTextEditingController.text,
  //           isSendMe: false,
  //         ),
  //       );
  //       listOfConversation.refresh();
  //       offerAmountTextEditingController.clear();
  //       serviceDetailsTextEditingController.clear();
  //       messageScrollUp(value: 500);
  //       Get.back();
  //     }
  //   } catch (e) {
  //     log("error form send offer button :$e");
  //   }
  // }

  // //Get arguments and get value Randomly
  getArguments() {
    if (Get.arguments.runtimeType != Null) {
      argData = Get.arguments;
    }
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   getArguments();
  //   onSetFunctionData();
  // }

  // @override
  // void onClose() {
  //   scrollController.dispose();
  //   messageTextEditingController.dispose();
  //   offerAmountTextEditingController.dispose();
  //   serviceDetailsTextEditingController.dispose();
  //   super.onClose();
  // }
}
