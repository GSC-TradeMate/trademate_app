class ChatEntity {
  final String id;
  final String name;
  final int unreadCount;
  final int? ack;
  final String? body;
  final bool? viewed;
  final DateTime createdAt;

  ChatEntity({
    required this.id,
    required this.name,
    required this.unreadCount,
    required this.ack,
    required this.body,
    required this.viewed,
    required this.createdAt,
  });

  factory ChatEntity.fromJson(Map<String, dynamic> json) {
    return ChatEntity(
      id: json['id']["_serialized"],
      name: json['name'],
      unreadCount: json['unreadCount'],
      ack: json["lastMessage"]?['ack'],
      body: json["lastMessage"]?["_data"]?['body'],
      viewed: json["lastMessage"]?["_data"]?['viewed'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(json["timestamp"] * 1000),
    );
  }
}
