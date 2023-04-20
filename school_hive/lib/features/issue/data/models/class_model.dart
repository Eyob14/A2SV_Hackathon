class ClassModel {
  ClassModel({
    required this.id,
    required this.name,
    required this.owner,
    required this.chatLink,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String name;
  final String owner;
  final String chatLink;
  final DateTime createdAt;
  final DateTime updatedAt;

  ClassModel copyWith({
    String? id,
    String? name,
    String? owner,
    String? chatLink,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ClassModel(
        id: id ?? this.id,
        name: name ?? this.name,
        owner: owner ?? this.owner,
        chatLink: chatLink ?? this.chatLink,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
        id: json["_id"],
        name: json["name"],
        owner: json["owner"],
        chatLink: json["chatLink"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "owner": owner,
        "chatLink": chatLink,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
