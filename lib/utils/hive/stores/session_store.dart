import 'package:hive/hive.dart';
import 'package:trademate_app/utils/hive/models/session/session_model.dart';

class SessionStore {
  static const String key = "store_session";

  static Future<SessionModel?> get() async {
    Box<SessionModel>? box = await Hive.openBox<SessionModel>(key);
    return box.values.firstOrNull;
  }

  static Future<void> clear() async {
    Box<SessionModel>? box = await Hive.openBox<SessionModel>(key);
    await box.clear();
  }

  static Future<void> set(SessionModel model) async {
    Box<SessionModel>? box = await Hive.openBox<SessionModel>(key);
    await box.add(model);
  }

  static Future<void> update(SessionModel model) async {
    await clear();
    await set(model);
  }
}
