import 'package:get/get.dart';
import 'package:trademate_app/presentation/chat/param/chat_message_param.dart';

class ChatMessageController extends GetxController {
  late ChatMessageParam param;

  void init(ChatMessageParam param) {
    this.param = param;
  }
}
