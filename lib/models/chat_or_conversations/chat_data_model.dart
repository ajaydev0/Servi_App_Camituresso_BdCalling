class ChatDataModel {
  final String name;
  final String imageUrl;
  final String massage;
  final bool isSender;
  final bool isLast;
  final DateTime time;
  final bool readeMessage;
  ChatDataModel({
    required this.imageUrl,
    required this.isSender,
    required this.massage,
    required this.name,
    required this.readeMessage,
    required this.time,
    this.isLast = false,
  });
}
