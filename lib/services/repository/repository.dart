import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/screens/chat_screen/model/chat_list_model.dart';
import 'package:servi_app_camituresso/screens/clients_details_screen/model/booking_request_details_model.dart';
import 'package:servi_app_camituresso/screens/conversation_screen/model/message_list_model.dart';
import 'package:servi_app_camituresso/screens/home_screen/model/bannar_model.dart';
import 'package:servi_app_camituresso/screens/list_off_view_services/model/get_post_model.dart';
import 'package:servi_app_camituresso/screens/popular_view_all/model/get_popular_post_model.dart';
import 'package:servi_app_camituresso/screens/profile_screen/models/profile_screen_model.dart';
import 'package:servi_app_camituresso/screens/recommendation_view_all/model/get_recommended_post_model.dart';
import 'package:servi_app_camituresso/screens/request_screen/models/booking_request_data_model.dart';
import 'package:servi_app_camituresso/screens/saved_screen/model/get_saved_post_model.dart';
import 'package:servi_app_camituresso/screens/search_screen/model/serach_page_post_model.dart';
import 'package:servi_app_camituresso/screens/service_by_service_screen/model/service_by_service_model.dart';
import 'package:servi_app_camituresso/screens/services_details_screen/models/create_chat_model.dart';
import 'package:servi_app_camituresso/screens/services_details_screen/models/service_details_model.dart';
import 'package:servi_app_camituresso/screens/services_screen/model/category_model.dart';
import 'package:servi_app_camituresso/services/api/services/api_get_services.dart';
import 'package:servi_app_camituresso/services/api/services/api_patch_services.dart';
import 'package:servi_app_camituresso/services/api/services/api_post_services.dart';
import 'package:servi_app_camituresso/services/app_storage/app_auth_storage.dart';

class Repository {
  // Get Notifications List
  Future<List<ChatListModel>> getChatListData() async {
    List<ChatListModel> data = <ChatListModel>[];
    try {
      var response = await ApiGetServices().apiGetServices(
        AppApiUrl.chatList,
        token: AppAuthStorage().getToken(),
      );

      if (response != null) {
        if (response["data"].runtimeType != Null) {
          for (var element in response["data"]) {
            data.add(ChatListModel.fromJson(element));
          }
        }
      }
      return data;
    } catch (e) {
      return data;
    }
  }

  // Get Privacy Policy
  Future<String> getPrivacyPolicyData() async {
    String data = "";
    try {
      var response = await ApiGetServices().apiGetServices(
        AppApiUrl.privacyPolicyUrl,
      );

      if (response != null) {
        if (response["data"].runtimeType != Null) {
          data = response["data"]["content"];
        }
      }
      return data;
    } catch (e) {
      return data;
    }
  }

  // Get About Us
  Future<String> getAboutUsData() async {
    String data = "";
    try {
      var response = await ApiGetServices().apiGetServices(
        AppApiUrl.aboutUsUrl,
      );

      if (response != null) {
        if (response["data"].runtimeType != Null) {
          data = response["data"]["content"];
        }
      }
      return data;
    } catch (e) {
      return data;
    }
  }

  // Get Terms And Conditions
  Future<String> getTermsAndConditionsData() async {
    String data = "";
    try {
      var response = await ApiGetServices().apiGetServices(
        AppApiUrl.termsAndConditionsUrl,
      );

      if (response != null) {
        if (response["data"].runtimeType != Null) {
          data = response["data"]["content"];
        }
      }
      return data;
    } catch (e) {
      return data;
    }
  }

  // Get Notifications List
  Future<List<BookmarkModel>> getNotificationListData() async {
    List<BookmarkModel> data = <BookmarkModel>[];
    try {
      var response = await ApiGetServices().apiGetServices(
        AppApiUrl.notificationUrl,
      );

      if (response != null) {
        if (response["data"].runtimeType != Null) {
          for (var element in response["data"]) {
            data.add(BookmarkModel.fromJson(element));
          }
        }
      }
      return data;
    } catch (e) {
      return data;
    }
  }

  // Get Saved/Bookmark List
  Future<List<BookmarkModel>> getBookmarkListData() async {
    List<BookmarkModel> data = <BookmarkModel>[];
    try {
      var response = await ApiGetServices().apiGetServices(
        AppApiUrl.bookmarkListUrl,
      );

      if (response != null) {
        if (response["data"].runtimeType != Null) {
          for (var element in response["data"]) {
            data.add(BookmarkModel.fromJson(element));
          }
        }
      }
      return data;
    } catch (e) {
      return data;
    }
  }

  // Get Category List
  Future<List<BannarModel>> getBannarListData() async {
    List<BannarModel> data = <BannarModel>[];
    try {
      var response = await ApiGetServices().apiGetServices(
        AppApiUrl.getBannar,
      );

      if (response != null) {
        if (response["data"].runtimeType != Null) {
          for (var element in response["data"]) {
            data.add(BannarModel.fromJson(element));
          }
        }
      }
      return data;
    } catch (e) {
      return data;
    }
  }

  // Get Category List
  Future<List<CategoryModel>> getCategoryListData() async {
    List<CategoryModel> data = <CategoryModel>[];
    try {
      var response = await ApiGetServices().apiGetServices(
        AppApiUrl.getCategoryListUrl,
      );

      if (response != null) {
        // return data["data"];
        if (response["data"].runtimeType != Null) {
          for (var element in response["data"]) {
            data.add(CategoryModel.fromJson(element));
          }
        }
        return data;
      }
    } catch (e) {
      print("$e");
    }
    return data;
  }

  // Create Post
  Future<dynamic> createPost({body}) async {
    try {
      var data = await ApiPostServices()
          .apiPostServices(url: AppApiUrl.createPostUrl, body: body);

      if (data != null) {
        return data;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  // Get Profile data
  Future<dynamic> getProfileData() async {
    try {
      // Api Call
      var data = await ApiGetServices().apiGetServices(
        AppApiUrl.profileUrl,
      );
      if (data != null) {
        return ProfileModel.fromJson(data["data"]);
      } else {
        throw Exception("Failed to load profile data");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  // Get Notification
  // Future<dynamic> getNotificationData() async {
  //   try {
  //     // Api Call
  //     var data = await ApiGetServices().apiGetServices(
  //       AppApiUrl.notificationUrl,
  //     );
  //     if (data != null) {
  //       return GetNotificationModel.fromJson(data);
  //     } else {
  //       throw Exception("Failed to load profile data");
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return null;
  // }

  // Get Recommendation Post
  Future<List<RecommendedPostModel>> getRecommendationrPostData({
    int page = 1,
    int limit = 20,
  }) async {
    List<RecommendedPostModel> data = <RecommendedPostModel>[];
    try {
      var response = await ApiGetServices().apiGetServices(
        "${AppApiUrl.getRecommendationPostUrl}?page=$page&limit=$limit",
      );

      if (response != null) {
        if (response["data"]?["services"] != null) {
          for (var element in response["data"]["services"]) {
            data.add(RecommendedPostModel.fromJson(element));
          }
        }
      }
    } catch (e) {
      print("Error in getRecommendationrPostData: $e");
    }
    return data;
  }

  // Get Popular Post
  Future<List<PopularPostModel>> getPopularPostData({
    int page = 1,
    int limit = 20,
  }) async {
    List<PopularPostModel> data = <PopularPostModel>[];
    try {
      var response = await ApiGetServices().apiGetServices(
        "${AppApiUrl.getPopularPostUrl}?page=$page&limit=$limit",
      );

      if (response != null) {
        if (response["data"]?["services"] != null) {
          for (var element in response["data"]["services"]) {
            data.add(PopularPostModel.fromJson(element));
          }
        }
      }
    } catch (e) {
      print("Error in getPopularPostData: $e");
    }
    return data;
  }

  Future<List<SearchPagePostModel>> getSearchPostListDataInit() async {
    List<SearchPagePostModel> data = <SearchPagePostModel>[];
    try {
      var response = await ApiGetServices().apiGetServices(
          AppApiUrl.searchPostUrl,
          token: AppAuthStorage().getToken());

      if (response != null) {
        if (response["data"].runtimeType != Null) {
          final findData = response["data"];
          if (findData["service"].runtimeType != Null) {
            for (var element in findData["service"]) {
              data.add(SearchPagePostModel.fromJson(element));
            }
          }
        }
      }
    } catch (e) {
      print("$e");
    }
    return data;
  }
//  // Get Recommendation Post
//   Future<List<RecommendedPostModel>> getRecommendationrPostData({
//     int page = 1,
//     int limit = 20,
//   }) async {
//     List<RecommendedPostModel> data = <RecommendedPostModel>[];
//     try {
//       var response = await ApiGetServices().apiGetServices(
//         "${AppApiUrl.getRecommendationPostUrl}?page=$page&limit=$limit",
//       );

//       if (response != null) {
//         if (response["data"]?["services"] != null) {
//           for (var element in response["data"]["services"]) {
//             data.add(RecommendedPostModel.fromJson(element));
//           }
//         }
//       }
//     } catch (e) {
//       print("Error in getRecommendationrPostData: $e");
//     }
//     return data;
//   }

  Future<List<BookingRequestListModel>> getBookingRequestListData({
    int page = 1,
    int limit = 20,
  }) async {
    List<BookingRequestListModel> data = <BookingRequestListModel>[];
    try {
      var response = await ApiGetServices().apiGetServices(
        "${AppApiUrl.bookingRequest}?page=$page&limit=$limit",
        token: AppAuthStorage().getToken(),
      );

      if (response != null && response["data"] != null) {
        for (var element in response["data"]["offers"]) {
          data.add(BookingRequestListModel.fromJson(element));
        }
      }
    } catch (e) {
      print("$e");
    }
    return data;
  }

  Future<List<SearchPagePostModel>> getSearchPostListDataSearch({
    Map<String, dynamic>? queryParameters,
    int page = 1,
    int limit = 5,
  }) async {
    List<SearchPagePostModel> data = <SearchPagePostModel>[];
    try {
      queryParameters ??= {};
      queryParameters.addAll({"page": page, "limit": limit});

      var response = await ApiGetServices().apiGetServices(
        AppApiUrl.searchPostUrl,
        queryParameters: queryParameters,
        token: AppAuthStorage().getToken(),
      );

      if (response != null) {
        if (response["data"].runtimeType != Null) {
          final findData = response["data"];
          if (findData["service"].runtimeType != Null) {
            for (var element in findData["service"]) {
              data.add(SearchPagePostModel.fromJson(element));
            }
          }
        }
      }
    } catch (e) {
      print("$e");
    }
    return data;
  }

  // Get Popular Post
  Future<dynamic> getServiceByServiceData({String? categoryName}) async {
    List<ServiceByServiceModel> data = <ServiceByServiceModel>[];
    try {
      var response = await ApiGetServices().apiGetServices(
        "${AppApiUrl.getServiceByServiceUrl}$categoryName",
      );

      if (response != null) {
        // return data["data"];
        if (response["data"].runtimeType != Null) {
          for (var element in response["data"]) {
            data.add(ServiceByServiceModel.fromJson(element));
          }
        }
        return data;
      }
    } catch (e) {
      print("$e");
    }
    return data;
  }

  // Get My Post
  Future<List<GetPostModel>> getPostData({int page = 1, int limit = 5}) async {
    List<GetPostModel> posts = [];
    try {
      var response = await ApiGetServices().apiGetServices(
        "${AppApiUrl.getPostUrl}?page=$page&limit=$limit",
      );

      if (response != null && response["data"]?["posts"] != null) {
        for (var element in response["data"]["posts"]) {
          posts.add(GetPostModel.fromJson(element));
        }
      }
    } catch (e) {
      print("Error in getPostData: $e");
    }
    return posts;
  }

  // Get Service Details Data
  Future<ServiceDetailsModel?> getServiceDetailsData(String id) async {
    try {
      // Api Call
      var data = await ApiGetServices().apiGetServices(
        "${AppApiUrl.getServiceDetailsUrl}$id",
      );
      if (data["data"].runtimeType != Null) {
        return ServiceDetailsModel.fromJson(data["data"]);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  // Get Service Details Data
  Future<BookingRequestDetailsModel?> getBookingRequestDetailsData(
      String id) async {
    try {
      // Api Call
      var data = await ApiGetServices().apiGetServices(
        "${AppApiUrl.bookingRequest}/$id",
      );
      if (data["data"].runtimeType != Null) {
        return BookingRequestDetailsModel.fromJson(data["data"]);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  // Get Service Details Data
  Future<BookingRequestDetailsModel?> getBookingRequestChangeStatus(
      {String? id, String? status}) async {
    try {
      // Api Call
      var data = await ApiPatchServices().apiPatchServices(
        url: "${AppApiUrl.bookingRequest}/$id?status=$status",
        // body: formData,
        token: AppAuthStorage().getToken(),
      );
      // var data = await ApiGetServices().apiGetServices(
      //   "${AppApiUrl.bookingRequest}/$id?status=$status",
      // );
      if (data["data"].runtimeType != Null) {
        return BookingRequestDetailsModel.fromJson(data["data"]);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  // Create Review
  Future<dynamic> createReview(
      {String? id, String? comment, int? rating}) async {
    try {
      var data = await ApiPostServices().apiPostServices(
          url: AppApiUrl.createReviewUrl,
          body: {"service": id, "comment": comment, "rating": rating});

      if (data != null) {
        return data["data"];
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  // Create Review
  Future<dynamic> addBookmark({String? id}) async {
    try {
      var data = await ApiPostServices()
          .apiPostServices(url: "${AppApiUrl.bookmarkAddUrl}$id");

      if (data != null) {
        return data["message"];
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<List<MessageListModel>> getChatMessageListData({
    String? chatId,
    int? page,
  }) async {
    List<MessageListModel> data = <MessageListModel>[];

    try {
      var response = await ApiGetServices().apiGetServices(
        "${AppApiUrl.messageList}$chatId?page=$page&limit=20",
      );

      if (response != null) {
        if (response["data"]?["messages"] != null) {
          for (var element in response["data"]["messages"]) {
            data.add(MessageListModel.fromJson(element));
          }
        }
      }
    } catch (e) {
      print("Error in getChatMessageListData: $e");
    }

    return data;
  }

  Future<CreateChatModel?> createChat({
    String? chatId,
  }) async {
    try {
      var response = await ApiPostServices().apiPostServices(
        url: "${AppApiUrl.chatList}/$chatId",
        token: AppAuthStorage().getToken(),
      );

      if (response != null) {
        if (response["data"] != null) {
          return CreateChatModel.fromJson(response["data"]);
        }
      }
    } catch (e) {
      print("Error in getChatMessageListData: $e");
    }

    return null;
  }
}
