import 'package:servi_app_camituresso/screens/transaction_history_screen/controllers/transaction_status_enum.dart';

class TransactionDataHistory {
  final String to;
  final String form;
  final String transactionId;
  final String transactionAmount;
  final TransactionStatusEnum status;
  final DateTime time;
  TransactionDataHistory({
    required this.to,
    required this.form,
    required this.transactionId,
    required this.transactionAmount,
    required this.status,
    required this.time,
  });
}
