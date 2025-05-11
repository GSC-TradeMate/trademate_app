import 'package:trademate_app/data/network/auth_network.dart';

class AuthRepo {
  static Future<String> createSignInCode() async =>
      await AuthNetwork.createSignInCode();
}
