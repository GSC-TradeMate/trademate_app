import 'package:dio/dio.dart';
import 'package:trademate_app/utils/constant.dart';

class Axe {
  static Dio core = Dio(
    BaseOptions(baseUrl: Constant.API_HTTP_URI),
  );
}
