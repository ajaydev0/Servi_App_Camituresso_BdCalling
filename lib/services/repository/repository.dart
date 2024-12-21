import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/screens/home_screen/model/bannar_model.dart';
import 'package:servi_app_camituresso/screens/popular_view_all/model/get_popular_post_model.dart';
import 'package:servi_app_camituresso/screens/profile_screen/models/profile_screen_model.dart';
import 'package:servi_app_camituresso/screens/recommendation_view_all/model/get_recommended_post_model.dart';
import 'package:servi_app_camituresso/screens/saved_screen/model/get_popular_post_model.dart';
import 'package:servi_app_camituresso/screens/services_details_screen/models/service_details_model.dart';
import 'package:servi_app_camituresso/services/api/services/api_get_services.dart';
import 'package:servi_app_camituresso/services/api/services/api_post_services.dart';

class Repository {
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
  Future<dynamic> getCategoryListData() async {
    try {
      var data = await ApiGetServices().apiGetServices(
        AppApiUrl.getCategoryListUrl,
      );

      if (data != null) {
        return data["data"];
      }
    } catch (e) {
      return null;
    }
    return null;
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
  Future<dynamic> getRecommendationrPostData() async {
    List<RecommendedPostModel> data = <RecommendedPostModel>[];
    try {
      var response = await ApiGetServices().apiGetServices(
        AppApiUrl.getRecommendationPostUrl,
      );

      if (response != null) {
        // return data["data"];
        if (response["data"].runtimeType != Null) {
          for (var element in response["data"]) {
            data.add(RecommendedPostModel.fromJson(element));
          }
        }
        return data;
      }
    } catch (e) {
      print("$e");
    }
    return data;

    // try {
    //   var data = await ApiGetServices().apiGetServices(
    //     AppApiUrl.getRecommendationPostUrl,
    //   );

    //   if (data != null) {
    //     return data["data"];
    //   }
    // } catch (e) {
    //   return null;
    // }
    // return null;
  }

  // Get Popular Post
  Future<dynamic> getPopularPostData() async {
    List<PopularPostModel> data = <PopularPostModel>[];
    try {
      var response = await ApiGetServices().apiGetServices(
        AppApiUrl.getPopularPostUrl,
      );

      if (response != null) {
        // return data["data"];
        if (response["data"].runtimeType != Null) {
          for (var element in response["data"]) {
            data.add(PopularPostModel.fromJson(element));
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
  Future<dynamic> getPostData() async {
    try {
      var data = await ApiGetServices().apiGetServices(
        AppApiUrl.getPostUrl,
      );

      if (data != null) {
        return data["data"];
      }
    } catch (e) {
      return null;
    }
    return null;
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
}
