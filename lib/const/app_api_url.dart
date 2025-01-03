class AppApiUrl {
  AppApiUrl._();
  static const String domaine = "http://192.168.10.102:5005";
  static const String baseUrl = "http://192.168.10.102:5005/api/v1";
  static const String token = "";
  static const String logInUrl = "$baseUrl/auth/login";
  static const String signUpUrl = "$baseUrl/user/";
  static const String signInUrl = "$baseUrl/auth/login";
  static const String verifyEmailUrl = "$baseUrl/auth/verify-email";
  static const String forgotPasswordUrl = "$baseUrl/auth/forgot-password";
  static const String resetPasswordUrl = "$baseUrl/auth/reset-password";
  static const String changePasswordUrl = "$baseUrl/auth/change-password";
  static const String profileUrl = "$baseUrl/user/profile";
  static const String updateProfileUrl = "$baseUrl/user";
  static const String createPostUrl = "$baseUrl/post/create";
  static const String updatePostUrl = "$baseUrl/post/update-post/";
  static String notificationUrl({required int page}) =>
      "$baseUrl/notification?page=$page";
  static const String getPostUrl = "$baseUrl/post/my-post";
  static const String getServiceDetailsUrl = "$baseUrl/post/";
  static const String createReviewUrl = "$baseUrl/review";
  static const String getPopularPostUrl = "$baseUrl/post/popular";
  static const String getRecommendationPostUrl = "$baseUrl/post/recommended";
  static const String getCategoryListUrl = "$baseUrl/service";
  static const String getServiceByServiceUrl = "$baseUrl/service/";
  static const String getBannar = "$baseUrl/banner";
  static const String bookmarkListUrl = "$baseUrl/bookmark";
  static const String bookmarkAddUrl = "$baseUrl/bookmark/";
  static const String termsAndConditionsUrl =
      "$baseUrl/rule/terms-and-conditions";
  static const String aboutUsUrl = "$baseUrl/rule/about";
  static const String privacyPolicyUrl = "$baseUrl/rule/privacy-policy";
  static const String searchPostUrl = "$baseUrl/post";
  static const String bookingRequest = "$baseUrl/offer";
  static const String chatUserServiceListUrl = "$baseUrl/post/user-service/";
  static const String transactionHistory = "$baseUrl/offer/transaction-history";
  static String profileImage({required String url}) => "$domaine$url";

  static const String userHistory = "$baseUrl/offer/offer-history";
  static const String createPaymentUrl = "$baseUrl/payment/create-payment";

  //////////////////////////////////////  chat
  static const String chatList = "$baseUrl/chat";
  static const String messageList = "$baseUrl/message/";
  static const String sendMessage = "$baseUrl/message";
}
