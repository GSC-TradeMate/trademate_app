class ProfileEntity {
  final String id;
  final String name;

  ProfileEntity({
    required this.id,
    required this.name,
  });

  factory ProfileEntity.fromJson(Map<String, dynamic> json) {
    return ProfileEntity(
      id: json["wid"]["_serialized"],
      name: json["pushname"],
    );
  }
}
