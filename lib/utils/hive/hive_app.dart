import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trademate_app/utils/hive/models/session/session_model.dart';

class HiveApp {
  static Future<void> initilize() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    // 1
    Hive.registerAdapter(SessionModelAdapter());
  }
}
