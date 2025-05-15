import 'package:trademate_app/data/axe.dart';

class UserNetwork {
  static Future<String> getUserInfo() async {
    try {
      var res = await Axe.core.get("/user/info");
      return res.data["info"]["pushname"];
    } catch (e) {
      rethrow;
    }
  }
}
