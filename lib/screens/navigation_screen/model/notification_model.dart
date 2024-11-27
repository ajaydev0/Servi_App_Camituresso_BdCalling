// class GetNotificationModel {
//   bool? success;
//   String? message;
//   Data? data;

//   GetNotificationModel({this.success, this.message, this.data});

//   GetNotificationModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   List<Null>? result;
//   int? unreadCount;

//   Data({this.result, this.unreadCount});

//   Data.fromJson(Map<String, dynamic> json) {
//     List<dynamic> list = [];
//     if (json['result'] != null) {
//       result = <Null>[];
//       json['result'].forEach((v) {
//         result!.add(list[0]);
//       });
//     }
//     unreadCount = json['unreadCount'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.result != null) {
//       data['result'] = this.result!.map((v) {}).toList();
//     }
//     data['unreadCount'] = this.unreadCount;
//     return data;
//   }
// }

// // Read Notification
// class ReadNotification {
//   bool? success;
//   String? message;
//   Data? data;

//   ReadNotification({this.success, this.message, this.data});

//   ReadNotification.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data2 {
//   bool? acknowledged;
//   int? modifiedCount;
//   Null? upsertedId;
//   int? upsertedCount;
//   int? matchedCount;

//   Data2(
//       {this.acknowledged,
//       this.modifiedCount,
//       this.upsertedId,
//       this.upsertedCount,
//       this.matchedCount});

//   Data2.fromJson(Map<String, dynamic> json) {
//     acknowledged = json['acknowledged'];
//     modifiedCount = json['modifiedCount'];
//     upsertedId = json['upsertedId'];
//     upsertedCount = json['upsertedCount'];
//     matchedCount = json['matchedCount'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['acknowledged'] = this.acknowledged;
//     data['modifiedCount'] = this.modifiedCount;
//     data['upsertedId'] = this.upsertedId;
//     data['upsertedCount'] = this.upsertedCount;
//     data['matchedCount'] = this.matchedCount;
//     return data;
//   }
// }

// // // Get Post
// // class GetPost {
// //   String? sId;
// //   String? image;
// //   String? title;
// //   int? price;
// //   String? description;
// //   String? category;

// //   GetPost(
// //       {this.sId,
// //       this.image,
// //       this.title,
// //       this.price,
// //       this.description,
// //       this.category});

// //   GetPost.fromJson(Map<String, dynamic> json) {
// //     sId = json['_id'];
// //     image = json['image'];
// //     title = json['title'];
// //     price = json['price'];
// //     description = json['description'];
// //     category = json['category'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['_id'] = this.sId;
// //     data['image'] = this.image;
// //     data['title'] = this.title;
// //     data['price'] = this.price;
// //     data['description'] = this.description;
// //     data['category'] = this.category;
// //     return data;
// //   }
// // }
