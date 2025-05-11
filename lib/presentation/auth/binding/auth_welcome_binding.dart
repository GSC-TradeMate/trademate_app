import 'package:get/get.dart';
import 'package:trademate_app/presentation/auth/controller/auth_welcome_controller.dart';

class AuthWelcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthWelcomeController());
  }
}
