import 'package:trademate_app/data/entity/profile/profile_entity.dart';
import 'package:trademate_app/data/network/profile_network.dart';

class ProfileRepo {
  static Future<ProfileEntity?> getUserInfo() async =>
      await ProfileNetwork.getUserInfo();
}
