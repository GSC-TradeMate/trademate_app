import 'package:get/get.dart';
import 'package:trademate_app/utils/hive/models/session/session_model.dart';
import 'package:trademate_app/utils/hive/stores/session_store.dart';
import 'package:trademate_app/utils/routes/app_routes.dart';

class AuthSplashController extends GetxController {
  void init() => _onSession();

  Future<void> _onSession() async {
    Future.delayed(const Duration(seconds: 3), () async {
      SessionModel? session = await SessionStore.get();
      if (session == null) {
        Get.offAllNamed(AppRoute.authWelcome);
      } else {
        Get.offAllNamed(AppRoute.home);
      }
    });
  }
}
