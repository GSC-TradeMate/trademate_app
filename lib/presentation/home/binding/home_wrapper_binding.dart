import 'package:get/get.dart';
import 'package:trademate_app/presentation/chat/controller/chat_main_controller.dart';
import 'package:trademate_app/presentation/profile/controller/profile_main_controller.dart';

class HomeWrapperBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatMainController());
    Get.lazyPut(() => ProfileMainController());
  }
}
