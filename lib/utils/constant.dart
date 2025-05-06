// ignore_for_file: non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constant {
  static Future<void> load() async => await dotenv.load(fileName: ".env");

  static String get CORE_FUNCTION => dotenv.get("CORE_FUNCTION");
  static String get MINIO_HOST => dotenv.get("MINIO_HOST");
}
