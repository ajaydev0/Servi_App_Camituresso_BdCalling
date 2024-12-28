class TransactionDataHistory {
  final String to;
  final String form;
  final String transactionId;
  final String transactionAmount;
  final DateTime time;
  TransactionDataHistory({
    required this.to,
    required this.form,
    required this.transactionId,
    required this.transactionAmount,
    required this.time,
  });
}
