import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademate_app/presentation/chat/controller/chat_message_controller.dart';
import 'package:trademate_app/presentation/chat/param/chat_message_param.dart';

class ChatMessageView extends StatefulWidget {
  const ChatMessageView({super.key});

  @override
  State<ChatMessageView> createState() => _ChatMessageViewState();
}

class _ChatMessageViewState extends State<ChatMessageView> {
  final ChatMessageController _con = Get.find();
  ChatMessageParam param = Get.arguments;

  @override
  void initState() {
    super.initState();
    //
    _con.init(param);
  }

  @override
  void dispose() {
    //
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
