// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constant {
  static Future<void> load() async => await dotenv.load(fileName: ".env");
  static String get TM_WEB_URI => dotenv.get("TM_WEB_URI");
  static String get SOCKET_PRODUCTION_HOSTNAME =>
      dotenv.get("SOCKET_DEVELOPMENT_HOSTNAME");
  static String get SOCKET_DEVELOPMENT_HOSTNAME =>
      dotenv.get("SOCKET_DEVELOPMENT_HOSTNAME");
  static String get API_PRODUCTION_HOSTNAME =>
      dotenv.get("API_PRODUCTION_HOSTNAME");
  static String get API_DEVELOPMENT_HOSTNAME =>
      dotenv.get("API_DEVELOPMENT_HOSTNAME");

  static String get API_HTTP_URI {
    switch (CURRENT_ENVIRONMENT) {
      case Environment.PROD:
        return "https://$API_PRODUCTION_HOSTNAME";
      case Environment.DEV:
        return "http://$API_DEVELOPMENT_HOSTNAME";
    }
  }

  static String get SOCKET_HTTP_URI {
    switch (CURRENT_ENVIRONMENT) {
      case Environment.PROD:
        return "https://$SOCKET_PRODUCTION_HOSTNAME";
      case Environment.DEV:
        return "http://$SOCKET_DEVELOPMENT_HOSTNAME";
    }
  }

  static Environment get CURRENT_ENVIRONMENT {
    String env = dotenv.get("CURRENT_ENVIRONMENT", fallback: "PROD");
    switch (env) {
      case "PROD":
        return Environment.PROD;
      case "DEV":
        return Environment.DEV;
      default:
        return Environment.PROD;
    }
  }
}

enum Environment {
  PROD,
  DEV,
}
