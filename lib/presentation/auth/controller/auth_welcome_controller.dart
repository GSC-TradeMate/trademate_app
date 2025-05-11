import 'package:get/get.dart';
import 'package:trademate_app/utils/routes/app_routes.dart';

class AuthWelcomeController extends GetxController {
  void init() {}
  void handleSignin() => Get.toNamed(AppRoute.authSignin);
}
