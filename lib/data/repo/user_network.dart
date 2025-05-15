
import 'package:trademate_app/data/network/user_network.dart';

class UserRepo {
  static Future<String> getUserInfo() async =>
      await UserNetwork.getUserInfo();
}
