import 'package:trademate_app/data/entity/chat/message_type.dart';

class MessageEntity {
  final String id;
  final String interlocutor;
  final String? content;
  final bool fromMe;
  final int? ack;
  final bool isForwarded;
  final MessageType type;
  final DateTime createdAt;

  MessageEntity({
    required this.id,
    required this.interlocutor,
    this.content,
    required this.fromMe,
    this.ack,
    required this.type,
    required this.createdAt,
    required this.isForwarded,
  });

  factory MessageEntity.fromJson(Map<String, dynamic> json) {
    String? content;
    if (json['_data']["body"] != null) {
      if (json['_data']["body"].isNotEmpty) {
        content = json['_data']["body"];
      }
    }
    if (json["isGif"]) content = "<< GIF >>";
    return MessageEntity(
      id: json['_data']['id']["id"],
      interlocutor: json['_data']["id"]["remote"],
      content: content,
      fromMe: json['fromMe'],
      ack: json['ack'],
      type: messageTypeFromString(json['type']),
      createdAt: DateTime.fromMillisecondsSinceEpoch(json["timestamp"] * 1000),
      isForwarded: json["isForwarded"] ?? false,
    );
  }
}
