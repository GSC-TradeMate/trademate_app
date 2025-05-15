import 'package:trademate_app/data/axe.dart';
import 'package:trademate_app/data/entity/profile/profile_entity.dart';
import 'package:trademate_app/utils/hive/models/session/session_model.dart';
import 'package:trademate_app/utils/hive/stores/session_store.dart';

class ProfileNetwork {
  static Future<ProfileEntity?> getUserInfo() async {
    try {
      SessionModel? session = await SessionStore.get();

      var res =
          await Axe.core.get("/user/info", options: session?.optionWithAuth);
      if (res.data["info"] == null) {
        return null;
      }
      return ProfileEntity.fromJson(res.data["info"]);
    } catch (e) {
      rethrow;
    }
  }
}
