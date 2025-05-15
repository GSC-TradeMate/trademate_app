import 'package:get/get.dart';
import 'package:trademate_app/presentation/chat/controller/chat_main_controller.dart';

class ChatMainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatMainController());
  }
}
