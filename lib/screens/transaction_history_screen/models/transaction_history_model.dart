class TransactionHistoryModel {
  bool? success;
  String? message;
  List<Data>? data;

  TransactionHistoryModel({this.success, this.message, this.data});

  TransactionHistoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? user;
  String? provider;
  int? price;
  String? createdAt;
  String? txid;
  String? payment;

  Data(
      {this.sId,
        this.user,
        this.provider,
        this.price,
        this.createdAt,
        this.txid,
        this.payment});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    provider = json['provider'];
    price = json['price'];
    createdAt = json['createdAt'];
    txid = json['txid'];
    payment = json['payment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['user'] = user;
    data['provider'] = provider;
    data['price'] = price;
    data['createdAt'] = createdAt;
    data['txid'] = txid;
    data['payment'] = payment;
    return data;
  }
}
