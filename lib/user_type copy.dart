import 'package:get/get.dart';

enum UserType { user, musician }

UserType selectedUser = UserType.user;
RxBool isDrawerOpen = RxBool(false);
