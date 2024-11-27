import 'package:servi_app_camituresso/models/chat_or_conversations/conversation_data_model.dart';

List<ConversationDataModel> listOfDevConversationData = [
  ConversationDataModel(
    dateTime: DateTime(2024, 8, 19),
    message: "This is your delivery driver from Speedy Chow. I'm just around the corner from your place. 😊",
  ),
  ConversationDataModel(
    dateTime: DateTime(2024, 8, 19),
    message: "This is your delivery driver from Speedy Chow.",
    isSendMe: true,
  ),
  ConversationDataModel(
    dateTime: DateTime(2024, 8, 19),
    isSendMe: true,
    sendOffer: true,
    offerPice: "50",
    offerPiceMessage: "I want a full house cleaning",
  ),
  ConversationDataModel(
    dateTime: DateTime(2024, 8, 19),
    sendOffer: false,
    offerPice: "50",
    offerPiceMessage: "I want a full house cleaning",
  ),
  ConversationDataModel(
    dateTime: DateTime(2024, 8, 19),
    isSendMe: true,
    sendOffer: true,
    offerPice: "50",
    offerPiceMessage: "I want a full house cleaning",
  ),
  ConversationDataModel(
    dateTime: DateTime(2024, 8, 19),
    isSendMe: false,
    sendOffer: false,
    offerPice: "50",
    offerPiceMessage: "I want a full house cleaning",
    offer: true,
  ),
];
