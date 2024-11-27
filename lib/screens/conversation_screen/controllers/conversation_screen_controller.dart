import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:servi_app_camituresso/dev_data/cover_dev_data.dart';
import 'package:servi_app_camituresso/models/chat_or_conversations/chat_data_model.dart';
import 'package:servi_app_camituresso/models/chat_or_conversations/conversation_data_model.dart';
import 'package:servi_app_camituresso/utils/app_size.dart';
import 'package:servi_app_camituresso/widgets/image_user_pic/image_user_pi.dart';

class ConversationScreenController extends GetxController {
  TextEditingController messageTextEditingController = TextEditingController();
  TextEditingController offerAmountTextEditingController =
      TextEditingController();
  TextEditingController serviceDetailsTextEditingController =
      TextEditingController();
  GlobalKey<FormState> sendOffDialogKey = GlobalKey<FormState>();
  ScrollController scrollController = ScrollController();
  RxList<String> servicesList = <String>[
    "Plumber",
    "Electrician",
    "Home Service",
    "Pet Service",
  ].obs;
  RxString selectedServices = RxString("Select Services");
  RxBool isOpenServicesList = RxBool(false);

  ChatDataModel? chatDataModel;
  RxList<ConversationDataModel> listOfConversation = RxList();
  RxString localImage = RxString("");
  dynamic argData;

  messageScrollUp({int value = 50}) {
    try {
      if (scrollController.hasClients) {
        scrollController.position.animateTo(
          scrollController.position.maxScrollExtent +
              AppSize.height(value: value),
          duration: const Duration(seconds: 2),
          curve: Curves.ease,
        );
      }
    } catch (e) {
      log("error form scroll up function");
    }
  }

  sendMessage() {
    try {
      if (messageTextEditingController.text.isNotEmpty) {
        listOfConversation.add(
          ConversationDataModel(
              dateTime: DateTime.now(),
              message: messageTextEditingController.text),
        );
        listOfConversation.refresh();
        messageTextEditingController.clear();
        FocusManager.instance.primaryFocus?.unfocus();
        messageScrollUp();
      }
    } catch (e) {
      log("error form send message: $e");
    }
  }

  callImageSend(ImageSource source) async {
    try {
      FocusManager.instance.primaryFocus?.unfocus();
      await userImagePic(source, localImage);

      if (localImage.isNotEmpty) {
        listOfConversation.add(ConversationDataModel(
            dateTime: DateTime.now(), image: localImage.value));
        listOfConversation.refresh();
        localImage.value = "";
        messageScrollUp(value: 500);
      }
    } catch (e) {
      log("error form call image send function : $e");
    }
  }

  onSetFunctionData() {
    try {
      var argData = Get.arguments;
      if (argData.runtimeType != Null) {
        chatDataModel = argData;
      }
      listOfConversation.addAll(listOfDevConversationData);
      listOfConversation.refresh();
    } catch (e) {
      log("Error form conversation chat data function : $e");
    }
  }

  sendOfferButton() {
    try {
      if (sendOffDialogKey.currentState!.validate()) {
        listOfConversation.add(
          ConversationDataModel(
            dateTime: DateTime.now(),
            offerPice: offerAmountTextEditingController.text,
            offerPiceMessage: serviceDetailsTextEditingController.text,
            isSendMe: false,
          ),
        );
        listOfConversation.refresh();
        offerAmountTextEditingController.clear();
        serviceDetailsTextEditingController.clear();
        messageScrollUp(value: 500);
        Get.back();
      }
    } catch (e) {
      log("error form send offer button :$e");
    }
  }

  //Get arguments and get value Randomly
  getArguments() {
    if (Get.arguments.runtimeType != Null) {
      argData = Get.arguments;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getArguments();
    onSetFunctionData();
  }

  @override
  void onClose() {
    scrollController.dispose();
    messageTextEditingController.dispose();
    offerAmountTextEditingController.dispose();
    serviceDetailsTextEditingController.dispose();
    super.onClose();
  }
}
