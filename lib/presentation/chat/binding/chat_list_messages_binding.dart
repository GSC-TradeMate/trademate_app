import 'package:get/get.dart';
import 'package:trademate_app/presentation/chat/controller/chat_list_message_controller.dart';

class ChatListMessagesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatListMessageController());
  }
}
