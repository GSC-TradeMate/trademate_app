import 'package:trademate_app/data/entity/chat/chat_entity.dart';
import 'package:trademate_app/data/entity/chat/message_entity.dart';
import 'package:trademate_app/data/network/chat_network.dart';

class ChatRepo {
  static Future<List<ChatEntity>> getUserChats() async =>
      await ChatNetwork.getChats();

  static Future<List<MessageEntity>> messageDetail(String chatId,
          {required bool sync}) async =>
      await ChatNetwork.messageDetail(chatId, sync: sync);
}
