import 'package:get/get.dart';
import 'package:trademate_app/presentation/auth/controller/auth_splash_controller.dart';

class AuthSplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthSplashController());
  }
}
