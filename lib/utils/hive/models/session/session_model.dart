import 'package:hive/hive.dart';

part 'session_model.g.dart';

@HiveType(typeId: 1)
class SessionModel extends HiveObject {
  @HiveField(0)
  final String token;
  @HiveField(1)
  final DateTime expiresAt;
  @HiveField(2)
  final String code;

  SessionModel({
    required this.token,
    required this.expiresAt,
    required this.code,
  });

  static SessionModel fromMap(Map x) => SessionModel(
        token: x["token"]["uid"],
        expiresAt: DateTime.parse(x["token"]["expiresAt"]),
        code: x["session"]["code"],
      );

  String get bearerToken => "Bearer $token";
}
