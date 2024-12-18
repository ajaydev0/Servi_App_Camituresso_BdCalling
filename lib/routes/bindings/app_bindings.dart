import 'package:get/get.dart';
import 'package:servi_app_camituresso/screens/about_us_screen/controllers/about_us_screen_controller.dart';
import 'package:servi_app_camituresso/screens/add_and_edit_post_screen/controller/add_and_edit_post_screen_controller.dart';
import 'package:servi_app_camituresso/screens/add_post_successfully_screen/controllers/add_post_successfully_screen_controller.dart';
import 'package:servi_app_camituresso/screens/change_password_screen/controllers/change_password_screen_controller.dart';
import 'package:servi_app_camituresso/screens/conversation_screen/controllers/conversation_screen_controller.dart';
import 'package:servi_app_camituresso/screens/e_receipt_screen/controllers/e_receipt_screen_controller.dart';
import 'package:servi_app_camituresso/screens/edit_profile_screen/controllers/edit_profile_screen_controller.dart';
import 'package:servi_app_camituresso/screens/eighteen_plus_warning_screen/controllers/eighteen_plus_warning_screen_controller.dart';
import 'package:servi_app_camituresso/screens/list_off_view_services/controllers/list_off_view_services_controller.dart';
import 'package:servi_app_camituresso/screens/navigation_screen/controllers/navigation_screen_controller.dart';
import 'package:servi_app_camituresso/screens/payment_method_screen/controllers/payment_method_screen_controller.dart';
import 'package:servi_app_camituresso/screens/popular_view_all/controllers/popular_view_all_controller.dart';
import 'package:servi_app_camituresso/screens/privacy_and_policy_screen/controllers/privacy_and_policy_screen_controller.dart';
import 'package:servi_app_camituresso/screens/profile_screen/controllers/profile_screen_controller.dart';
import 'package:servi_app_camituresso/screens/recommendation_view_all/controllers/recommendation_view_all_controller.dart';
import 'package:servi_app_camituresso/screens/search_screen/controllers/search_screen_controller.dart';
import 'package:servi_app_camituresso/screens/services_details_screen/controllers/services_details_screen_controller.dart';
import 'package:servi_app_camituresso/screens/services_screen/controllers/services_screen_controller.dart';
import 'package:servi_app_camituresso/screens/terms_and_condition_screen/controllers/terms_and_condition_screen_controller.dart';
import 'package:servi_app_camituresso/screens/transaction_history_screen/controllers/transaction_history_screen_controller.dart';
import 'package:servi_app_camituresso/screens/user_history_screen/controllers/user_history_screen_controller.dart';

class AppBindings extends BindingsInterface {
  @override
  dependencies() {
    Get.lazyPut(() => NavigationScreenController());
    Get.lazyPut(() => AddAndEditPostScreenController());
    Get.lazyPut(() => AddPostSuccessfullyScreenController());
    Get.lazyPut(() => ServicesScreenController());
    Get.lazyPut(() => ListOffViewServicesController());
    Get.lazyPut(() => ServicesDetailsScreenController());
    Get.lazyPut(() => SearchScreenController());
    Get.lazyPut(() => EighteenPlusWarningScreenController());
    Get.lazyPut(() => ProfileScreenController());
    Get.lazyPut(() => EditProfileScreenController());
    Get.lazyPut(() => ConversationScreenController());
    Get.lazyPut(() => PaymentMethodScreenController());
    Get.lazyPut(() => AboutUsScreenController());
    Get.lazyPut(() => TermsAndConditionScreenController());
    Get.lazyPut(() => PrivacyAndPolicyScreenController());
    Get.lazyPut(() => UserHistoryScreenController());
    Get.lazyPut(() => ChangePasswordScreenController());
    Get.lazyPut(() => TransactionHistoryScreenController());
    Get.lazyPut(() => EReceiptScreenController());
    Get.lazyPut(() => PopularViewAllController());
    Get.lazyPut(() => RecommendationViewAllController());
  }
}
