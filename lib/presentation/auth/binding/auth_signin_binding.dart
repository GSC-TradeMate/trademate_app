import 'package:get/get.dart';
import 'package:trademate_app/presentation/auth/controller/auth_signin_controller.dart';

class AuthSigninBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthSigninController());
  }
}
