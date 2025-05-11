import 'package:get/get.dart';
import 'package:trademate_app/utils/routes/app_routes.dart';

class AuthSplashController extends GetxController {
  void init() => _onSession();

  Future<void> _onSession() async {
    Future.delayed(const Duration(seconds: 4), () {
      Get.offAllNamed(AppRoute.authWelcome);
    });
  }
}
