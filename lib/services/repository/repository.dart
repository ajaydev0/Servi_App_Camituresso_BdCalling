import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/screens/list_off_view_services/model/get_post_model.dart';
import 'package:servi_app_camituresso/screens/navigation_screen/model/notification_model.dart';
import 'package:servi_app_camituresso/screens/profile_screen/models/profile_screen_model.dart';
import 'package:servi_app_camituresso/services/api/services/api_get_services.dart';
import 'package:servi_app_camituresso/services/api/services/api_post_services.dart';

class Repository {
  // Get Profile data
  Future<dynamic> getProfileData() async {
    try {
      // Api Call
      var data = await ApiGetServices().apiGetServices(
        AppApiUrl.profileUrl,
      );
      if (data != null) {
        return ProfileModel.fromJson(data);
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

  // Get Post
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
  Future<dynamic> getServiceDetailsData(String id) async {
    try {
      var data = await ApiGetServices().apiGetServices(
        "${AppApiUrl.getServiceDetailsUrl}$id",
      );

      if (data != null) {
        return data["data"];
      }
    } catch (e) {
      return null;
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
