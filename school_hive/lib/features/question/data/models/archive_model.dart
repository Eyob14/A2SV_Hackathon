class ArchiveModel {
  ArchiveModel({
    required this.id,
    required this.name,
    required this.fileAddress,
    required this.cloudinaryId,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String name;
  final String fileAddress;
  final String cloudinaryId;
  final DateTime createdAt;
  final DateTime updatedAt;

  ArchiveModel copyWith({
    String? id,
    String? name,
    String? fileAddress,
    String? cloudinaryId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ArchiveModel(
        id: id ?? this.id,
        name: name ?? this.name,
        fileAddress: fileAddress ?? this.fileAddress,
        cloudinaryId: cloudinaryId ?? this.cloudinaryId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ArchiveModel.fromJson(Map<String, dynamic> json) => ArchiveModel(
        id: json["_id"],
        name: json["name"],
        fileAddress: json["fileAddress"],
        cloudinaryId: json["cloudinaryId"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "fileAddress": fileAddress,
        "cloudinaryId": cloudinaryId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
