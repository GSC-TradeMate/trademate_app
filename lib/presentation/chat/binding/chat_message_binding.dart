import 'package:get/get.dart';
import 'package:trademate_app/presentation/chat/controller/chat_message_controller.dart';

class ChatMessageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatMessageController());
  }
}
