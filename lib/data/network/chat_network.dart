import 'package:trademate_app/data/axe.dart';
import 'package:trademate_app/data/entity/chat/chat_entity.dart';
import 'package:trademate_app/utils/hive/models/session/session_model.dart';
import 'package:trademate_app/utils/hive/stores/session_store.dart';

class ChatNetwork {
  static Future<List<ChatEntity>> getChats() async {
    try {
      SessionModel? session = await SessionStore.get();
      List<ChatEntity> r = [];
      var res = await Axe.core
          .get("/chat/messages", options: session?.optionWithAuth);
      if (res.data["data"] == null) {
        return [];
      }

      for (var item in res.data["data"]) {
        r.add(ChatEntity.fromJson(item));
      }
      return r;
    } catch (e) {
      rethrow;
    }
  }
}
