import 'package:get/get.dart';
import 'package:servi_app_camituresso/const/assets_dev_images.dart';
import 'package:servi_app_camituresso/models/chat_or_conversations/chat_data_model.dart';
import 'package:servi_app_camituresso/screens/chat_screen/model/chat_list_model.dart';
import 'package:servi_app_camituresso/services/repository/repository.dart';

class ChatScreenController extends GetxController {
  List<ChatDataModel> listOfChat = [
    ChatDataModel(
        name: "Imogen",
        imageUrl: AssetsDevImages.devUser2,
        isSender: false,
        massage: "test message",
        readeMessage: false,
        time: DateTime(2024, 8, 19, 11)),
    ChatDataModel(
        name: "Imogen",
        imageUrl: AssetsDevImages.devUser2,
        isSender: false,
        massage: "test message",
        readeMessage: false,
        time: DateTime(2024, 8, 19)),
    ChatDataModel(
        name: "Imogen",
        imageUrl: AssetsDevImages.devUser2,
        isSender: false,
        massage: "test message",
        readeMessage: false,
        time: DateTime(2024, 8, 16)),
    ChatDataModel(
        name: "Imogen",
        imageUrl: AssetsDevImages.devUser2,
        isSender: false,
        massage: "test message",
        readeMessage: false,
        time: DateTime(2024, 8, 14),
        isLast: true),
    ChatDataModel(
        name: "Imogen",
        imageUrl: AssetsDevImages.devUser2,
        isSender: false,
        massage: "test message",
        readeMessage: true,
        time: DateTime(2024, 7, 19)),
    ChatDataModel(
        name: "Imogen",
        imageUrl: AssetsDevImages.devUser2,
        isSender: true,
        massage: "test message",
        readeMessage: true,
        time: DateTime(2024, 1, 19)),
    ChatDataModel(
        name: "Imogen",
        imageUrl: AssetsDevImages.devUser2,
        isSender: true,
        massage: "test message",
        readeMessage: true,
        time: DateTime(2023, 8, 19)),
    ChatDataModel(
        name: "Imogen",
        imageUrl: AssetsDevImages.devUser2,
        isSender: true,
        massage: "test message",
        readeMessage: true,
        time: DateTime(2022, 8, 19)),
  ];

  RxBool isLoading = false.obs;
  List<ChatListModel> chatList = <ChatListModel>[].obs;

  getChatList() async {
    try {
      isLoading.value = true;
      var data = await Repository().getChatListData();
      if (data.runtimeType != Null) {
        chatList = data;
        print("➡️➡️➡️➡️➡️➡️➡️➡️ ${data.length}");
        print("➡️➡️➡️➡️➡️➡️➡️➡️ ${chatList.length}");
        update();
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    getChatList();
    super.onInit();
  }
}
