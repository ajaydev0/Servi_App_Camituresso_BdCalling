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
  static const String notificationUrl = "$baseUrl/notification";
  static const String getPostUrl = "$baseUrl/post/my-post";
  static const String getServiceDetailsUrl = "$baseUrl/post/";
  static const String createReviewUrl = "$baseUrl/review";
}
