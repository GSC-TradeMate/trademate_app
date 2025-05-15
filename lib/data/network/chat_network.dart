import 'package:trademate_app/data/axe.dart';

class ChatNetwork {
  static Future<String> getChats() async {
    try {
      var res = await Axe.core.get("/chat/messages");
      return res.data["data"]["name"];
    } catch (e) {
      rethrow;
    }
  }
}
