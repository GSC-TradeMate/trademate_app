import 'package:trademate_app/data/network/chat_network.dart';

class ChatRepo {
  static Future<String> getUserChats() async =>
      await ChatNetwork.getChats();
}
