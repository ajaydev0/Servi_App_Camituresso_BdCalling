import 'package:get/get.dart';
import 'package:servi_app_camituresso/routes/Internet_check_middle_ware.dart';
import 'package:servi_app_camituresso/routes/app_routes.dart';
import 'package:servi_app_camituresso/routes/bindings/app_auth_binding.dart';
import 'package:servi_app_camituresso/routes/bindings/app_bindings.dart';
import 'package:servi_app_camituresso/routes/bindings/app_initial_binding.dart';
import 'package:servi_app_camituresso/screens/about_us_screen/about_us_screen.dart';
import 'package:servi_app_camituresso/screens/add_and_edit_post_screen/add_and_edit_post_screen.dart';
import 'package:servi_app_camituresso/screens/add_post_successfully_screen/add_post_successfully_screen.dart';
import 'package:servi_app_camituresso/screens/auth_screen/for_got_screen/for_got_screen.dart';
import 'package:servi_app_camituresso/screens/auth_screen/otp_verification_screen/otp_verification_screen.dart';
import 'package:servi_app_camituresso/screens/auth_screen/reset_password_screen/reset_password_screen.dart';
import 'package:servi_app_camituresso/screens/auth_screen/sign_in_screen/sign_in_screen.dart';
import 'package:servi_app_camituresso/screens/auth_screen/sign_up_screen/sign_up_screen.dart';
import 'package:servi_app_camituresso/screens/change_password_screen/change_password_screen.dart';
import 'package:servi_app_camituresso/screens/conversation_screen/conversation_screen.dart';
import 'package:servi_app_camituresso/screens/e_receipt_screen/e_receipt_screen.dart';
import 'package:servi_app_camituresso/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:servi_app_camituresso/screens/eighteen_plus_warning_screen/eighteen_plus_warning_screen.dart';
import 'package:servi_app_camituresso/screens/error_screen/error_screen.dart';
import 'package:servi_app_camituresso/screens/list_off_view_services/list_of_view_services.dart';
import 'package:servi_app_camituresso/screens/navigation_screen/navigation_screen.dart';
import 'package:servi_app_camituresso/screens/payment_method_screen/payment_method_screen.dart';
import 'package:servi_app_camituresso/screens/popular_view_all/popular_view_all.dart';
import 'package:servi_app_camituresso/screens/privacy_and_policy_screen/privacy_and_policy_screen.dart';
import 'package:servi_app_camituresso/screens/profile_screen/profile_screen.dart';
import 'package:servi_app_camituresso/screens/recommendation_view_all/recommendation_view_all.dart';
import 'package:servi_app_camituresso/screens/saved_screen/saved_screen.dart';
import 'package:servi_app_camituresso/screens/search_screen/search_screen.dart';
import 'package:servi_app_camituresso/screens/services_details_screen/services_details_screen.dart';
import 'package:servi_app_camituresso/screens/services_screen/services_screen.dart';
import 'package:servi_app_camituresso/screens/splash_screen/splash_screen.dart';
import 'package:servi_app_camituresso/screens/terms_and_condition_screen/terms_and_condition_screen.dart';
import 'package:servi_app_camituresso/screens/transaction_history_screen/transaction_history_screen.dart';
import 'package:servi_app_camituresso/screens/user_history_screen/user_history_screen.dart';

List<GetPage> appRoutesFile = <GetPage>[
  ////////// initial page
  GetPage(
    name: AppRoutes.initial,
    page: () => const SplashScreen(),
    binding: AppInitialBinding(),
    middlewares: [InternetCheckMiddleWare()],
  ),
  GetPage(
    name: AppRoutes.errorScreen,
    page: () => const ErrorScreen(),
  ),
  /////////// auth
  GetPage(
    name: AppRoutes.signIn,
    page: () => const SignInScreen(),
    binding: AppAuthBinding(),
    middlewares: [InternetCheckMiddleWare()],
  ),
  GetPage(
    name: AppRoutes.signUp,
    page: () => const SignUpScreen(),
    middlewares: [InternetCheckMiddleWare()],
  ),
  GetPage(
    name: AppRoutes.forGot,
    page: () => const ForGotScreen(),
    middlewares: [InternetCheckMiddleWare()],
  ),
  GetPage(
    name: AppRoutes.otpVerificationScreen,
    page: () => const OtpVerificationScreen(),
    middlewares: [InternetCheckMiddleWare()],
  ),
  GetPage(
    name: AppRoutes.resetPasswordScreen,
    page: () => const ResetPasswordScreen(),
    middlewares: [InternetCheckMiddleWare()],
  ),

  ///////////// navigation screen or main screen
  GetPage(
    name: AppRoutes.navigationScreen,
    page: () => const NavigationScreen(),
    binding: AppBindings(),
    middlewares: [InternetCheckMiddleWare()],
  ),

  GetPage(
    name: AppRoutes.addPostAndEditScreen,
    page: () => const AddAndEditPostScreen(),
    middlewares: [InternetCheckMiddleWare()],
  ),
  GetPage(
    name: AppRoutes.addPostSuccessfullyScreen,
    page: () => const AddPostSuccessfullyScreen(),
    middlewares: [InternetCheckMiddleWare()],
  ),

  /////////////  services
  GetPage(
    name: AppRoutes.servicesScreen,
    page: () => const ServicesScreen(),
    middlewares: [InternetCheckMiddleWare()],
  ),
  GetPage(
    name: AppRoutes.listOfViewServicesScreen,
    page: () => const ListOfViewServices(),
    middlewares: [InternetCheckMiddleWare()],
  ),
  GetPage(
    name: AppRoutes.servicesDetailsScreen,
    page: () => const ServicesDetailsScreen(),
    middlewares: [InternetCheckMiddleWare()],
  ),

  GetPage(
    name: AppRoutes.searchScreen,
    page: () => const SearchScreen(),
    middlewares: [InternetCheckMiddleWare()],
  ),
  GetPage(
    name: AppRoutes.eighteenPlusWarningScreen,
    page: () => const EighteenPlusWarningScreen(),
    middlewares: [InternetCheckMiddleWare()],
  ),

  ////////////////////  profile
  GetPage(
    name: AppRoutes.profileScreen,
    page: () => const ProfileScreen(),
    middlewares: [InternetCheckMiddleWare()],
  ),

  GetPage(
    name: AppRoutes.editProfileScreen,
    page: () => const EditProfileScreen(),
    middlewares: [InternetCheckMiddleWare()],
  ),

  ////////////////// conversation  screen
  GetPage(
    name: AppRoutes.conversationScreen,
    page: () => const ConversationScreen(),
    middlewares: [InternetCheckMiddleWare()],
  ),

  ///////////////// payment
  GetPage(
    name: AppRoutes.paymentMethodScreen,
    page: () => const PaymentMethodScreen(),
    middlewares: [InternetCheckMiddleWare()],
  ),

  /////////////// more screens
  GetPage(
    name: AppRoutes.aboutUsScreen,
    page: () => const AboutUsScreen(),
    middlewares: [InternetCheckMiddleWare()],
  ),
  GetPage(
    name: AppRoutes.termsAndConditionScreen,
    page: () => const TermsAndConditionScreen(),
    middlewares: [InternetCheckMiddleWare()],
  ),
  GetPage(
    name: AppRoutes.privacyAndPolicyScreen,
    page: () => const PrivacyAndPolicyScreen(),
    middlewares: [InternetCheckMiddleWare()],
  ),

  ////////////////// account
  GetPage(
    name: AppRoutes.userHistoryScreen,
    page: () => const UserHistoryScreen(),
    middlewares: [InternetCheckMiddleWare()],
  ),
  GetPage(
    name: AppRoutes.changePasswordScreen,
    page: () => const ChangePasswordScreen(),
    middlewares: [InternetCheckMiddleWare()],
  ),
  GetPage(
    name: AppRoutes.transactionHistoryScreen,
    page: () => const TransactionHistoryScreen(),
    middlewares: [InternetCheckMiddleWare()],
  ),

  ///////////  receipt
  GetPage(
    name: AppRoutes.eReceiptScreen,
    page: () => const EReceiptScreen(),
    middlewares: [InternetCheckMiddleWare()],
  ),
  //////////////////////////////////////////////////////////////// Aj Raw Code
  GetPage(
    name: AppRoutes.popularViewAllScreen,
    page: () => const PopularViewAll(),
    middlewares: [InternetCheckMiddleWare()],
  ),
  GetPage(
    name: AppRoutes.recommendationViewAllScreen,
    page: () => const RecommendationViewAll(),
    middlewares: [InternetCheckMiddleWare()],
  ),
  GetPage(
    name: AppRoutes.savedScreen,
    page: () => const SavedScreen(),
    middlewares: [InternetCheckMiddleWare()],
  ),
];
