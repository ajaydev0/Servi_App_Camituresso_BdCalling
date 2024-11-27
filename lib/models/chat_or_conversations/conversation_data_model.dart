class ConversationDataModel {
  final String message;
  final String? image;
  final bool isSendMe;
  final DateTime dateTime;
  final bool sendOffer;
  final bool offer;
  final bool offerPending;
  final String offerPice;
  final String offerPiceMessage;
  ConversationDataModel({
    this.message = "",
    this.image,
    this.isSendMe = false,
    required this.dateTime,
    this.sendOffer = false,
    this.offerPending = true,
    this.offer = false,
    this.offerPice = "10",
    this.offerPiceMessage = "",
  });
}
