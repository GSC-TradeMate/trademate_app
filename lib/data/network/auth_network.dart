import 'package:trademate_app/data/axe.dart';

class AuthNetwork {
  static Future<String> createSignInCode() async {
    try {
      var res = await Axe.core.get("/auth/create-signin-code");
      return res.data["data"]["code"];
    } catch (e) {
      rethrow;
    }
  }
}
